import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodieadmin/goldPages/splashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Foodie(),
    ),
  );
}
