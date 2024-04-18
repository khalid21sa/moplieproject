// Import Flutter material design package.
import 'package:flutter/material.dart';

// Import the Court model which likely contains the data structure for the court information.
import '../data/court_model.dart';

// Define a stateless widget which means it does not manage any state changes internally.
class CourtInfo extends StatelessWidget {
  final Court? court;  // Optional Court object.

  // Constructor accepting a potentially null Court object.
  const CourtInfo({super.key, required this.court});

  @override
  Widget build(BuildContext context) {  // Build method to describe the UI.
    return Padding(
      padding: const EdgeInsets.all(12.0),  // Padding around the main container.
      child: Container(
        height: 475,  // Fixed height for the container.
        width: 0.85 * MediaQuery.of(context).size.width,  // Width is 75% of the screen width.
        decoration: BoxDecoration(
          color: Colors.teal,  // Purple background color for the container.
          borderRadius: BorderRadius.circular(15),  // Rounded corners.
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),  // Padding for the image container.
              child: Container(
                height: 250,  // Fixed height for the image container.
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),  // Rounded corners for the image container.
                  color: Colors.lightGreenAccent,  // Background color.
                  image: DecorationImage(
                    fit: BoxFit.cover,  // Cover the entire space of the container.
                    image: AssetImage("image/${court?.courtData?.imagePath}"),  // Load image from assets.
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),  // Padding for the information container.
              child: Stack(
                children: [
                  Container(
                    height: 160,  // Fixed height for the information container.
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),  // Rounded corners.
                      color: Colors.tealAccent,  // Background color.
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),  // Padding inside the information container.
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Space between columns.
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,  // Align text to the start.
                            children: [
                              Text(
                                "Name:",  // Label for name.
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                "Place:",  // Label for place.
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                "Price:",  // Label for year.
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,  // Align text to the end.
                            children: [
                              Text(
                                court!.courtData!.name.toString(),  // Display the name.
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                court!.courtData!.place.toString(),  // Display the place.
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                court!.courtData!.ticketPrice.toString(),  // Display the year.
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
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
    );
  }
}
