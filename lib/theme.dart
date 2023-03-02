import 'package:flutter/material.dart';

class AppStyles {
  static final TextStyle buttonTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final ButtonStyle numberButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.grey[300],
    onPrimary: Colors.black,
    padding: EdgeInsets.symmetric(vertical: 16),
    textStyle: buttonTextStyle,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

  static final ButtonStyle operationButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.grey,
    onPrimary: Colors.black,
    padding: EdgeInsets.symmetric(vertical: 45),
    textStyle: buttonTextStyle,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.5),
    ),
  );

}
