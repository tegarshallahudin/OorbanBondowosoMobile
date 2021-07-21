import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/model/get_property.dart';
import 'package:oorban_bondowoso/page/home.dart';
import 'package:oorban_bondowoso/page/profile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.data}) : super(key: key);

  final DataProperty data;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _domain = "http://192.168.1.19:8000/";
  String _whatsappUrl = "https://api.whatsapp.com/send?phone=6285724662512&text=";

  openWhatsapp() async {
    await launch(_whatsappUrl, forceSafariVC: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
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
         body: SafeArea(
          child: Container(
           decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage('asset/logo/vektor6.png'),
             fit: BoxFit.cover)
           ),
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
           child: ListView(
             children: <Widget>[
               Image.network(
                  _domain + widget.data.gambar,
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 20,
                ),
                   Text('Nama pemilik : ${widget.data.namaPemilik}'),
                   Text('Umur bangunan : ${widget.data.umurBangunan}'),
                   Text('Harga : ${widget.data.harga}'),
                   Text('Kamar tidur : ${widget.data.jmlKamartidur}'),
                   Text('Kamar Mandi  : ${widget.data.jmlKamarmandi}'),
                   Text('Luas tanah : ${widget.data.luasTanah}'),
                   Text('Luas bangunan : ${widget.data.luasBangunan}'),
                   Text('Luas lantai : ${widget.data.lantai}'),
                   Text('Daya listrik : ${widget.data.dayaListrik}'),
                   Text('Tahun dibangun : ${widget.data.tahunDibangun}'),
                   Text('Keterangan : ${widget.data.keterangan}'),
                   Text('Sertifikat : ${widget.data.sertifikat}'),
                SizedBox(
                  height: 40,
                ),
               ElevatedButton( onPressed: ()
                  { 
                  },
                  child: Text('Tambah Favorit',style: blackTextStlye,),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(greenColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                    ),
                  )
                ),
                ElevatedButton( onPressed: ()
                  {
                    openWhatsapp();
                  }, 
                  child: Text('Chat Whatsapp',style: blackTextStlye,),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(greenColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                    ),
                  )
                )
             ],
           ),
         ),
       )
    );
  }
}