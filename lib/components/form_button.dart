import 'package:flutter/material.dart';

/// [FormButton] Component
///
class FormButton extends StatelessWidget {
  final Function onClick;
  final String label;
  final Color buttonColor;

  FormButton({this.onClick, this.label, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: OutlineButton(
        onPressed: onClick,
        borderSide: BorderSide(
          color: buttonColor,
          width: 2.0,
        ),
        shape: StadiumBorder(),
        padding: EdgeInsets.all(18.0),
        focusColor: buttonColor,
        highlightColor: buttonColor,
        highlightedBorderColor: buttonColor,
        child: Text(
          label,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
