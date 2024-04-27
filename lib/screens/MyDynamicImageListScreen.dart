import 'package:flutter/material.dart';
import 'package:moplieproject/data/court_model.dart';
import '../data/DatabaseHelper.dart';
import '../shareable/MyRoundedCastleInfo.dart';

class MyDynamicImageListScreen extends StatefulWidget {
  const MyDynamicImageListScreen({super.key});

  @override
  State<MyDynamicImageListScreen> createState() =>
      _MyDynamicImageListScreenState();
}

class _MyDynamicImageListScreenState extends State<MyDynamicImageListScreen> {
  List<Court> courtList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseHelper.readFirebaseRealtimeDBMain((castleList) {
      setState(() {
        this.courtList = castleList;
        //print(this.castleList.first.castleData?.name);
        //print(this.castleList);
        //print(this.castleList.first.castleData?.name);
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
                    const SizedBox(height: 20,),
                    for (int i = 0; i < courtList.length; i++) ...{
                      MyRoundedCastleInfo(court: courtList[i]),
                      const SizedBox(height: 20,),
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
