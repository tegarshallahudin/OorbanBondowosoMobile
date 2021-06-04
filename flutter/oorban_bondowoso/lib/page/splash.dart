import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/page/OnBoarding1.dart';


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
  // TODO: implement initState
  goHomePage();
    super.initState();
  }

  goHomePage() {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoarding1(),
          ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[0xffF2F2F2],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(
              'asset/logo/Group_1.png',
              width: 250,
            ),
          )
        ),
      ),
    );
  }
}
