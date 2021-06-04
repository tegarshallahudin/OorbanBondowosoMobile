part of '../pages/pages.dart';

class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(30),
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: InputField(),
        ),
        SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 40,
        ),
        ButtonQuest()
      ],
    );
  }
}
