import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'BotomNavigationBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genius Group Application', // Fixed typo in title
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // this is the menu in the app bar I will build it later @LAITH
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Action for the icon goes here.
          },
        ),
        title: Text('Padel App'),
        backgroundColor: Colors.blue, // Change app bar color here
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4E80D1), // Start color
              Color(0xFFC2E9FB), // End color
            ],
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'image/s1.webp',
                width: 500, // Adjust width as needed
                height: 500, // Adjust height as needed
              ),
              SizedBox(height: 20), // Add spacing between image and button
              ElevatedButton(
                onPressed: () {
                  sendMessage(context);
                },
                child: Text(
                  'Send Message to Database',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Future<void> sendMessage(BuildContext context) async {
    try {
      DatabaseReference messageRef = FirebaseDatabase.instance.reference().child('messages');
      String? messageId = messageRef.push().key;
      await messageRef.child(messageId!).set({
        'text': 'Start work bro',
        'timestamp': ServerValue.timestamp,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent successfully')),
      );
    } catch (e) {
      print('Error sending message: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send message')),
      );
    }
  }
}
