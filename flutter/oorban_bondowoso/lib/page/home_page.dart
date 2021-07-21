import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/config/api_service.dart';
import 'package:oorban_bondowoso/model/get_property.dart';
import 'package:http/http.dart' as http;
import 'package:oorban_bondowoso/page/detail.dart';

import '../theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _domain = "http://192.168.1.19:8000/";
  late List<DataProperty> _property;

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
        });
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
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('asset/logo/vektor6.png'),
        fit: BoxFit.cover)),
      // color: Colors.blue,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 18.0),
          for(final item in _property)
            propertyItem(item),
        ],
      ),
    );
  }
  Widget propertyItem(DataProperty data) {
    return Card(
        margin: EdgeInsets.only(bottom: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.blueGrey,
        elevation: 50,
        child: SizedBox(
          height: 160,
          width: 340,
          child: InkWell(splashColor: Colors.deepPurple,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(data: data,)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.network(
                    _domain + data.gambar,
                    width: 100.0,
                    height: 80.0,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      SizedBox(height: 20,),
                      Text('${data.namaPemilik}'),
                      SizedBox(height: 20,),
                      Container( height:100, width: 100,
                        child: Text('${data.keterangan}'),
                        ),
                    ],
                  )
                ],
            ),
        ),
      ),
    );
  }
}