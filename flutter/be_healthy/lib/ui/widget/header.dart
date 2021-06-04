part of '../pages/pages.dart';

// class GeneralHeader extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final Function onBackButtonPressed;
//   final Widget child;
//   final Color backColor;

//   GeneralHeader(
//       {this.title = "Title",
//       this.subtitle = "subtitle",
//       this.onBackButtonPressed,
//       this.child,
//       this.backColor});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(color: Colors.white),
//           SafeArea(
//               child: Container(
//             color: backColor ?? Colors.white,
//           )),
//           SafeArea(
//             child: ListView(
//               children: [
//                 Column(
//                   children: [
//                     Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: defaultMargin),
//                         width: double.infinity,
//                         height: 100,
//                         color: Colors.white,
//                         child: Row(
//                           children: [
//                             onBackButtonPressed != null
//                                 ? GestureDetector(
//                                     onTap: () {
//                                       if (onBackButtonPressed != null) {
//                                         onBackButtonPressed();
//                                       }
//                                     },
//                                     child: Container(
//                                       width: defaultMargin,
//                                       height: defaultMargin,
//                                       margin: EdgeInsets.only(right: 24),
//                                       decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                               image: AssetImage(
//                                                   'assets/back_arrow.png'))),
//                                     ),
//                                   )
//                                 : SizedBox(),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   title,
//                                   style: blackFontStyle1,
//                                 ),
//                                 Text(
//                                   subtitle,
//                                   style: blackFontStyle1,
//                                 )
//                               ],
//                             )
//                           ],
//                         )),
//                     Container(
//                       height: defaultMargin,
//                       width: double.infinity,
//                       color: greyColor,
//                     ),
//                     child ?? SizedBox()
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Selamat Datang !",
            style: blackFontStyle36,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Explore the app, Find some peace of mind and some sport for your healthy.",
            style: whiteFontStyle1,
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
