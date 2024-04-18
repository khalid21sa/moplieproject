import 'package:flutter/material.dart';

import '../data/court_model.dart';


class MyRoundedCastleInfo extends StatelessWidget {
  final Court? court;

  const MyRoundedCastleInfo({super.key, required this.court});

  @override
  Widget build(BuildContext context) {
    /*GestureDetector(
        onTap: () {
          if (castle != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CastleDetailScreen(castle: castle!),
              ),
            );
          }
        },*/
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 475,
        width: 0.75 * MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.lightGreenAccent,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                      AssetImage("image/${court?.courtData?.imagePath}"),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Stack(
                children: [
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.lightGreen,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name:",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                "Place:",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                "Year:",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                court!.courtData!.name.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                court!.courtData!.place.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                court!.courtData!.ticketPrice.toString(),
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

    // );
  }
}
