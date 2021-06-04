part of 'shared.dart';

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

Color mainColor = _colorFromHex('edf6f9');
Color greyColor = _colorFromHex('f4f3ee');
Color blackColor = _colorFromHex('000000');

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle36 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold);
TextStyle blackFontStyle27 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle whiteFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500);
TextStyle blueFontStyle = GoogleFonts.poppins().copyWith(
    color: Colors.blue[200], fontSize: 18, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(color: Colors.black);
TextStyle onBoardTitle = GoogleFonts.poppins().copyWith(
  color: Colors.black,
  fontSize: 30,
  fontWeight: FontWeight.bold,
);
TextStyle onBoardSubtitle = GoogleFonts.poppins().copyWith(
  color: Colors.grey.shade400,
  fontSize: 18,
  fontWeight: FontWeight.w500,
);
TextStyle greyFontStyle2 = GoogleFonts.poppins().copyWith(
    color: Colors.grey.shade400, fontSize: 18, fontWeight: FontWeight.w500);
const double defaultMargin = 24;

final ButtonStyle raisedButtonStyle =
    ElevatedButton.styleFrom(padding: EdgeInsets.all(20));
