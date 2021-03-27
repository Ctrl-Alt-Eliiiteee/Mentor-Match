import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match_app/Pages/Navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authentication.dart';
import 'package:page_transition/page_transition.dart';
import 'Login.dart';
import 'main.dart';

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/Background.png',
              ),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('images/Mask Group 1.png'),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            letterSpacing: 1.4,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.blue[900]),
                      ),
                    ),
                  )),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: height / 2,
                  width: width - 50,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(100))),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25, top: 40, right: 50),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'What is Mentor Match?\n\n',
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Mentor Match is a novel solution to all your studying problems by helping you smarter, not harder.',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.w300)),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30.0, bottom: 40),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 400),
                                      child: IntroPage2()));
                            },
                            child: Text(
                              "Next >",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue[900],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IntroPage2 extends StatefulWidget {
  @override
  _IntroPage2State createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/Background.png',
              ),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('images/Mask Group 2.png'),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            letterSpacing: 1.4,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.blue[900]),
                      ),
                    ),
                  )),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: height / 2,
                  width: width - 50,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(100))),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25, top: 40, right: 50),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'What exactly do we do?\n\n',
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'We match students with talented mentors from the best colleges to help students find study methods that suit THEM',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.w300)),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30.0, bottom: 40),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 400),
                                      child: IntroPage3()));
                            },
                            child: Text(
                              "Next >",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue[900],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IntroPage3 extends StatefulWidget {
  @override
  _IntroPage3State createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/Background.png',
              ),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset('images/Mask Group 3.png'),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: height / 2,
                  width: width - 50,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(100))),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25, top: 40, right: 50),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'How the process works?\n\n',
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'We hand pick the best college students and match them with your interest, hobbies and personality.',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.w300)),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30.0, bottom: 40),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () async {
                              var prefs = await SharedPreferences.getInstance();
                              prefs.setBool('IntroSeen', true);
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 400),
                                      child: Login()));
                            },
                            child: Text(
                              "Next >",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue[900],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
