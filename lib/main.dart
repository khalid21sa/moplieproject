// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:moplieproject/screens/booking_page.dart';
import 'package:moplieproject/screens/home_page.dart';
import 'package:moplieproject/screens/play_page.dart';
import 'package:moplieproject/screens/profile_page.dart';
import 'package:moplieproject/shareable/MyDynamicImageListScreen.dart';
import 'data/DatabaseHelper.dart';
import 'data/MyTextScreen.dart';
import 'data/list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final databaseRef = FirebaseDatabase.instance.reference();
  var lll=fortList;
  databaseRef.child('messages').push().set({'message': 'HelloWorld'});
  DatabaseHelper.createFirebaseRealtimeDBWithUniqueIDs('padlecourt', lll);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genius Group Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(), // Changed to MyHomePage to show the bottom navigation bar
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; //this is the index of the pages through navbar

  final List<Widget> _widgetOptions; //list that takes widgets

  _MyHomePageState() : _widgetOptions = [
    HomePage(), // HomePage requires sendMessage to be passed
    MyTextScreen(),
    MyDynamicImageListScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genius Group Application'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_tennis),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        iconSize: 28.0,
        backgroundColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}