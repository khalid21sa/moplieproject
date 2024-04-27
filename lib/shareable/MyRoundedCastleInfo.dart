// Import the necessary Flutter materials and custom classes for the widget.
import 'package:flutter/material.dart';
import '../data/court_model.dart';
import '../screens/CastleDetailScreen.dart';
import '../screens/appStyle.dart';

// Define a stateless widget called MyRoundedCastleInfo.
class MyRoundedCastleInfo extends StatelessWidget {
  // Declare a nullable Court object to hold data about a court.
  final Court? court;

  // Constructor accepting a court object and setting a key for the parent class.
  const MyRoundedCastleInfo({super.key, required this.court});

  @override
  // Build method to define the UI of the widget.
  Widget build(BuildContext context) {
    // GestureDetector to handle tap events on the widget.
    return GestureDetector(
      // Define the onTap callback to navigate to a new screen if court is not null.
      onTap: (){
        if (court != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CastleDetailScreen(court: court!), // Navigate to the CastleDetailScreen with the current court.
            ),
          );
        }
      },
      // Define the child widget inside the GestureDetector.
      child: Padding(
        // Apply padding around the container.
        padding: const EdgeInsets.all(12.0),
        child: Container(
          // Set the height of the container.
          height: 475,
          // Calculate the width of the container to be 75% of the screen width.
          width: 0.75 * MediaQuery.of(context).size.width,
          // Decorate the container with a purple background and rounded corners.
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(15),
          ),
          // Column widget to arrange child widgets vertically.
          child: Column(
            children: [
              // Padding widget to add space around the image container.
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  // Set the height of the image container.
                  height: 250,
                  // Decoration for the image container.
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.lightGreenAccent,
                      image: DecorationImage(
                        // Fit the image to cover the container space.
                        fit: BoxFit.cover,
                        // Use the image path from the court data.
                        image: AssetImage("image/${court?.courtData?.imagePath}"),
                      )),
                ),
              ),
              // Padding for the text section.
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Stack(
                  children: [
                    Container(
                      // Set the height of the text container.
                      height: 160,
                      // Decorate the text container with rounded corners and a light green background.
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.lightGreen,
                      ),
                      child: Padding(
                        // Apply symmetric padding for the text inside the container.
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Row(
                          // Align text widgets to space between them.
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Column for label texts.
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name:", style: AppStyles.headlineStyle1),
                                Text("Place:", style: AppStyles.headlineStyle1),
                                Text("Year:", style: AppStyles.headlineStyle1),
                              ],
                            ),
                            // Column for court data texts.
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(court!.courtData!.name.toString(), style: AppStyles.headlineStyle1),
                                Text(court!.courtData!.place.toString(), style: AppStyles.headlineStyle1),
                                Text(court!.courtData!.yearEstablished.toString(), style: AppStyles.headlineStyle1),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Method to navigate to the detail screen, not used in the current widget structure.
  // goToDetail(BuildContext context) {
  //   if (court != null) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => CastleDetailScreen(court: court!),
  //       ),
  //     );
  //   }
  // }
}
