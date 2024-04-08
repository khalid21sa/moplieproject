import 'package:flutter/material.dart';
import 'ImageDecoration.dart';


class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(height: 20),
            ImageDecoration(imagePath: "f1.jpg"),
            SizedBox(height: 20),
            ImageDecoration(imagePath: "s1.webp"),
            SizedBox(height: 20),
            ImageDecoration(imagePath: "f5.jpeg"),
            SizedBox(height: 20),
            ImageDecoration(imagePath: "f6.jpg"),
            SizedBox(height: 20),
            ImageDecoration(imagePath: "f1.jpg"),
            SizedBox(height: 20),
            ImageDecoration(imagePath: "f2.jpeg"),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}