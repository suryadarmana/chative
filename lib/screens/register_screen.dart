import 'package:chative/components/form_button.dart';
import 'package:chative/components/form_input.dart';
import 'package:chative/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterScreen extends StatefulWidget {
  static final String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  focusedBorderColor: Colors.amber.shade900,
                  isPassword: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                FormInput(
                  onChanged: (value) {
                    password = value;
                  },
                  hintText: 'Enter your password',
                  focusedBorderColor: Colors.amber.shade900,
                  isPassword: true,
                ),
                SizedBox(
                  height: 48.0,
                ),
                FormButton(
                  onClick: () async {
                    isLoading(true);
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      isLoading(false);
                    } catch (e) {
                      print(e);
                      isLoading(false);
                    }
                  },
                  label: 'Register',
                  buttonColor: Colors.amber.shade900,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
