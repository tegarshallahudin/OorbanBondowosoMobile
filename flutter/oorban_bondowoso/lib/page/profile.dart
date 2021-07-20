import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/page/Riwayat.dart';
import 'package:oorban_bondowoso/page/favorite.dart';
import 'package:oorban_bondowoso/page/home.dart';
import 'package:oorban_bondowoso/page/login.dart';
import 'package:oorban_bondowoso/page/registrasi.dart';
import 'package:oorban_bondowoso/theme.dart';

class Profil extends StatefulWidget {
  Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}
class _ProfilState extends State<Profil> {

  int _currentIndex = 0;

  final tabs =[
    Profil(),
    Home(),
    Favorite(),
    Riwayat()
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
        image: DecorationImage(image: AssetImage('asset/logo/vektor2.png'),
        fit: BoxFit.cover)),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container( 
                height: 130,
                width: MediaQuery.of(context).size.width,
                color: Colors.blueGrey,
                child :Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70, left: 8),
                          child:Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(mainAxisAlignment: MainAxisAlignment.start,
                              children:<Widget>[
                                Icon(Icons.arrow_back, color: whiteColor, size: 20,),
                                Padding(padding: const EdgeInsets.only(left: 20)),
                                Text('Profile',style: whiteTextStlye20,),
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
            ],
          ),
          SizedBox(height: 30,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.blueGrey,
                  elevation: 20,
                  child: SizedBox(
                   height: 60,
                   width: 340,
                   child: InkWell(splashColor: Colors.greenAccent,
                   onTap: (){},
                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.person),
                    Text('PERBARUI PROFIL ANDA'),
                  ],
                ),
               ),
              ),
              ),
            ],
          )
        ],
      ),
    )
    );
  }
}