import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/page/OnBoarding1.dart';
import 'package:oorban_bondowoso/page/login.dart';
import 'package:oorban_bondowoso/theme.dart';

class OnBoarding3 extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
         children: [
            Image.asset('asset/logo/vektor3.png'),
            Padding(
          padding: EdgeInsets.only(
            top: 20,
            bottom: 50,
          ),
        child: Center(
        child: Column( 
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/logo/ilus3.png'),
                 ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
             'Selamat Datang di\nOorban Bondowoso',
             textAlign: TextAlign.center,
             style: blackTextStlye.copyWith(
               fontSize: 28)
            ),
            SizedBox(
              height: 20
            ),
            Text('Nikmati Perjalanan Anda Menemukan\nProperty Idaman Anda',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600],
             fontSize: 15
             ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton( onPressed: (){Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login()),
                            );}, child: Text('Mulai', style: blackTextStlye,),
              style: ButtonStyle(
                
                backgroundColor: MaterialStateProperty.all(greenColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
                ),
               ),
              ),
            ),
          ],
         ),
        ),
       ),
      ],
     ),
    ),
   );
 }
}