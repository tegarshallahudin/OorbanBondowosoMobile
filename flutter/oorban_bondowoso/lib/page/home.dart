import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/layout.dart';
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
    Profil(),
    Home(),
    Register(),
    Login()
  ];

  void _onItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar : BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 25,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),                    
            title: Text('Profile'),
            backgroundColor: Colors.blueGrey
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),                    
            title: Text('Home'),
            backgroundColor: Colors.blueAccent
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),                    
            title: Text('Favorite'),
            backgroundColor: Colors.redAccent
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),                    
            title: Text('Riwayat'),
            backgroundColor: Colors.lightGreen
            ),
        ],
        onTap: (index) {
            setState(() {
              _currentIndex =index;
            });
        }
        ),
      body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('asset/logo/vektor9.png'),
        fit: BoxFit.cover)),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container( 
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: Colors.blueGrey,
                child :Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60, left: 8),
                          child:Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,
                              children:<Widget>[
                                Icon(Icons.arrow_back, color: whiteColor, size: 20,),
                                Padding(padding: const EdgeInsets.only(left: 20)),
                                Text('Home',style: whiteTextStlye20,),
                                Padding(
                                padding: const EdgeInsets.only(left: 130.0),
                                child:Image(image: AssetImage('asset/logo/Group_1.png'), height: 45.0,)),
                              ],
                            ),
                          )
                        ),
                      ],
                    )
                  ],
                ),
                ),
              Stack( 
                children: [
                  Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 340,
                        child: Padding(
                          padding: const EdgeInsets.only(top:120.0),
                          child: TextField(
                            decoration: InputDecoration( border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15)),
                            hintText: 'Cari Property Idaman Anda',
                            hintStyle: whiteTextStlye,
                            prefixIcon: Icon(Icons.search, color: whiteColor,),focusColor: whiteColor,
                            fillColor: Colors.grey,
                            filled: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 30,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.blueGrey,
                  elevation: 20,
                  child: SizedBox(
                   height: 150,
                   width: 360,
                   child: InkWell(splashColor: Colors.deepPurple,
                   onTap: (){},
                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(image: AssetImage('asset/logo/prop1.png'),width: 120,),
                    Column(
                      children: [ 
                        Text('Nama Property'),
                        SizedBox(height: 20,),
                        Container( height:100, width: 100,
                          child: Text('Lorem ipsum dolor sit amet, consetetur '))
                      ],
                    )
                  ],
                ),
               ),
              ),
              ),
              SizedBox(height: 10,
              ),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.blueGrey,
                  elevation: 20,
                  child: SizedBox(
                   height: 150,
                   width: 360,
                   child: InkWell(splashColor: Colors.deepPurple,
                   onTap: (){},
                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(image: AssetImage('asset/logo/prop1.png'),width: 120,),
                    Column(
                      children: [ 
                        Text('Nama Property'),
                        SizedBox(height: 20,),
                        Container( height:100, width: 100,
                          child: Text('Lorem ipsum dolor sit amet, consetetur '))
                      ],
                    )
                  ],
                ),
               ),
              ),
              ),
              SizedBox(height: 10,
              ),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.blueGrey,
                  elevation: 20,
                  child: SizedBox(
                   height: 150,
                   width: 360,
                   child: InkWell(splashColor: Colors.deepPurple,
                   onTap: (){},
                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(image: AssetImage('asset/logo/prop1.png'),width: 120,),
                    Column(
                      children: [ 
                        Text('Nama Property'),
                        SizedBox(height: 20,),
                        Container( height:100, width: 100,
                          child: Text('Lorem ipsum dolor sit amet, consetetur '))
                      ],
                    )
                  ],
                ),
               ),
              ),
              ),
              SizedBox(height: 10,
              ),
            ],
          )
        ],
      ),
    )
    );
  }
}