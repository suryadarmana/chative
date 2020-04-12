import 'package:chative/components/form_button.dart';
import 'package:chative/components/form_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  try {
                    final existingUser = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if (existingUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                label: 'Login',
                buttonColor: Colors.amber.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
