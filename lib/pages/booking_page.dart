import 'package:flutter/material.dart';
import 'ImageDecoration.dart';
import 'imageCaption.dart';


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
            imageCaption(caption: "Laith"),
            SizedBox(height: 20),
            ImageDecoration(imagePath: "s1.webp"),
            imageCaption(caption: "Hamood"),
            SizedBox(height: 20),
            ImageDecoration(imagePath: "f5.jpeg"),
            imageCaption(caption: "Laith"),
            SizedBox(height: 20),
            ImageDecoration(imagePath: "f6.jpg"),
            imageCaption(caption: "Laith"),
            SizedBox(height: 20),
            ImageDecoration(imagePath: "f1.jpg"),
            imageCaption(caption: "Laith"),
            SizedBox(height: 20),
            ImageDecoration(imagePath: "f2.jpeg"),
            imageCaption(caption: "Laith"),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}