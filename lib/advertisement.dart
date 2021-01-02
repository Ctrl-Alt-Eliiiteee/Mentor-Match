import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'authentication.dart';
import 'package:page_transition/page_transition.dart';
import 'Login.dart';

class advertisementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage1(),
    );
  }
}

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage("images/img1.png"),
                  fit: BoxFit.cover), // button text
            )),
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 800),
                  child: HomePage2()));
        });
  }
}

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage("images/img2.png"),
                  fit: BoxFit.cover), // button text
            )),
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 800),
                  child: HomePage3()));
        });
  }
}

class HomePage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage("images/img3.png"),
                  fit: BoxFit.cover), // button text
            )),
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 800),
                  child: Login()));
        });
  }
}


    /*return Builder(
        builder: (context) => LiquidSwipe(
            pages: [
              Stack(
                children: [
                  Container(
                    color: Colors.yellow,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 40, right: 30),
                      child: SizedBox(
                        height: 45,
                        width: 75,
                        child: RaisedButton(
                          color: Colors.transparent,
                          elevation: 0.1,
                          child: Text(
                            'SKIP',
                            style: TextStyle(
                                color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Fredoka One'
                            ),
                          ),
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Authentication()));},
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        width: 80,
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black54,
                              radius: 12,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.yellow.withOpacity(0.5),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black54,
                              radius: 12,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black54,
                              radius: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    color: Colors.blue,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        width: 80,
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black54,
                              radius: 12,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black54,
                              radius: 12,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.blue.withOpacity(0.5),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black54,
                              radius: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    color: Colors.yellow,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 40, right: 30),
                      child: SizedBox(
                        height: 45,
                        width: 76,
                        child: RaisedButton(
                          color: Colors.transparent,
                          elevation: 0.1,
                          child: Text(
                            'NEXT',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'Fredoka One'
                            ),
                          ),
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Authentication()));},
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        width: 80,
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black54,
                              radius: 12,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black54,
                              radius: 12,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black54,
                              radius: 12,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.yellow.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]
        )
    );*/
  }
}
