import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moplieproject/screens/appStyle.dart';


class imageCaption extends StatelessWidget {
  final String caption;

  const imageCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(0.8),
      child: Text(
        caption,
        textAlign: TextAlign.center,
        style: AppStyles.headlineStyle1,// Align the text in the center of the container
        /*
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w600, // Set font weight to semi-bold
          color: Colors.black,
          letterSpacing: 0.5, // Add space between characters
          height: 1.2, // Adjust line height
          shadows: [ // Add text shadows
            Shadow(
              blurRadius: 2.0,
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        */
      ),
    );
  }
}