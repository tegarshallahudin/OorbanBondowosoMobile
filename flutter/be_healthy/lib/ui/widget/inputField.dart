part of '../pages/pages.dart';

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 40.0),
        Container(
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Colors.lightBlue[50],
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(7.0))),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Nama Lengkap",
                hintStyle: blueFontStyle,
                border: InputBorder.none),
          ),
        ),
        SizedBox(height: 15.0),
        Container(
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Colors.lightBlue[50],
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(7.0))),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Tanggal Lahir",
                hintStyle: TextStyle(color: Colors.blue[200]),
                border: InputBorder.none),
          ),
        ),
        SizedBox(height: 15.0),
        Container(
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Colors.lightBlue[50],
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(7.0))),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Tanggal Lahir",
                hintStyle: blueFontStyle,
                border: InputBorder.none),
          ),
        ),
        SizedBox(height: 15.0),
        Container(
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Colors.lightBlue[50],
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(7.0))),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Bagaimana Keadaanmu ?",
                hintStyle: blueFontStyle,
                border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
