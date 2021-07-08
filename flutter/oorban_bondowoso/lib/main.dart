import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/page/OnBoarding1.dart';
import 'package:oorban_bondowoso/page/OnBoarding2.dart';
import 'package:oorban_bondowoso/page/OnBoarding3.dart';
import 'package:oorban_bondowoso/page/home.dart';
import 'package:oorban_bondowoso/page/login.dart';
import 'package:oorban_bondowoso/page/registrasi.dart';
import 'package:oorban_bondowoso/page/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oorban Bondowoso',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Home(),
    );
  }
}
