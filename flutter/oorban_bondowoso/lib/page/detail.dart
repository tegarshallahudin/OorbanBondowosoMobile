import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oorban_bondowoso/config/api_service.dart';
import 'package:oorban_bondowoso/model/get_property.dart';
import 'package:oorban_bondowoso/page/home.dart';
import 'package:oorban_bondowoso/page/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';


import '../theme.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.data}) : super(key: key);

  final DataProperty data;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _domain = "https://wsjti.id/Oorbanbondowoso/public/";
  String _whatsappUrl = "https://api.whatsapp.com/send?phone=6285724662512&text=Saya20%Tertarik20%Dengan20%Properti20%Ini";
  final oCcy = new NumberFormat("#,##0.00", "id_ID");
  bool _isFavorit = false;
  late int _idUser;

  @override
  void initState() { 
    super.initState();
    getLoginSession();
    checkFavorit();
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
    // return stringValue;
  }

  openWhatsapp() async {
    await launch(_whatsappUrl, forceSafariVC: false);
  }

  Future<String> checkFavorit() async {
    late String result;
    await ApiService.checkFavorit(widget.data.id, this._idUser).then((response) {
      if(response.status == 200) {
        if(response.message == "sudah favorit") {
          print('sudah${widget.data.id}');
          result = 'sudah';
        }
        else {
          print('belum${widget.data.id}');
          result = 'belum';
        }
      }
      else {
        print('belum${widget.data.id}');
        result = 'belum';
      }
    }).catchError((e) {
      print('get check favorit error :${e.toString()}');
      result = 'belum';
    });

    return result;
  }

  tambahFavorit() {
    ApiService.addFavorit(widget.data.id, this._idUser).then((response) {
      if(response.status == 200) {
        if(response.message == "Sukses") {
          print('berhasil menambahkan favorit');
          checkFavorit();
          setState(() {
            this._isFavorit = true;
          });
        }
        else {
          print('gagal menambahkan favorit');
        }
      }
      else {
        print('gagal menambahkan favorit');
      }
    }).catchError((e) {
      print('error : $e');
    });
  }

  hapusFavorit() {
    ApiService.deleteFavorit(widget.data.id, this._idUser).then((response) {
      if(response.status == 200) {
        if(response.message == "Sukses") {
          print('berhasil menghapus favorit');
          checkFavorit();
          setState(() {
            this._isFavorit = false;
          });
        }
        else {
          print('gagal menghapus favorit');
          setState(() {
            this._isFavorit = true;
          });
        }
      }
      else {
        print('gagal menghapus favorit');
      }
    }).catchError((e) {
      print('error : $e');
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             child: ListView(
               children: <Widget>[
               SizedBox(
                 height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Detail Properti',style: blackTextStlye,),
                  ),
                  Image(image: AssetImage('asset/logo/line1.png')),
                  SizedBox(
                    height: 10,
                  ),
                 Image.network(
                    _domain + widget.data.gambar,
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceAround ,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, right: 12.0),
                        child: Text('${widget.data.namaPemilik}',style: blackTextStlye20, ),
                         ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 5.0, left:160.0),
                      //   child: Icon(
                      //     Icons.favorite,
                      //     color: Colors.red[700],
                      //     size: 35,
                      //   )
                      // ),
                   ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text('Harga :',style: blackTextStlye,),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text('Rp. ${oCcy.format(double.parse(widget.data.harga))}',style: blackTextStlye20,),
                  ),
                  Image(image: AssetImage('asset/logo/line1.png')),
                  SizedBox(
                    height: 10,
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.bed),
                            Text('${widget.data.jmlKamartidur}'),
                            Text('Kamar Tidur')
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.bathtub,),
                            Text('${widget.data.jmlKamarmandi}'),
                            Text('Kamar Mandi')
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.flash_on,),
                            Text('${widget.data.dayaListrik}'),
                            Text('Daya Listrik')
                          ],
                        ),
                      ],
                    ),
                    ),
                      Image(image: AssetImage('asset/logo/line1.png')),
                      SizedBox(
                        height: 10,
                        ),
                    Column( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Detail Rumah', style: blackTextStlye10,),
                        ),
                      Image(image: AssetImage('asset/logo/line1.png')),
                      SizedBox(
                        height: 20,
                        ),
                      ],
                    ),
                     Column( mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('Umur bangunan : ${widget.data.umurBangunan} Tahun'),
                         ),
                         SizedBox(
                        height: 10,
                        ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('Luas tanah : ${widget.data.luasTanah} m²'),
                         ),
                         SizedBox(
                        height: 10,
                        ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('Luas bangunan : ${widget.data.luasBangunan} m²'),
                         ),
                         SizedBox(
                        height: 10,
                        ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('Luas lantai : ${widget.data.lantai} Lantai '),
                         ),
                         SizedBox(
                        height: 10,
                        ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('Tahun dibangun : ${widget.data.tahunDibangun}'),
                         ),
                         SizedBox(
                        height: 10,
                        ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('Keterangan : ${widget.data.keterangan}'),
                         ),
                         SizedBox(
                        height: 10,
                        ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('Sertifikat : ${widget.data.sertifikat}'),
                         ),
                       ],
                     ),
                  SizedBox(
                    height: 40,
                  ),
                    Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right:10.0, left: 20.0),
                          child: Icon(Icons.phone),
                        ),
                  ElevatedButton( onPressed: ()
                    {
                      openWhatsapp();
                    },
                    child: Text('Hubungi Penjual',style: blackTextStlye,),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(greenColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )
                      ),
                    )
                  ),
                 FutureBuilder(
                   future: checkFavorit(),
                   builder: (context, snapshot) {
                     if(snapshot.hasData) {
                       if(snapshot.data == 'sudah') {
                          return ElevatedButton( onPressed: ()
                            {
                              hapusFavorit();
                            },
                            child: Text('Hapus Favorit',style: blackTextStlye,),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                              ),
                            )
                          );
                       }
                       else {
                         return ElevatedButton( onPressed: ()
                            {
                              tambahFavorit();
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
                          );
                       }
                     }
                     else {
                       return ElevatedButton( onPressed: ()
                            {
                              // tambahFavorit();
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
                          );
                     }
                   },
                 ),
                      ],
                    ),
                  SizedBox(
                    height: 30,
                  ),
               ],
             ),
         ),
          ),
       )
    );
  }
}