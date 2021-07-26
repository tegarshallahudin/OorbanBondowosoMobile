import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/page/Riwayat.dart';
import 'package:oorban_bondowoso/page/favorite.dart';
import 'package:oorban_bondowoso/page/home.dart';
import 'package:oorban_bondowoso/page/lengkapi_profil.dart';
import 'package:oorban_bondowoso/page/login.dart';
import 'package:oorban_bondowoso/page/registrasi.dart';
import 'package:oorban_bondowoso/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}
class _ProfilState extends State<Profil> {

  // var list;
  // var random;

  int? _idUser;
  String? _namaLengkap;
  String? _email;
  String? _noHp;

  int _currentIndex = 0;

  final tabs =[
    Profil(),
    Home(),
    Riwayat()
  ];

  void _onItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() { 
    super.initState();
    // random = Random();
    // list = List.generate(random.nextInt(10), (i) => "Item $i");
    getLoginSession();
  }
  // Future <Null> refreshList() async {
  //   await Future.delayed(Duration(seconds: 2));
    
  //   setState(() {
  //     list = List.generate(random.nextInt(10), (i) => "Item $i");
  //   });
  //   return null; 
  // }

  getLoginSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('nama_lengkap');
    print('akun $stringValue');
    setState(() {
      print('get string');
      this._idUser = prefs.getInt('id_user');
      this._namaLengkap = prefs.getString('nama_lengkap');
      this._email = prefs.getString('email');
      this._noHp = prefs.getString('no_hp');
    });
    // return stringValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
              // RefreshIndicator(
              //   child: ListView.builder(
              //     itemCount: list?.length,
              //     itemBuilder: (context,i) => ListTile(
              //       title: Text (list[i]),
              //     )
              //     ),
              //      onRefresh: refreshList
              //      ),
                 Padding(
                  padding: const EdgeInsets.only(right : 280.0),
                  child: Text('Data Profil',style: blackTextStlye,),
                ),
              Image(image: AssetImage('asset/logo/line1.png'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Image(image: AssetImage('asset/logo/ilus5.png'),
              height: 100.0,
              width: 100.0,
               ),
               Column( mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('${this._namaLengkap}', style: blackTextStlye,),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(this._noHp != null ? '${this._noHp}' : '-'),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('${this._email}'),
                   )
                 ],
               ),
              ]
             )
            ),
              SizedBox(
                height: 20,),
           Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left : 20.0),
                child: Row( mainAxisAlignment: MainAxisAlignment.start,
                  children: [ 
                    Text('Akun',style: blackTextStlye,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.white,
                  elevation: 5,
                  child: SizedBox(
                   height: 60,
                   width: 340,
                   child: InkWell(splashColor: Colors.blueAccent,
                   onTap: (){Navigator.push(
                  context,
                   MaterialPageRoute(
                     builder: (context) => lkp_profil()),
                      );  },
                   child: Padding(
                     padding: const EdgeInsets.only(right: 150.0,),
                     child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      Icon(Icons.person),
                      Text('Pengaturan Akun'),
                  ],
                ),
                   ),
               ),
              ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.white,
                  elevation: 8,
                  child: SizedBox(
                   height: 60,
                   width: 340,
                   child: InkWell(splashColor: Colors.redAccent,
                   onTap: (){Navigator.push(
                  context,
                   MaterialPageRoute(
                     builder: (context) => Favorite()),
                      ); },
                   child: Padding(
                     padding: const EdgeInsets.only(right: 180.0),
                     child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      Icon(Icons.favorite),
                      Text('Favorite Saya'),
                  ],
                ),
                   ),
               ),
              ),
              ),
            SizedBox(
              height: 170,
            ),
            SizedBox(
              width: 350,
              child: ElevatedButton( onPressed: (){Navigator.push(
               context,
                MaterialPageRoute(
                  builder: (context) => Login()),
                  );}, child: Text('Keluar',style: blackTextStlye,),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red[600]),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )
                ),
              )),
            ),
            ],
          )
        ],
      ),
    )
    );
  }
}