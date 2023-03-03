import 'package:flutter/material.dart';

class AppStyles {
  static final TextStyle buttonTextStyle = TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static final ButtonStyle numberButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.white12,
    onPrimary: Color(0x0FFe4d5b7),
    padding: const EdgeInsets.all(20.0),
    textStyle: buttonTextStyle,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
  );

  static final ButtonStyle operationButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.white12,
    onPrimary: Color(0x0FFe4d5b7),
    padding: const EdgeInsets.all(20.0),
    textStyle: buttonTextStyle,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
  );

}
