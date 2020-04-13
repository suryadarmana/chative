import 'package:chative/components/form_button.dart';
import 'package:chative/components/form_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  // Screen ID For Routes
  static final String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;
  bool showLoading = false;

  void isLoading(bool status) {
    setState(() {
      showLoading = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showLoading,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 100.0,
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                FormInput(
                  onChanged: (value) {
                    email = value;
                  },
                  hintText: 'Enter your e-mail',
                  focusedBorderColor: Colors.amber.shade600,
                  isPassword: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                FormInput(
                  onChanged: (value) {
                    password = value;
                  },
                  hintText: 'Enter your password',
                  focusedBorderColor: Colors.amber.shade600,
                  isPassword: true,
                ),
                SizedBox(
                  height: 48.0,
                ),
                FormButton(
                  onClick: () async {
                    isLoading(true);
                    try {
                      final existingUser =
                          await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      if (existingUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      isLoading(false);
                    } catch (e) {
                      print(e);
                      isLoading(false);
                    }
                  },
                  label: 'Login',
                  buttonColor: Colors.amber.shade600,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
