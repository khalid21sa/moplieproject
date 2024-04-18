import 'package:flutter/material.dart';

// By convention, class names in Dart should start with an uppercase letter.
class play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Page'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green], // Gradient from blue to green
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text('Hello, Flutter!'),
          ),
          Container(
            child: Text("Laith"),
          ),
          Container(
            child: Text("Laith"),
          ),
        ],
      ),
    );
  }
}
