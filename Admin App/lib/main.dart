import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodieadmin/forgotPassword/provider/requestOTPProvider.dart';
import 'package:foodieadmin/goldPages/splashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          print('Provider started');
          return RequestOTPProvider();
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Foodie(),
      ),
    ),
  );
}
