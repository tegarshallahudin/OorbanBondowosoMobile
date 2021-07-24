import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oorban_bondowoso/config/api_service.dart';
import 'package:oorban_bondowoso/model/get_login.dart';
import 'package:oorban_bondowoso/model/get_property.dart';
import 'package:http/http.dart' as http;
import 'package:oorban_bondowoso/page/detail.dart';
import 'package:intl/intl.dart';
import '../theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _domain = "https://wsjti.id/Oorbanbondowoso/public/";
  late List<DataProperty> _property;
  late List<DataProperty> _searchList = [];
  String keyword='';
  TextEditingController tfSearchController = new TextEditingController();

  @override
  void initState() { 
    super.initState();
    getData();
    // getAlbum();
    // futureAlbum = fetchAlbum();
  }

  getData() {
    ApiService.getProperti().then((response) {
      if(response.status == 200) {
        setState(() {
          this._property = response.data;
          this._searchList = this._property;
        });
      }
      else {
        print('request gagal');
      }
    }).catchError((e) {
      print('get data error :${e.toString()}');
    });
  }

  Future<String> checkFavorit(int id_properti, int id_pengguna_android) async {
    print('checkFavorit($id_properti, $id_pengguna_android)');
    late String result;
    await ApiService.checkFavorit(id_properti, id_pengguna_android).then((response) {
      if(response.status == 200) {
        if(response.message == "sudah favorit") {
          print('sudah$id_properti');
          result = 'sudah';
        }
        else {
          print('belum$id_properti');
          result = 'belum';
        }
      }
      else {
        print('belum$id_properti');
        result = 'belum';
      }
    }).catchError((e) {
      print('get check favorit error :${e.toString()}');
      result = 'belum';
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
           child: ListView(
             children: <Widget>[
               SizedBox(
                 height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Beranda',style: blackTextStlye,),
                  ),
                  Image(image: AssetImage('asset/logo/line1.png')),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20,),
                    child: Row(
                      children: <Widget> [
                        Expanded(
                          child: TextField(
                            controller: tfSearchController,
                            decoration: InputDecoration(
                              hintText: "Cari Property Idaman Anda",
                              hintStyle: TextStyle(
                                color: Colors.black.withAlpha(120),
                              ),
                              
                              border: InputBorder.none,
                            ),
                            // onChanged: onSearchChanged,
                            // onChanged: (String keyword) async {
                            //   onSearchChanged(keyword);
                            // },
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            searchData(tfSearchController.text);
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.black.withAlpha(120),
                          ),
                        )
                      ],
                    ),
                  ),
                  for(final item in this._property)
                    propertyItem(item)
                  // getProperty(this._property)
                  // this.tfSearchController.text=='' ?
                  // getProperty(this._property)
                  // : 
                  // getProperty(this._searchList)
             ],
           ),
         ),
     );
  }

  onSearchChanged(String text) async {
    String query = text;
    print(query);

    this._searchList.clear();

    for(var item in this._property){
      print(item.namaPemilik);
      if(item.namaPemilik.contains(query)) {
        print('ketemu');
        this._searchList.add(item);
      }
      else {
        print('dak ketemu');
        this._searchList = this._property;
      }
    }

    
  }

  searchData(query) {
    print(query);
    // this._searchList.clear();
    if(query == '') {
      getData();
    }
    try {
      for(var item in this._property){
        print(item.namaPemilik);
        if(item.namaPemilik.contains(query)) {
            print('ketemu');
            this._searchList.add(item);
        }
        else {
            print('dak ketemu');
            this._searchList = this._property;
        }
      }
    }
    catch(e) {
      print('error search : $e');
    }
    
  }

  Widget getProperty(List<DataProperty> data) {
    print('data : ${data.length}');
    var p;
    p = Column(
      children: [
        for(final item in data)
          propertyItem(item)
      ]
    );
    return p;
  }

  Widget propertyItem(DataProperty data) {
    print(data.id);
    // bool isFavorit = false;
    // Future<String> check = checkFavorit(data.id, 1);
    // check.then((value) {
    //   print('result $value');
    //   isFavorit = value.contains("sudah") ? true : false;
    // });
    
    // setState(() {
    //   isFavorit = checkFavorit(data.id, 1) == 'sudah' ? true : false;
    // });
    // print('favorit${data.id} $isFavorit');
    final oCcy = new NumberFormat("#,##0.00", "id_ID");
    return 
      SizedBox(
        height: 180,
        width: 380,
        child: InkWell(
          onTap:(){
            // print('id properti :${data.id}');
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(data: data,)));
          },
          child: Card( 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              color: Colors.white,
              elevation: 20,
              child: Stack(
                children: <Widget> [
                  Image.network(
                    _domain + data.gambar,
                    height: 168.0,
                    width: 381.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 110.0, left: 20.0),
                    child: Text('${data.namaPemilik}',style: whiteTextStlye20,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 140.0, left: 20.0),
                    child: Text('Rp. ${oCcy.format(double.parse(data.harga))}',style: whiteTextStlye,),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10.0, left:330.0),
                  //   child: Icon(
                  //     isFavorit ? Icons.favorite : Icons.favorite_border,
                  //     color: Colors.red[700],
                  //     size: 35,
                  //   )
                  // ),
                ]
              ),
          ),
        ),
      );
    // Card(
    //     margin: EdgeInsets.only(bottom: 20.0),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(20.0),
    //     ),
    //     color: Colors.blueGrey,
    //     elevation: 50,
    //     child: SizedBox(
    //       height: 160,
    //       width: 340,
    //       child: InkWell(splashColor: Colors.deepPurple,
    //           onTap: (){
    //             Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(data: data,)));
    //           },
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: <Widget>[
    //               Image.network(
    //                 _domain + data.gambar,
    //                 width: 100.0,
    //                 height: 80.0,
    //                 fit: BoxFit.fill,
    //               ),
    //               Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [ 
    //                   SizedBox(height: 20,),
    //                   Text('${data.namaPemilik}'),
    //                   SizedBox(height: 20,),
    //                   Container( height:100, width: 100,
    //                     child: Text('${data.keterangan}'),
    //                     ),
    //                 ],
    //               )
    //             ],
    //         ),
    //     ),
    //   ),
    // );
  }
}