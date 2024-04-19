// Import necessary Flutter and Dart packages.
import 'package:flutter/material.dart';  // Basic Flutter material design visual and interaction design widgets.
import 'package:moplieproject/data/DatabaseHelper.dart';  // Custom import for database operations, specific to your project.
import '../data/court_model.dart';  // Importing model classes for 'Court'.
import 'CourtInfo.dart';
// Definition of a StatefulWidget, which can rebuild its state when data changes.
class DynamicScreen extends StatefulWidget {
  const DynamicScreen({super.key});  // Constructor with optional key.

  @override
  State<DynamicScreen> createState() => _DynamicScreenState();  // Creates the mutable state for this widget.
}

// Private State class for DynamicScreen, managing state specific to this widget.
class _DynamicScreenState extends State<DynamicScreen> {
  List<Court> courtList = [];  // Declaration of a list to hold Court objects, initially empty.

  @override
  void initState() {  // Initial state setup function.
    super.initState();  // Calls the initState of the superclass (State).
    DatabaseHelper.readFirebaseRealtimeDBMain((courtList) {  // Asynchronously reads data from Firebase, expecting a list of Court objects.
      setState(() {  // Triggers a rebuild of the widget in response to state changes.
        this.courtList = courtList;  // Updates the courtList with the data received from Firebase.
      });
    });
  }

  @override
  Widget build(BuildContext context) {  // Build method that describes the part of the user interface represented by this widget.
    return Scaffold(  // Scaffold provides the high-level structure for a screen.
      body: Center(  // Centers the child widget within the parent.
        child: Padding(  // Adds padding around the child widget.
          padding: const EdgeInsets.all(20.0),  // Uniform padding of 20 pixels on all sides.
          child: ListView(  // A scrollable list of widgets.
            children: [  // List of child widgets.
              Column(  // A vertical arrangement of widgets.
                children: [
                  const SizedBox(  // Box with a specified size.
                    height: 20,  // Height of 20 pixels, typically used for spacing.
                  ),
                  for (int i = 0; i < courtList.length; i++) ...{  // Loop through each item in courtList.
                    CourtInfo(court: courtList[i]),  // Custom widget that displays info about a court.
                    const SizedBox(  // Another box for spacing.
                      height: 20,  // Height of 20 pixels.
                    ),
                  }
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
