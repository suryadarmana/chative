import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final Function(String) onChanged;
  final String hintText;
  final Color focusedBorderColor;
  final bool isPassword;
  final TextInputType keyboardType;

  FormInput(
      {this.onChanged,
      this.hintText,
      this.focusedBorderColor,
      this.isPassword,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      textAlign: TextAlign.center,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: focusedBorderColor,
          ),
        ),
      ),
    );
  }
}
