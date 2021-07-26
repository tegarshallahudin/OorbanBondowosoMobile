import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/config/api_service.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/model/get_property.dart';
import 'package:oorban_bondowoso/model/list_favorit.dart';
import 'package:oorban_bondowoso/page/Riwayat.dart';
import 'package:oorban_bondowoso/page/home.dart';
import 'package:oorban_bondowoso/page/login.dart';
import 'package:oorban_bondowoso/page/profile.dart';
import 'package:oorban_bondowoso/page/registrasi.dart';
import 'package:oorban_bondowoso/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import 'detail.dart';

class Favorite extends StatefulWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  String _domain = "https://wsjti.id/Oorbanbondowoso/public/";
  late List<DataProperty> _property;
  final oCcy = new NumberFormat("#,##0.00", "id_ID");
  late int _idUser;

  @override
  void initState() { 
    super.initState();
    getLoginSession();
  }

  getLoginSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('nama_lengkap');
    print('akun $stringValue');
    setState(() {
      print('get string');
      this._idUser = prefs.getInt('id_user')!;
    });
    print('id user : ${this._idUser}');
    getData(prefs.getInt('id_user')!);
    // return stringValue;
  }

  getData(int idUser) async {
   ApiService.listFavorit(idUser).then((response) {
      if(response.status == 200) {
        setState(() {
          this._property = response.data;
        });
        print('data : ${response.data.length}');
      }
      else {
        print('request gagal');
      }
    }).catchError((e) {
      print('get data error :${e.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('asset/logo/Group_1.png',
        height: 100,
        width: 100,
        ),
        backgroundColor: Colors.white70,
        ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:[
                  Padding(
                    padding: const EdgeInsets.only(right: 240),
                    child: Text('Favorite Anda',style: blackTextStlye,),
                  ),
                  Image(image: AssetImage('asset/logo/line1.png'))
                ]
              ),
            ),
            SizedBox(
              height: 20,
            ),
            for (var item in this._property)
              propertiItem(item),
          ],
        ),
    )
    );
  }

  Widget propertiItem(DataProperty data) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(data: data,)));
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          color: Colors.white,
          elevation: 20,
          child: Stack(
            children: [
              Image.network(
                _domain + data.gambar,
                height: 168.0,
                width: 381.0,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 110.0, left: 20.0),
                child: Text(data.namaPemilik,style: whiteTextStlye20,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140.0, left: 20.0),
                child: Text('Rp.${this.oCcy.format(double.parse(data.harga))}',style: whiteTextStlye,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left:330.0),
                child: Icon(Icons.favorite, color: Colors.red[700], size: 35,)
              ),
            ]
          ),
      ),
    );
  }
}