import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/layout.dart';
import 'package:oorban_bondowoso/theme.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    Container(
      width: double.infinity,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('asset/logo/vektor6.png'))),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container( color: Colors.grey,
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0,left: 30.0, top: 45.0),
                      child: Image(image: AssetImage('asset/logo/Group_1.png'), width: 120,),
                    )
                  ],
                ),
              ),
              Stack( 
                children: [
                  Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 350,
                        child: Padding(
                          padding: const EdgeInsets.only(top:120.0),
                          child: TextField(
                            decoration: InputDecoration( border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15)),
                            hintText: 'Pencarian Property Idaman Anda',
                            hintStyle: greyTextStlye,
                            prefixIcon: Icon(Icons.search),
                            fillColor: Colors.white,
                            filled: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 30,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 150,
                width: 360,
                 child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.grey,
                  elevation: 20,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(image: AssetImage('asset/logo/prop1.png'),width: 120,),
                    Column(
                      children: [ 
                        Text('Nama Property'),
                        SizedBox(height: 20,),
                        Container( height:100, width: 100,
                          child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr,\n sed diam nonumy eirmod '))
                      ],
                    )
                  ],
                ),
              ),
              ),
              SizedBox(height: 10,
              ),
              Container(
                height: 150,
                width: 360,
                 child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.grey,
                  elevation: 20,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(image: AssetImage('asset/logo/prop1.png'),width: 120,),
                    Column(
                      children: [ 
                        Text('Nama Property'),
                        SizedBox(height: 20,),
                        Container( height:100, width: 100,
                          child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr,\n sed diam nonumy eirmod '))
                      ],
                    )
                  ],
                ),
              ),
              ),
              SizedBox(height: 10,
              ),
              Container(
                height: 150,
                width: 360,
                 child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.grey,
                  elevation: 20,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(image: AssetImage('asset/logo/prop1.png'),width: 120,),
                    Column(
                      children: [ 
                        Text('Nama Property'),
                        SizedBox(height: 20,),
                        Container( height:100, width: 100,
                          child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr,\n sed diam nonumy eirmod '))
                      ],
                    )
                  ],
                ),
              ),
              )
            ],
          )
        ],
      ),
    )
    );
  }
}