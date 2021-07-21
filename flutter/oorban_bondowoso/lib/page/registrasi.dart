import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oorban_bondowoso/config/api_service.dart';
import 'package:oorban_bondowoso/page/login.dart';
import 'package:oorban_bondowoso/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
// import 'package:toast/toast.dart';

class Register extends StatelessWidget {
 Register({Key? key}) : super(key: key);

  final nama = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();


  processregister(context){
    ApiService.newRegister(nama.text, username.text, email.text, password.text).then((response)async{
      if (response.masssage.contains('Sukses')){
        print('Berhasil');
        // Toast.show('Berhasil Mendaftar',context);
        // await Fluttertoast.showToast(
        //   msg: 'Berhasil Mendaftar'
        // );
      }
      else { print('Gagal');
        // await Fluttertoast.showToast(
        //   msg: 'Gagal Mendaftar'
        // );
        // Toast.show('Gagal Mendaftar',context);
      }
    }).catchError((e){
      print('eror');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
     body: Container(
       decoration: BoxDecoration(
         image: DecorationImage(image: AssetImage('asset/logo/vektor5.png'),
         fit: BoxFit.cover)
       ),
       child: Column(children:<Widget>[
        SizedBox(height: 120,),
        Image(image: AssetImage('asset/logo/Group_1.png'),width: 200,),
        SizedBox(height: 50,),
        Container(
          height: 539,
          child: ListView( 
            children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('asset/logo/ilus4.png')),color:Colors.grey[300], borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
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
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 16,
                          controller: nama,
                          decoration: InputDecoration(
                              hintText: 'Masukkan disini',
                              labelText: 'Nama Lengkap',
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: TextFormField( 
                            maxLength: 16,
                            controller: email,
                            decoration: InputDecoration(
                              hintText: 'Masukkan disini',
                              labelText: 'Email',
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
                    ],),
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: 100,
                    child: ElevatedButton( onPressed: (){ 
                      processregister(context);
                    }, 
                    child: Text('Register',style: blackTextStlye,),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(greenColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )
                      ),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: 300,
                    child: Text('By continuing, you agree to Oorban Bondowoso Terms of Service, Privacy policy.',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),)),
                ),
                SizedBox(
                  height: 20
                ),
                RichText(
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
                  ]
                )
              ),
              SizedBox(
                height:80,
              )
            ],),
        )
        ],
      ),
     ),
    );
  }
}



