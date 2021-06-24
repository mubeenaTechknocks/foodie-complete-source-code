import 'package:flutter/material.dart';
import 'package:foodie_delivery/forgotPassword/provider/requestOTPProvider.dart';
import 'package:foodie_delivery/pages/SplashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => RequestOTPProvider(),
    child: MaterialApp(
      title: 'Foodie Delivery',
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    ),
  ));
}
