import 'package:flutter/material.dart';

const TextStyle kDefaultTextStyle = TextStyle(
  fontFamily: 'Raleway',
  color: Colors.white,
);

const TextTheme kDefaultTextTheme = TextTheme(
  display1: kDefaultTextStyle,
  display2: kDefaultTextStyle,
  display3: kDefaultTextStyle,
  headline: kDefaultTextStyle,
  subhead: kDefaultTextStyle,
  title: kDefaultTextStyle,
  body2: kDefaultTextStyle,
  body1: kDefaultTextStyle,
  caption: kDefaultTextStyle,
  button: kDefaultTextStyle,
  subtitle: kDefaultTextStyle,
  overline: kDefaultTextStyle,
);

const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(color: Colors.black45),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
