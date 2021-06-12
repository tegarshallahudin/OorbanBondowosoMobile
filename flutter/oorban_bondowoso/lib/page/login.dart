import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/page/OnBoarding1.dart';
import 'package:oorban_bondowoso/page/OnBoarding2.dart';
import 'package:oorban_bondowoso/page/registrasi.dart';
import 'package:oorban_bondowoso/theme.dart';
import 'package:flutter/gestures.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.only(top: 5),
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
                padding: const EdgeInsets.all(10.0),
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
              ),Padding(
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
              SizedBox(height: 20,) 
            ],),
          ),
        ),
        SizedBox(height: 5.0,),
              SizedBox(
              width: 300,
              child: ElevatedButton( onPressed: (){Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OnBoarding1()),
                            );}, child: Text('Log in',style: blackTextStlye,),
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



