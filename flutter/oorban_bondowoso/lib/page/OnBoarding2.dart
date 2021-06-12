import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/page/OnBoarding3.dart';
import 'package:oorban_bondowoso/theme.dart';

class OnBoarding2 extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
         children: [
            Image.asset('asset/logo/vektor2.png'),
            Padding(
          padding: EdgeInsets.only(
            top: 20,
            bottom: 50,
          ),
        child: Center(
        child: Column( 
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OnBoarding3()),
                               );
                              },
                  child: Text('Lewati',
                  style: blackTextStlye.copyWith(
                    fontSize: 14,),
                 ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Text(
             'Temukan Property Anda Disini',
             style: blackTextStlye.copyWith(
               fontSize: 23)
            ),
            SizedBox(
              height: 20
            ),
            Text('Cari Property yang Anda Butuhkan Dengan\n Harga yang Bersahabat Dijamin\n Puas terhadap Fasilitas',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600],
             fontSize: 15
             ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 279,
              width: 279,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/logo/ilus2.png'),
                 ),
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
                                  builder: (context) => OnBoarding3()),
                            );}, child: Text('Berikutnya -->', style: blackTextStlye,),
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