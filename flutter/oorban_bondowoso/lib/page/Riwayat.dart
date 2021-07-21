import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/page/favorite.dart';
import 'package:oorban_bondowoso/page/home.dart';
import 'package:oorban_bondowoso/page/login.dart';
import 'package:oorban_bondowoso/page/profile.dart';
import 'package:oorban_bondowoso/page/registrasi.dart';
import 'package:oorban_bondowoso/theme.dart';

class Riwayat extends StatefulWidget {
  Riwayat({Key? key}) : super(key: key);

  @override
  _RiwayatState createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  

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
  Widget build(BuildContext context) {
    return Scaffold(
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
                                Padding(padding: const EdgeInsets.only(left: 10)),
                                Text('Riwayat',style: whiteTextStlye20,),
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
              Text('Riwayat Transaksi Anda'),
              SizedBox(height: 20,),
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
                    Icon(Icons.money),
                    Text('Nama Property'),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Container(
                              child: Text('Tanggal Transaksi')),
                          ],
                        )
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