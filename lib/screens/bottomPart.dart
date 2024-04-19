// import "package:flutter/material.dart";
// import "package:moplieproject/data/MyTextScreen.dart";
// import "package:moplieproject/data/court_model.dart";
//
//
//
// class BottomPart extends StatefulWidget{
//   final Function(Court, bool) onUpdateCourt;
//
//   const BottomPart({Key? key, required this.onUpdateCourt}) : super(key: key);
// }
//
//
// class _BottomPartState extends State<BottomPart> {
//   int _selectedIndex = 0;
//   late List<Widget> _widgetOptions;
//
//   @override
//   void initState(){
//     super.initState();
//     _widgetOptions = <Widget>[
//       MyTextScreen(
//           onUpdateCourt: (Court court, bool isUpdate){
//             _updateCourt(court, isUpdate);
//         },
//       ),
//       AddUpdateCourtDataInToFirebaseScreen(
//         onUpdateCaourt: (Court court, bool isUpdate){
//           _updateCourt(court, isUpdate);
//         }
//       )
//       const MyImageScreen(),
//     ];
//   }
//   void _updateCastle(Court court, bool isUpdate) {
//     setState(() {
//       _selectedIndex = 1;
//       _widgetOptions[1] = AddUpdateCastleDataInToFirebaseScreen(
//         castle: court,
//         isUpdate: isUpdate,
//         onUpdateCastle: (Court Court, bool isUpdate) {},
//       );
//     });
//   }
//
// }