import 'package:chative/components/form_button.dart';
import 'package:chative/components/form_input.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static final String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                onChanged: (item) {},
                hintText: 'Enter your e-mail',
                focusedBorderColor: Colors.amber.shade600,
                isPassword: false,
              ),
              FormInput(
                onChanged: (item) {},
                hintText: 'Enter your password',
                focusedBorderColor: Colors.amber.shade600,
                isPassword: true,
              ),
              SizedBox(
                height: 48.0,
              ),
              FormButton(
                onClick: () {
                  //Navigator.pushNamed(context, LoginScreen.id);
                },
                label: 'Register',
                buttonColor: Colors.amber.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
