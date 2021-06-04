part of '../pages/pages.dart';

class ButtonQuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Apakah Anda yakin ?',
                        style: blackFontStyle27,
                      ),
                    ),
                    scrollable: true,
                    content: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Form(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Urungkan",
                                    style: blueFontStyle,
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(18.0),
                                    ))),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Ya, Lanjutkan",
                                    style: whiteFontStyle1,
                                  ),
                                ),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                  );
                });
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Selanjutnya",
                style: whiteFontStyle1,
              ),
            ),
          ),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ))),
        ),
      ),
    );
  }
}
