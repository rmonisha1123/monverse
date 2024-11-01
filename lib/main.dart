import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:monisha_portfolio/screens/landing_screen.dart';
import 'package:monisha_portfolio/screens/introduction/intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This variable will check if the app is opened for the first time.
  bool _isFirstLaunch = true;
  bool _isFirebaseInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  // Function to initialize Firebase and check first launch
  Future<void> _initializeApp() async {
    // Check if Firebase is initialized (you already did this in main)
    try {
      await Firebase.initializeApp();
      setState(() {
        _isFirebaseInitialized = true;
      });
    } catch (e) {
      // Handle error if Firebase fails to initialize
      print('Firebase initialization failed: $e');
    }

    // Check if the app is launched for the first time using SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstTime = prefs.getBool('isFirstLaunch');

    if (isFirstTime == null || isFirstTime == true) {
      // Set 'isFirstLaunch' to false since the app is being opened for the first time.
      await prefs.setBool('isFirstLaunch', false);
      setState(() {
        _isFirstLaunch = true;
      });
    } else {
      setState(() {
        _isFirstLaunch = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isFirebaseInitialized) {
      // Show a loading indicator while Firebase is initializing
      return const CircularProgressIndicator();
    }
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.montserrat(fontSize: 12),
        ),
      ),
      title: 'MonVerse',
      debugShowCheckedModeBanner: false,
      home: _isFirstLaunch ? const IntroScreen() : const LandingScreen(),
    );
  }
}
