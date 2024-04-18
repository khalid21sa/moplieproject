import 'package:flutter/material.dart';
import 'package:moplieproject/data/DatabaseHelper.dart';
import '../data/court_model.dart';
import 'MyRoundedCastleInfo.dart';

class MyDynamicImageListScreen extends StatefulWidget {
  const MyDynamicImageListScreen({super.key});

  @override
  State<MyDynamicImageListScreen> createState() =>
      _MyDynamicImageListScreenState();
}

class _MyDynamicImageListScreenState extends State<MyDynamicImageListScreen> {
  List<Court> courtList =
      []; // Ensure that the class name 'Court' is correctly capitalized if it is so in your model.

  @override
  void initState() {
    super.initState();
    DatabaseHelper.readFirebaseRealtimeDBMain((courtList) {
      setState(() {
        this.courtList = courtList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        //padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: ListView(
          children: [
            //SingleChildScrollView(
            // scrollDirection: Axis.vertical,
            //child: Row(
            //child:
            Column(
              children: [
                //const Gap(20),
                const SizedBox(
                  height: 20,
                ),
                for (int i = 0; i < courtList.length; i++) ...{
                  MyRoundedCastleInfo(court: courtList[i]),
                  const SizedBox(
                    height: 20,
                  ),
                  // const Gap(20),
                }
              ],
            ),
            //),
          ],
        ),
      )),
    );
  }
}
