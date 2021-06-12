import 'package:flutter/material.dart';
import 'package:oorban_bondowoso/page/OnBoarding2.dart';
import 'package:oorban_bondowoso/page/OnBoarding3.dart';
import 'package:oorban_bondowoso/theme.dart';

class OnBoarding1 extends StatelessWidget {
  get greyFontStyle2 => null;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
         children: [
            Image.asset('asset/logo/vektor1.png'),
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
            Container(
              height: 279,
              width: 279,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/logo/ilus1.png'),
                 ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
             'Mari Bergabung dengan Kami',
             style: blackTextStlye.copyWith(
               fontSize: 23)
            ),
            SizedBox(
              height: 30
            ),
            Text('Berbagai Macam Property yang\nAnda Butuhkan Ada disini',
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
                                  builder: (context) => OnBoarding2()),
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