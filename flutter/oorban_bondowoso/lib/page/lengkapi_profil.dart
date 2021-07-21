import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/page/home.dart';
import 'package:oorban_bondowoso/page/profile.dart';

class lkp_profil extends StatefulWidget {
  lkp_profil({Key? key}) : super(key: key);

  @override
  _lkp_profilState createState() => _lkp_profilState();
}

class _lkp_profilState extends State<lkp_profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lengkapi Profil'),
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
    );
  }
}