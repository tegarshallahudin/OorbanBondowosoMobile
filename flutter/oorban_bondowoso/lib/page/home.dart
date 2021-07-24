import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/page/Riwayat.dart';
import 'package:oorban_bondowoso/page/home_page.dart';
import 'package:oorban_bondowoso/page/login.dart';
import 'package:oorban_bondowoso/page/profile.dart';
import 'package:oorban_bondowoso/page/registrasi.dart';
import 'package:oorban_bondowoso/theme.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final tabs =[
    HomePage(),
    Riwayat(),
    Profil(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() { 
    super.initState();
    print('tes');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('asset/logo/Group_1.png',
        height: 100,
        width: 100,
        ),
        backgroundColor: Colors.white
        ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar : BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 25,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),                    
            title: Text('Beranda'),
            backgroundColor: Colors.lightGreen
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),                    
            title: Text('Riwayat'),
            backgroundColor: Colors.lightGreen
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),                    
            title: Text('Profil'),
            backgroundColor: Colors.lightGreen
            ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.favorite),                    
          //   title: Text('Favorite'),
          //   backgroundColor: Colors.redAccent
          //   ),
        ],
        onTap: (index) {
          print(index);
            setState(() {
              _currentIndex =index;
            });
        }
        ),
      body: SafeArea(child: tabs[_currentIndex])
    );
  }

}