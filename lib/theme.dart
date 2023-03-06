import 'package:flutter/material.dart';

class AppStyles {
  static final TextStyle buttonTextStyle = TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static final ButtonStyle operationButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white12,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.all(20.0),
    textStyle: buttonTextStyle,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
  );

  static final ButtonStyle top_bttn = ElevatedButton.styleFrom(
    backgroundColor: Colors.grey,
    foregroundColor: Colors.black,
    padding: const EdgeInsets.all(20.0),
    textStyle: buttonTextStyle,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
  );

  static final ButtonStyle right_bttn = ElevatedButton.styleFrom(
    backgroundColor: Colors.orange,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.all(20.0),
    textStyle: buttonTextStyle,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
  );
}
