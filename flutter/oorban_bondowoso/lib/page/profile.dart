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
      body: SafeArea(
        child : Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('asset/logo/vektor6.png'),
        fit: BoxFit.cover)),
      child: Column(
        children: <Widget>[
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
                   child: InkWell(splashColor: Colors.blueAccent,
                   onTap: (){Navigator.push(
                  context,
                   MaterialPageRoute(
                     builder: (context) => lkp_profil()),
                      );  },
                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.person),
                    Text('Lengkapi Profil Anda'),
                  ],
                ),
               ),
              ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.blueGrey,
                  elevation: 20,
                  child: SizedBox(
                   height: 60,
                   width: 340,
                   child: InkWell(splashColor: Colors.redAccent,
                   onTap: (){Navigator.push(
                  context,
                   MaterialPageRoute(
                     builder: (context) => Favorite()),
                      ); },
                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.favorite),
                    Text('Property Yang Anda Sukai'),
                  ],
                ),
               ),
              ),
              ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton( onPressed: (){Navigator.push(
               context,
                MaterialPageRoute(
                  builder: (context) => Login()),
                  );}, child: Text('Log Out',style: blackTextStlye,),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red[800]),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
                ),
              )),
            ),
            ],
          )
        ],
      ),
    )
    )
    );
  }
}