import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatelessWidget {

  final DatabaseReference databaseRef = FirebaseDatabase.instance.reference();

  void sendMessageToFirebase() {
    databaseRef.child('messages').push().set({'message': 'Hello from Button'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sendMessageToFirebase();
        },
        tooltip: 'Send Message',
        child: Icon(Icons.send),
      ),
    );
  }
}
