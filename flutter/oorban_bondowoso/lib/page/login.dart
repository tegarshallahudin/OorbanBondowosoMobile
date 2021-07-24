import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oorban_bondowoso/config/api_service.dart';
import 'package:oorban_bondowoso/model/get_login.dart';
import 'package:oorban_bondowoso/page/OnBoarding1.dart';
import 'package:oorban_bondowoso/page/OnBoarding2.dart';
import 'package:oorban_bondowoso/page/home.dart';
import 'package:oorban_bondowoso/page/registrasi.dart';
import 'package:oorban_bondowoso/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  
  final username = TextEditingController();
  final password = TextEditingController();

  processlogin(context){
    ApiService.login(username.text, password.text).then((response) async {
      if (response.masssage.contains('Sukses')){
        print('Berhasil');
        await saveLoginSession(response.data);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        // Toast.show('Berhasil Mendaftar',context);
        // await Fluttertoast.showToast(
        //   msg: 'Selamat Datang'
        // );
      }
      else { print('Gagal');
        // await Fluttertoast.showToast(
        //   msg: 'Gagal Log in'
        // );
        // Toast.show('Gagal Mendaftar',context);
      }
    }).catchError((e){
      print('error : $e');
    });
  }

  saveLoginSession(Data data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id_user', data.id);
    prefs.setString('nama_lengkap', data.namaLengkap);
    prefs.setString('email', data.email);
    prefs.commit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
     body: Container(
       decoration: BoxDecoration(
         image: DecorationImage(image: AssetImage('asset/logo/vektor4.png',),
         fit: BoxFit.cover)
       ),
       child: Column(children:<Widget>[
        SizedBox(height: 120,),
        Image(image: AssetImage('asset/logo/Group_1.png'),width: 200,),
        SizedBox(height: 70,),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Container(
            decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('asset/logo/ilus3.png')),color:Colors.grey[300], borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child:Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      Text('Log in',style: blackTextStlye20,),
                    ],
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextFormField( 
                    maxLength: 16,
                    controller: username,
                    decoration: InputDecoration(
                      hintText: 'Masukkan disini',
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderSide:BorderSide(width: 1,color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10)), 
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(8.0)),
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextFormField( 
                    maxLength: 16,
                    controller: password,
                    decoration: InputDecoration(
                      hintText: 'Masukkan disini',
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderSide:BorderSide(width: 1,color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10)), 
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(8.0)),
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                    ),
                  ),
                ),
              SizedBox(height: 20,) 
            ],),
          ),
        ),
        SizedBox(height: 3.0,),
            SizedBox(
              width: 300,
              child: ElevatedButton( onPressed: (){ 
                processlogin(context);
                }, 
                child: Text('Log in',style: blackTextStlye,),
                style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
                ),
              )),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton( onPressed: (){Navigator.push(
               context,
                MaterialPageRoute(
                  builder: (context) => Register()),
                  );}, child: Text('Register',style: blackTextStlye,),
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
                text: " wants more experience ? ",
                style: TextStyle(color: Colors.black)
              ),
              TextSpan(
                  text: " Register now ",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = ()  {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));                     
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



