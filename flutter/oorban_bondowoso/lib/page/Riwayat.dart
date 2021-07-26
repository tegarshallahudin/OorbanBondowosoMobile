import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/config/api_service.dart';
import 'package:oorban_bondowoso/model/get_riwayat.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/page/favorite.dart';
import 'package:oorban_bondowoso/page/home.dart';
import 'package:oorban_bondowoso/page/login.dart';
import 'package:oorban_bondowoso/page/profile.dart';
import 'package:oorban_bondowoso/page/registrasi.dart';
import 'package:oorban_bondowoso/theme.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Riwayat extends StatefulWidget {
  Riwayat({Key? key}) : super(key: key);

  @override
  _RiwayatState createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  
  String _domain = "https://wsjti.id/Oorbanbondowoso/public/";
  late List <DataRiwayat> _riwayat;
  int? _idUser;

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
      this._idUser = prefs.getInt('id_user');
    });
    getData();
  }

  getData(){
    ApiService.getRiwayat(this._idUser!).then((response){
      if(response.status == 200) {
        setState(() {
          this._riwayat = response.data;
        });
      }
      else{
        print('request gagal');
      }
    }).catchError((e) {
      setState(() {
        this._riwayat = [];
      });
      print('get data eror : ${e.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    child: Text('Riwayat Anda',style: blackTextStlye,),
                  ),
                  Image(image: AssetImage('asset/logo/line1.png'))
                ]
              ),
            ),
            SizedBox(
              height: 20,
            ),
            for (var item in this._riwayat) 
            riwayatItem(item)
          ],
        ),
    )
    );
  }

  Widget riwayatItem(DataRiwayat data){
  print(data.id);

    
  final oCcy = new NumberFormat("#,##0.00", "id_ID");
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: SizedBox(
          height: 260,
          width: 340,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Detail Transaksi Anda',style: blackTextStlye,),
              ),
              Image(image: AssetImage('asset/logo/line1.png')),
              SizedBox(
                height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Id Transaksi : ${data.idTransaksi}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Admin : ${data.name}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Nama Property : ${data.namaPemilik}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Kode Transaksi : ${data.kodeTransaksi}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Nama Pembeli : ${data.username}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Total Harga : Rp. ${data.totalBayar}'),
                  // child: Text('Total Harga : Rp. ${oCcy.format(double.parse(data.totalBayar))}'),
                ),
              ],
             ),
            ],
          ),
       ),
    );
  }
}