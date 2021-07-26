import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/page/ErrorPage.dart';
import 'package:oorban_bondowoso/page/home.dart';
import 'package:oorban_bondowoso/page/splash.dart';

void main() { 
  ErrorWidget.builder = (FlutterErrorDetails details) => ErrorPage();
  WidgetsFlutterBinding.ensureInitialized();
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
      home: Home()
      // home:Home()
    );
  }
}
