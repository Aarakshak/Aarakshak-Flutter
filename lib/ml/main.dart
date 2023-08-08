import 'package:aarakshak/ml/locator.dart';
import 'package:aarakshak/ml/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  setupServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: facePage(),
    );
  }
}
