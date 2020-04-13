import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chative/components/form_button.dart';
import 'package:chative/screens/chat_screen.dart';
import 'package:chative/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  // Screen ID For Routes
  static final String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _auth = FirebaseAuth.instance;
  bool showLoading = false;

  @override
  void initState() {
    super.initState();
    checkCredentials();
  }

  void isLoading(bool status) {
    setState(() {
      showLoading = status;
    });
  }

  void checkCredentials() async {
    isLoading(true);
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }
      isLoading(false);
    } catch (e) {
      print(e);
      isLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showLoading,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // App Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: 60.0,
                      ),
                    ),
                    TypewriterAnimatedTextKit(
                      speed: Duration(milliseconds: 500),
                      isRepeatingAnimation: true,
                      text: ['Chative', 'Get hive!'],
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 48.0,
                ),

                // Login & Register Button
                FormButton(
                  onClick: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  label: 'Login',
                  buttonColor: Colors.amber.shade600,
                ),
                FormButton(
                  onClick: () {
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                  label: 'Register',
                  buttonColor: Colors.amber.shade900,
                ),

                SizedBox(
                  height: 48.0,
                ),

                Text(
                  'Created by Surya Darmana',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
