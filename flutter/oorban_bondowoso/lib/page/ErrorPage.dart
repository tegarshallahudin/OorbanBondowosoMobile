import 'dart:async';

import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  final splashDelay = 2;

  @override
  void initState() { 
    super.initState();
    // _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(
      _duration,
      _navigationPage
    );
  }

  void _navigationPage(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: CircularProgressIndicator(color: Colors.lightGreen,),
        ),
      ),
    );
  }
}