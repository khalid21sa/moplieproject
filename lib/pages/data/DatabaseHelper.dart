import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'court_model.dart';

class DatabaseHelper {
  static Future<void> deleteCastle(String key) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    await databaseReference.child("castles").child(key).remove();
  }

  static Future<void> updateCastleData(
      String key, CourtData castleData, BuildContext context) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    await databaseReference
        .child("castles")
        .child(key)
        .update(castleData.toJson()).then((_) {
      // Show a snackbar on successful update
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Operation updated successfully')),
      );
    }).catchError((error) {
      // Handle errors and show a different snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Failed to update: ${error.toString()}')),
      );
    });
  }

  static Future<void> addNewCastle(CourtData castleData) {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    return databaseReference
        .child('castles')
        .push()
        .set(castleData.toJson())
        .then((value) => print("Castle created successfully!"))
        .catchError((error) => print("Failed to create castle data: $error"));
  }

  static void readFirebaseRealtimeDBMain(
      Function(List<court>) castleListCallback) {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child("padlecourt").onValue.listen((castleDataJson) {
      if (castleDataJson.snapshot.exists) {
        CourtData castleData;
        court castle;
        List<court> castleList = [];
        castleDataJson.snapshot.children.forEach((element) {
//print("Element Key: ${element.key}");
//print("Element: ${element.value}");
          castleData = CourtData.fromJson(element.value as Map);
          castle = court(element.key, castleData);
          castleList.add(castle);
        });
        castleListCallback(castleList);
      } else {
        print("The data snapshot does not exist!");
      }
    });
  }

  static void createFirebaseRealtimeDBWithUniqueIDs(
      String mainNodeName, List<Map<String, dynamic>> fortList) {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref(mainNodeName);
    if (fortList.isNotEmpty) {
      fortList.forEach((fort) {
        databaseReference
            .push()
            .set(fort)
            .then((value) => print("FortList data successfully saved!"))
            .catchError((error) => print("Failed to write message: $error"));
      });
    } else {
      print("Fortlist is empty!");
    }
  }

  static void writeMessageToFirebase() {
    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference
        .child('messages')
        .set({'message': 'HelloWorld'})
        .then((value) => print("Message written successfully"))
        .catchError((error) => print("Failed to write message: $error"));
  }
}
