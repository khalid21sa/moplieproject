// Import statements for the packages and other Dart files you are using in your application.
import 'package:flutter/material.dart';
import '../data/court_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../data/DatabaseHelper.dart';
import 'CastleCreationUpdateScreen.dart';
import 'ImageDecoration.dart';
import 'appStyle.dart';

// A StatefulWidget that requires a Court object to be passed in.
class CastleDetailScreen extends StatefulWidget {
  final Court court;

  // Constructor of the CastleDetailScreen with a required Court object.
  const CastleDetailScreen({super.key, required this.court});

  @override
  // Create the state for your StatefulWidget.
  State<CastleDetailScreen> createState() => _CastleDetailScreenState();
}

// The state class for CastleDetailScreen.
class _CastleDetailScreenState extends State<CastleDetailScreen> {
  // Variables for managing the quantity and cost of tickets.
  int _ticketQuantity = 1;
  double _ticketPrice = 0, _runningCost = 0;

  @override
  // The build method of the state class, which creates the UI for your screen.
  Widget build(BuildContext context) {
    // Assigning values to ticketPrice and runningCost using the court data passed in.
    _ticketPrice = widget.court.courtData?.ticketPrice ?? 0.0;
    _runningCost = _ticketQuantity * _ticketPrice;

    // Scaffold is the layout structure for the Material app.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.court.courtData?.name ?? 'Castle Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Conditional image display, showing a placeholder if imagePath is null.
            widget.court.courtData?.imagePath != null
                ? ImageDecoration(
                imagePath: widget.court.courtData!.imagePath!)
                : const SizedBox(height: 200, child: Placeholder()),

            const SizedBox(height: 20),
            // Displaying name of the castle with custom styles.
            Row(
              children: [
                Text(
                  "Name: ",
                  style: AppStyles.headlineStyle1,
                ),
                Text(
                  widget.court.courtData?.name ?? 'N/A',
                  style: AppStyles.headlineStyle2,
                ),
              ],
            ),

            const SizedBox(height: 10),
            // Displaying the place of the castle with custom styles.
            Text(
              'Place: ${widget.court.courtData?.place ?? 'N/A'}',
              style: AppStyles.headlineStyle2,
            ),
            // Displaying the year the castle was established with custom styles.
            Text(
              'Established: ${widget.court.courtData?.yearEstablished ?? 'N/A'}',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            // Displaying the ticket price of the castle with custom styles.
            Text(
              'Ticket Price: \$${widget.court.courtData?.ticketPrice?.toStringAsFixed(2) ?? 'N/A'}',
              style: AppStyles.headlineStyle2,
            ),
            const SizedBox(height: 20),
            // A section to select the quantity of tickets.
            Text(
              'Select Ticket Quantity:',
              style: AppStyles.headlineStyle2,
            ),
            // Slider widget to select the ticket quantity.
            Slider(
              value: _ticketQuantity.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              label: _ticketQuantity.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _ticketQuantity = value.toInt();
                });
              },
            ),
            const SizedBox(height: 20),
            // Displaying the running cost based on selected ticket quantity.
            Text(
              'Running Cost: OMR ${_runningCost.toStringAsFixed(2)}',
              style: AppStyles.headlineStyle1,
            ),
            const SizedBox(height: 20),

            // RatingBar for rating the castle.
            RatingBar.builder(
              initialRating: widget.court.courtData?.starRating ?? 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                // Update the rating in the database when a new rating is given.
                setState(() {
                  widget.court.courtData?.starRating = rating;
                });
                DatabaseHelper.update(widget.court.key!, widget.court.courtData!, context);
              },
            ),
            const SizedBox(height: 10),
            // Button to navigate to the update screen for the castle.
            ElevatedButton(onPressed: updateCastle, child: const Text("Update")),
            const SizedBox(height: 10),
            // Button to initiate the deletion of the castle.
            ElevatedButton(
              onPressed: () => _deleteCastle(),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Delete Castle'),
            ),
            const SizedBox(height: 10),
            // Button to navigate back to the main screen.
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back to Main"),
            ),
          ],
        ),
      ),
    );
  }

  // A method to delete the castle, involving a confirmation dialog.
  void _deleteCastle() {
    if (widget.court.key != null && widget.court.courtData?.name != null) {
      String castleName = widget.court.courtData!.name!;
      // Showing a dialog to confirm the deletion.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Deletion'),
            content: Text('Are you sure you want to delete the castle $castleName?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss the dialog.
                },
              ),
              TextButton(
                onPressed: () {
                  // Call the database helper to delete the castle entry.
                  DatabaseHelper.delete(widget.court.key!);
                  Navigator.of(context).pop(); // Dismiss the dialog.
                  // Show a confirmation snackbar.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$castleName castle deleted')),
                  );
                  // Navigate back to the main screen after deletion.
                  Navigator.pop(context);
                },
                child: const Text('Delete'),
              ),
            ],
          );
        },
      );
    }
  }

  // A method to navigate to the CastleCreationUpdateScreen to update the castle details.
  void updateCastle() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CastleCreationUpdateScreen(isUpdate: true, court: widget.court,),
      ),
    );
  }
}
