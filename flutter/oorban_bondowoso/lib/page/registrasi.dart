import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/page/login.dart';
import 'package:oorban_bondowoso/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
     body: Container(
       decoration: BoxDecoration(
         image: DecorationImage(image: AssetImage('asset/logo/vektor5.png',),
         fit: BoxFit.cover)
       ),
       child: Column(children:<Widget>[
        SizedBox(height: 120,),
        Image(image: AssetImage('asset/logo/Group_1.png'),width: 200,),
        SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Container(
            decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('asset/logo/ilus1.png')),color:Colors.grey[300], borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      Text('Register',style: blackTextStlye20,),
                    ],
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextField( 
                    decoration: InputDecoration( fillColor: Colors.white,filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                      hintText:"Nama Lengkap",
                      hintStyle:TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide:BorderSide(width: 1,color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10)), 
                      )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextField( 
                    decoration: InputDecoration( fillColor: Colors.white,filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                      hintText:"Username",
                      hintStyle:TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide:BorderSide(width: 1,color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10)), 
                      )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration( fillColor: Colors.white,filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    hintText:"Password",
                    hintStyle:TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide:BorderSide(width: 1,color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10)), 
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextField( 
                    decoration: InputDecoration( fillColor: Colors.white,filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                      hintText:"Email",
                      hintStyle:TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide:BorderSide(width: 1,color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10)), 
                      )
                    ),
                  ),
                ),
              ),
            ],),
          ),
        ),
        SizedBox(height: 3.0,),
            SizedBox(
              width: 300,
              child: ElevatedButton( onPressed: (){ showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Apakah Data Anda Sudah Benar ?',
                        style: blackTextStlye
                      ),
                    ),
                    scrollable: true,
                    content: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Form(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()),
                                    );},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Urungkan",
                                    style: blackTextStlye
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: greenColor),
                                      borderRadius: BorderRadius.circular(18.0),
                                    ))),
                              ),
                              ElevatedButton(
                                onPressed: () {showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          content: Container(
                                            height: 100,
                                            child: Column( mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                 Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child:Icon(
                                                      Icons.check,
                                                      color: greenColor,
                                                      size: 60
                                                      ),
                                                  ),
                                                 Text('Berhasil Melakukan Registrasi',style: blueTextStlye),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                  Future.delayed(Duration(seconds: 3), () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()),
                                    );
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Ya, Lanjutkan",
                                    style: blackTextStlye
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:MaterialStateProperty.all(greenColor),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                  );
                });}, child: Text('Register',style: blackTextStlye,),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(greenColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 300,
                child: Text('By continuing, you agree to Oorban Bondowoso Terms of Service, Privacy policy.',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),)),
            ),
            SizedBox(
              height: 10
            ),RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: " Do you have an account ? ",
                style: TextStyle(color: Colors.black)
              ),
              TextSpan(
                  text: " Login now ",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = ()  {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));                     
                       }
                    ),
            ]))
      ],
      )
    ,
     ),
     
    );
  }
}



