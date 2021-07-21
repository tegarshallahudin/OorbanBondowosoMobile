import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/page/Riwayat.dart';
import 'package:oorban_bondowoso/page/home.dart';
import 'package:oorban_bondowoso/page/login.dart';
import 'package:oorban_bondowoso/page/profile.dart';
import 'package:oorban_bondowoso/page/registrasi.dart';
import 'package:oorban_bondowoso/theme.dart';

class Favorite extends StatefulWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

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
      appBar: AppBar(
        title: Text('Favorite'),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home), 
          onPressed: () {Navigator.push(
               context,
                MaterialPageRoute(
                  builder: (context) => Home()),
                  );  }, 
          ),
         ]
        ),
      resizeToAvoidBottomInset: false,
      body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('asset/logo/vektor2.png'),
        fit: BoxFit.cover)),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Daftar Property yang Anda Sukai'),
              SizedBox(height: 20,),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.blueGrey,
                  elevation: 20,
                  child: SizedBox(
                   height: 160,
                   width: 340,
                   child: InkWell(splashColor: Colors.greenAccent,
                   onTap: (){},
                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image: AssetImage('asset/logo/prop1.png'),width: 120,),
                    Column(
                      children: [ 
                        SizedBox(height: 20,),
                        Text('Nama Property'),
                        SizedBox(height: 20,),
                        Container( height:100, width: 100,
                          child: Text('Lorem ipsum dolor sit amet, consetetur '))
                      ],
                    )
                  ]
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