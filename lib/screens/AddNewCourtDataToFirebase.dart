import 'package:flutter/material.dart';
import 'package:moplieproject/data/DatabaseHelper.dart';
import 'package:moplieproject/data/court_model.dart';


class AddNewCourtDataToFirebase extends StatelessWidget{
  final nameController = TextEditingController();
  final imagePathController = TextEditingController();
  final placeController = TextEditingController();
  final priceController = TextEditingController();


  final GlobalKey<ScaffoldMessengerState> _scaffoldMessegerKey = GlobalKey<ScaffoldMessengerState>();

  AddNewCourtDataToFirebase({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Create New Castle',
      home: ScaffoldMessenger(
        key: _scaffoldMessegerKey,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: "Name: "),
                  ),
                  TextField(
                    controller: imagePathController,
                    decoration: const InputDecoration(labelText: "Image Path: "),
                  ),
                  TextField(
                    controller: placeController,
                    decoration: const InputDecoration(labelText: "Place: "),
                  ),
                  TextField(
                    controller: priceController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(labelText: "Ticket Price"),
                  ),
                  ElevatedButton(
                    child: const Text('Save'),
                    onPressed: (){
                      CourtData courtData = CourtData(
                        imagePathController.text,
                        nameController.text,
                        placeController.text,
                        double.parse(priceController.text),
                      );
                      DatabaseHelper.addNew(courtData).then((_){
                        _scaffoldMessegerKey.currentState?.showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Data saved successfully",
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      }).catchError((error){
                        _scaffoldMessegerKey.currentState?.showSnackBar(
                          SnackBar(
                            content: Text(
                              "Failed to save data: $error",
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.red,
                          )
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
        ),
        ),
      ),
    );
  }
}