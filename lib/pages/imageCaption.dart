import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class imageCaption extends StatelessWidget {
  final String caption;

  const imageCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(0.8),
      child: Text(
        caption
      ),
    );
  }
}