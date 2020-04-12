import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  // Screen ID For Routes
  static final String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text('Hellow World'),
        ),
      ),
    );
  }
}
