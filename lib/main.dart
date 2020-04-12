import 'package:chative/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Chative());

class Chative extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Theme Definition
      theme: ThemeData.dark(),

      // Routes Configuration
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
      },
    );
  }
}
