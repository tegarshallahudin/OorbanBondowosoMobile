import 'package:flutter/material.dart';
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
                  child: Text('Skip'),
                  onPressed: () {},
                )
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
             'We are what we do',
             style: blackTextStlye.copyWith(
               fontSize: 23)
            ),
            SizedBox(
              height: 30
            ),
            Text('Thousand of people are usign silent moon\nfor smalls meditation',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600],
             fontSize: 15
             ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  child: Text('Next'),
                  onPressed: () {},
                )
              ],
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