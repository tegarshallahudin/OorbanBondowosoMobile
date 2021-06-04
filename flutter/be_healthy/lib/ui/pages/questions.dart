part of 'pages.dart';

class QuestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.blue[500], Colors.blue[300], Colors.blue[400]]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Header(),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )),
              child: InputWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}

// class QuestPage extends StatefulWidget {
//   @override
//   _QuestPageState createState() => _QuestPageState();
// }

// class _QuestPageState extends State<QuestPage> {
//   int _value = 1;
//   final format = DateFormat("yyyy-MM-dd");

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController namaController = TextEditingController();
//     TextEditingController keadaanController = TextEditingController();

//     return Header(

//        Column(
//         children: [
//           Container(
//             width: double.infinity,
//             margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
//             child: Text(
//               "Nama Lengkap",
//               style: blackFontStyle1,
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             margin: EdgeInsets.symmetric(horizontal: defaultMargin),
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: Colors.black)),
//             child: TextField(
//               controller: namaController,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintStyle: greyFontStyle,
//                 hintText: "Nama lengkap",
//               ),
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
//             child: Text(
//               "Tanggal Lahir",
//               style: blackFontStyle1,
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             margin: EdgeInsets.symmetric(horizontal: defaultMargin),
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: Colors.black)),
//             child: Column(children: [
//               DateTimeField(
//                 format: format,
//                 onShowPicker: (context, currentValue) {
//                   return showDatePicker(
//                       context: context,
//                       firstDate: DateTime(1900),
//                       initialDate: currentValue ?? DateTime.now(),
//                       lastDate: DateTime(2100));
//                 },
//               ),
//             ]),
//           ),
//           Container(
//             width: double.infinity,
//             margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
//             child: Text("Jenis Kelamin", style: blackFontStyle1),
//           ),
//           Container(
//               width: double.infinity,
//               margin: EdgeInsets.symmetric(horizontal: defaultMargin),
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: Colors.black)),
//               child: DropdownButton(
//                 value: _value,
//                 isExpanded: true,
//                 underline: SizedBox(),
//                 items: [
//                   DropdownMenuItem(
//                     child: Text(
//                       'Pria',
//                       style: blackFontStyle3,
//                     ),
//                     value: 1,
//                   ),
//                   DropdownMenuItem(
//                     child: Text(
//                       'Wanita',
//                       style: blackFontStyle3,
//                     ),
//                     value: 2,
//                   ),
//                 ],
//                 onChanged: (value) {
//                   setState(() {
//                     _value = value;
//                   });
//                 },
//               )),
//           Container(
//             width: double.infinity,
//             margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
//             child: Text(
//               "Bagaimana Keadaanmu",
//               style: blackFontStyle1,
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             margin: EdgeInsets.symmetric(horizontal: defaultMargin),
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: Colors.black)),
//             child: TextField(
//               controller: keadaanController,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintStyle: greyFontStyle,
//                 hintText: "Keadaan",
//               ),
//             ),
//           ),
//           // Expanded(
//           //     child: Align(
//           //   alignment: FractionalOffset.bottomRight,
//           //   child: ElevatedButton(
//           //     onPressed: () {
//           //       Get.to(Home());
//           //     },
//           //     child: Row(
//           //       mainAxisAlignment: MainAxisAlignment.center,
//           //       mainAxisSize: MainAxisSize.min,
//           //       children: <Widget>[
//           //         Text(
//           //           'Next',
//           //           style: blackFontStyle1,
//           //         ),
//           //         SizedBox(width: 10.0),
//           //         Icon(
//           //           Icons.arrow_forward,
//           //           color: Colors.white,
//           //           size: 30.0,
//           //         )
//           //       ],
//           //     ),
//           //   ),
//           // ))
//         ],
//       ),
//     );
//   }
// }
