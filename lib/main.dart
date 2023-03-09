import 'package:flutter/material.dart';

import 'calculator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Calculator(),
    );
  }
}

void main() {
  runApp(const MyApp());
}