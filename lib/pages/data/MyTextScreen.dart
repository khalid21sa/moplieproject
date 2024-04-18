import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ImageDecoration.dart';
import '../imageCaption.dart';
import 'DatabaseHelper.dart';
import 'court_model.dart';

class MyTextScreen extends StatefulWidget {
  const MyTextScreen({Key? key});

  @override
  State<MyTextScreen> createState() => _MyTextScreenState();
}

class _MyTextScreenState extends State<MyTextScreen> {
  List<court> castleList = [];

  @override
  void initState() {
    super.initState();
    DatabaseHelper.readFirebaseRealtimeDBMain((List<court> castleList) {
      setState(() {
        this.castleList = castleList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('field List'),
      ),
      body: castleList.isEmpty
          ? Center(
              child:
                  CircularProgressIndicator()) // Show a loading indicator while the data is being fetched
          : ListView.builder(
              itemCount: castleList.length,
              itemBuilder: (context, index) {
                court castle = castleList[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageDecoration(
                          imagePath: '${castle.courtData?.imagePath ?? ''}',
                        ),
                        SizedBox(height: 8),
                        imageCaption(
                            caption: '${castle.courtData?.name ?? 'No Name'}'),
                        SizedBox(height: 4),
                        Text(
                          'Place: ${castle.courtData?.place ?? 'Unknown'}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Price: \$${castle.courtData?.ticketPrice?.toStringAsFixed(2) ?? '0.00'}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
