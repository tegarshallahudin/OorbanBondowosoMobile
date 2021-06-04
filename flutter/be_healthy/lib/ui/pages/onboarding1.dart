part of 'pages.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final int _numpages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numpages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 15.0 : 15.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Color(0xFF050505),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(color: Colors.white
              // gradient: LinearGradient(
              ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: FlatButton(
                        onPressed: () => print('Skip'),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                          size: 30.0,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () => print('Skip'),
                        child: Text(
                          'Skip',
                          style: greyFontStyle2,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        height: 600.0,
                        child: PageView(
                          physics: ClampingScrollPhysics(),
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text('Lorem Ipsum dolor.',
                                      style: onBoardTitle),
                                  SizedBox(height: 15.0),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.',
                                    style: onBoardSubtitle,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 60.0),
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/onboarding/meeting.gif'),
                                        height: 300.0,
                                        width: 300.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 60.0),
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/onboarding/meeting.gif'),
                                        height: 300.0,
                                        width: 300.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text('Lorem Ipsum dolor.',
                                      style: onBoardTitle),
                                  SizedBox(height: 15.0),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.',
                                    style: onBoardSubtitle,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text('Lorem Ipsum dolor.',
                                      style: onBoardTitle),
                                  SizedBox(height: 15.0),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit.',
                                    style: onBoardSubtitle,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 60.0),
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/onboarding/meeting.gif'),
                                        height: 300.0,
                                        width: 300.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ],
                ),
                _currentPage != _numpages - 1
                    ? Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: _buildPageIndicator(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _pageController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0,
                                              top: 5.0,
                                              bottom: 5.0,
                                              left: 15.0),
                                          child: Text('Selanjutnya',
                                              textAlign: TextAlign.center,
                                              style: whiteFontStyle1),
                                        ),
                                      ],
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
                            ],
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numpages - 1
          ? Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 83.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _buildPageIndicator(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuestPage()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0,
                                    top: 5.0,
                                    bottom: 5.0,
                                    left: 15.0),
                                child: Text('Get Started',
                                    textAlign: TextAlign.center,
                                    style: whiteFontStyle1),
                              ),
                            ],
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
                  ],
                ),
              ),
            )
          : Text(''),
    );
  }
}
