import 'package:flutter/material.dart';
import 'package:foodieshop/forgotPassword/provider/requestOTPProvider.dart';
import 'package:foodieshop/goldPages/splashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) {
        print('Provider started');
        return RequestOTPProvider();
      }),
    ],
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: TextTheme()),
        home: Foodie()),
  ));
}
