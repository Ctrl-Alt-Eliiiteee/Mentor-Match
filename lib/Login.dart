import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match_app/Pages/Navbar.dart';
import 'package:mentor_match_app/Pages/Roleselection.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

String _email = '';
String _password = '';
bool checkboxvalue = false;
String method = '';

bool _signedIn;

class _LoginState extends State<Login> {
  @override
  void initState() {
    setState(() {
      _signedIn = true;
    });
    disconnect();
    // TODO: implement initState
    super.initState();
  }

  void disconnect() async {
    // await googleSignIn.disconnect();
    // FirebaseAuth.instance.signOut();
  }
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.lightBlue[700],
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                'images/Background.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: h / 14,
                    ),
                    Material(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/Logo.png'),
                        radius: h / 6.72,
                      ),
                      shape: CircleBorder(),
                      elevation: 10,
                    ),
                    SizedBox(
                      height: h / 22,
                    ),
                    Padding(
                      padding: EdgeInsets.all(h / 40.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 0, bottom: 40),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            border: Border.all(color: Colors.white)),
                        child: Padding(
                          padding: EdgeInsets.all(h / 33.6),
                          child: Column(
                            children: [
                              SizedBox(
                                height: h / 19.2,
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.mail,
                                        color: Colors.deepPurple[400],
                                        size: h / 44.8,
                                      ),
                                    ),
                                    TextField(
                                      onChanged: (text) {
                                        _email = text;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: h / 44.8,
                                            horizontal: h / 33.6),
                                        hintText: 'Email',
                                        hintStyle:
                                            TextStyle(fontSize: h / 67.2),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                //color: Colors.black,
                                                )),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              // color: Colors.black,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: h / 134.4,
                              ),
                              SizedBox(
                                height: h / 19.2,
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.lock,
                                        color: Colors.deepPurple[400],
                                        size: h / 44.8,
                                      ),
                                    ),
                                    TextField(
                                      onChanged: (text) {
                                        _password = text;
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: h / 44.8,
                                            horizontal: h / 33.6),
                                        hintText: 'Password',
                                        hintStyle:
                                            TextStyle(fontSize: h / 67.2),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                //color: Colors.black,
                                                )),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              // color: Colors.black,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: h / 67.2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: h / 33.6,
                                        width: h / 33.6,
                                        child: Transform.scale(
                                          scale: h / 896,
                                          child: Checkbox(
                                            value: checkboxvalue,
                                            activeColor: Colors.lightBlue[700],
                                            onChanged: (bool newValue) {
                                              setState(() {
                                                checkboxvalue = newValue;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Remember me',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: h / 56,
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    // onTap: () {
                                    //   Navigator.pushReplacement(
                                    //       context,
                                    //       PageTransition(
                                    //           child: ForgotPassword(),
                                    //           type: PageTransitionType.fade,
                                    //           duration: Duration(
                                    //               milliseconds: 1000)));
                                    //},
                                    child: Text(
                                      'forgot password?',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: h / 56,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h / 33.6,
                              ),
                              Container(
                                width: h / 3.36,
                                height: h / 16.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(h / 33.6),
                                ),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blue[400],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)))),
                                    onPressed: () async {
                                      final result =
                                          await InternetAddress.lookup(
                                              'google.com');
                                      if (result.isEmpty &&
                                          result[0].rawAddress.isEmpty) {
                                        showAlertDialog(context,
                                            'Could not reach the server please connect to the internet');
                                      } else if (_email.length < 10 ||
                                          !_email.contains('@') ||
                                          !_email.contains('.com') ||
                                          _password.length < 6) {
                                        showAlertDialog(context,
                                            'Please fill the details properly');
                                      } else {
                                        try {
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                            email: _email,
                                            password: _password,
                                          )
                                              .catchError((e) {
                                            if (e.code == 'user-not-found') {
                                              showAlertDialog(
                                                  context, "User Not Found!");
                                              _signedIn = false;
                                            } else if (e.code ==
                                                'wrong-password') {
                                              showAlertDialog(
                                                  context, 'User Not Found');
                                              _signedIn = false;
                                            }
                                          }).then((value) async {
                                            if (_signedIn == true) {
                                              final prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.setString(
                                                  'mentormatch_email', _email);
                                              var user = await Firestore
                                                  .instance
                                                  .collection('Mentee')
                                                  .doc(_email)
                                                  .get()
                                                  .then((docSnapshot) {
                                                if (docSnapshot.exists) {
                                                  print("Mentee");
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              NavBar(
                                                                select:
                                                                    'Mentee',
                                                              )));
                                                } else {
                                                  print("Mentor");
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              NavBar(
                                                                select:
                                                                    'Mentor',
                                                              )));
                                                }
                                              });
                                            }
                                          });
                                        } catch (e) {
                                          showAlertDialog(
                                              context, e.toString());
                                        }
                                      }
                                      _signedIn = true;
                                    },
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.all(h / 84),
                                child: Container(
                                  width: h / 3.36,
                                  height: h / 16.8,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(h / 33.6),
                                    gradient: LinearGradient(colors: [
                                      Colors.yellowAccent,
                                      Colors.yellowAccent[700],
                                    ]),
                                  ),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.blue[400],
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)))),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 800),
                                                child: ChooseRole()));
                                      },
                                      child: Text(
                                        'Create new account',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

showAlertDialog(BuildContext context, String message) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
