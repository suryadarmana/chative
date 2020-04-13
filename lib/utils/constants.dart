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

const kSendButtonTextStyle = TextStyle(
  color: Colors.amber,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.amber, width: 2.0),
  ),
);

const kBorderMessageUser = BorderRadius.only(
  topLeft: Radius.circular(50),
  bottomLeft: Radius.circular(50),
  bottomRight: Radius.circular(50),
);

const kBorderMessageOthers = BorderRadius.only(
  topRight: Radius.circular(50),
  bottomLeft: Radius.circular(50),
  bottomRight: Radius.circular(50),
);
