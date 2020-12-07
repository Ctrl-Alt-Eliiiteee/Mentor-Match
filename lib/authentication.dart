import 'package:animator/animator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'advertisement.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

String select = "Mentee";

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  String email = '';
  String password = '';
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
  Future<String> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }
  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: select == "Mentee" ? Colors.yellow : Colors.blue,
        accentColor: Colors.white,
        cursorColor: Colors.white,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: h/1.2,
              width: w,
              child: RotatedBox(
                quarterTurns: 0,
                child: FlareActor(
                  select == "Mentee" ? 'images/auth yellow flare.flr' : 'images/auth blue flare.flr',
                  animation: 'Flow',
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: w / 4, left: w / 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Welcome ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontFamily: 'Fredoka One',
                    ),
                  ),
                  Text(
                    "Back ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'Fredoka One',
                    ),
                  ),
                ],
              ),
            ),
            FlutterLogin(
                emailValidator: (value) {
                  if (!value.contains('@') || !value.endsWith('.com')) {
                    return "Email must contain '@' and end with '.com'";
                  }
                  return null;
                },
                passwordValidator: (value) {
                  if (value.isEmpty) {
                    return 'Password is empty';
                  }
                  return null;
                },
                onLogin: (loginData) async {
                  email = loginData.name;
                  password = loginData.password;
                  //add firebase code here
                  return _loginUser(loginData);
                },
                onSignup: (loginData) async {
                  email = loginData.name;
                  password = loginData.password;
                  //add firebase code here
                  return _loginUser(loginData);
                },
                onRecoverPassword: (email) {
                  //reset pw of email
                  return _recoverPassword(email);
                },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: .005*h, left: .30*w, right: .30*w, top: .93*h),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    color: Colors.white,
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FlutterIcons.question_ant, color: Colors.black54, size: 20),
                        Text(
                            'Advertisement',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => advertisementPage()));
                    },
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: .07*h, left: .24*w, right: .24*w, top: .865*h),
              child: Animator<double>(
                tween: Tween<double>(begin: 300, end: 0),
                cycles: 2,
                duration: Duration(seconds: 2),
                builder: (context, animatorState, child ) => Center(
                  child: Container(
                      height: animatorState.value,
                      width: animatorState.value,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(18.0))),
                            elevation: 5,
                            color: Colors.white,
                            child: Center(
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Image(image: AssetImage('images/Google logo.webp'), width: .06*w, height: .04*h),
                                    SizedBox(
                                      width: .03*w,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text('Sign in with Google',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                    ),
                                  ],
                                )),
                            onPressed: () {

                            },
                          ),
                        ),
                      )
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: .1*w, top: .10*h),
                child: Column(
                  children: [
                    Text('Account', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Fredoka One')),
                    Text('Type', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Fredoka One')),
                    SizedBox(
                      height: 15,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0))),
                      elevation: 0.5,
                      color: Colors.transparent,
                      child: Container(
                        width: .225*w,
                        height: .075*h,
                        child: Align(
                          alignment: select=="Mentee" ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            width: .07*h,
                            height: .1*w,
                            child: Center(
                              child: Text(
                                  select,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black,
                                    fontFamily: 'Fredoka One',
                                  ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if(select=="Mentee")
                            select="Mentor";
                          else
                            select="Mentee";
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Authentication()));
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
