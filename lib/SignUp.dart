import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:page_transition/page_transition.dart';

import 'Login.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

String gender;
String name;
String password;
String confirmPassword;
String birthday;
String email;
String number;
bool formFilled = false;

class _SignUpFormState extends State<SignUpForm> {
  CollectionReference userRefrence =
      FirebaseFirestore.instance.collection('MentorMentee');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Images/Beach_BG.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height - 200,
                        ),
                        child: SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(context).size.width - 80,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              color: Colors.white.withOpacity(0.97),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  customText('Tell us your name', 18),
                                  SizedBox(height: 20),
                                  _textField(detailInfo: 1),
                                  SizedBox(height: 20),
                                  customText('Drop us your email address', 18),
                                  SizedBox(height: 20),
                                  _textField(
                                      detailInfo: 2,
                                      input: TextInputType.emailAddress),
                                  SizedBox(height: 20),
                                  customText('Password', 18),
                                  SizedBox(height: 20),
                                  _textField(obscure: true, detailInfo: 3),
                                  SizedBox(height: 20),
                                  customText('Confirm Password', 18),
                                  SizedBox(height: 20),
                                  _textField(obscure: true, detailInfo: 4),
                                  SizedBox(height: 20),
                                  customText(
                                      'We\'d love to know your birthday', 18),
                                  SizedBox(height: 20),
                                  _textField(
                                    detailInfo: 5,
                                  ),
                                  SizedBox(height: 20),
                                  customText('Drop us your contact number', 18),
                                  SizedBox(height: 20),
                                  _textField(
                                      detailInfo: 6,
                                      input: TextInputType.number),
                                  SizedBox(height: 20),
                                  customText('What\'s your gender', 18),
                                  SizedBox(height: 20),
                                  Transform(
                                    transform:
                                        Matrix4.translationValues(-10, 0, 0),
                                    child: Row(
                                      children: [
                                        CircularCheckBox(
                                          value:
                                              gender == 'Male' ? true : false,
                                          onChanged: (bool x) {
                                            setState(() {
                                              x == true
                                                  ? gender = 'Male'
                                                  : gender = null;
                                            });
                                          },
                                        ),
                                        customText('Male', 18),
                                      ],
                                    ),
                                  ),
                                  Transform(
                                    transform:
                                        Matrix4.translationValues(-10, 0, 0),
                                    child: Row(
                                      children: [
                                        CircularCheckBox(
                                          value:
                                              gender == 'Female' ? true : false,
                                          onChanged: (bool x) {
                                            setState(() {
                                              x == true
                                                  ? gender = 'Female'
                                                  : gender = null;
                                            });
                                          },
                                        ),
                                        customText('Female', 18),
                                        SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                  Transform(
                                    transform:
                                        Matrix4.translationValues(-10, 0, 0),
                                    child: Row(
                                      children: [
                                        CircularCheckBox(
                                          value:
                                              gender == 'Other' ? true : false,
                                          onChanged: (bool x) {
                                            setState(() {
                                              x == true
                                                  ? gender = 'Other'
                                                  : gender = null;
                                            });
                                          },
                                        ),
                                        customText('Other', 18),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      RaisedButton(
                        elevation: 8,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(0.0),
                        shape: StadiumBorder(),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.blue[400],
                                Colors.blue[700],
                              ],
                            ),
                          ),
                          child: Text(
                            'Next',
                            style:
                                TextStyle(fontSize: 20.0, letterSpacing: 1.5),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 70.0, vertical: 15.0),
                        ),
                        onPressed: () async {
                          if (password == null ||
                              confirmPassword == null ||
                              birthday == null ||
                              email == null ||
                              number == null ||
                              name == null ||
                              gender == null) {
                            showAlertDialog(
                                context, 'Please fill out all the details');
                          } else if (password != confirmPassword) {
                            showAlertDialog(
                                context, 'Two Passwords do not match');
                          } else if (password.length < 8) {
                            showAlertDialog(context,
                                'Please enter an 8 or more digit password');
                          } else {
                            try {
                              try {
                                final newUser = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: email, password: password);
                              } catch (e) {
                                print(e);
                              }
                              userRefrence
                                  .doc(email.substring(0, email.indexOf('@')))
                                  .set({
                                    'Email': email,
                                    'formFilled': formFilled,
                                    'Name': name,
                                    'Birthday': birthday,
                                    'Contact number': number,
                                    'Gender': gender,
                                  })
                                  .then((value) => Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          duration: Duration(milliseconds: 500),
                                          child: Login())))
                                  .catchError(
                                      (error) => print('Failed to add'));
                            } catch (e) {
                              showAlertDialog(context, e);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}

Widget customText(String message, double fontsize) {
  return Text(message,
      style: TextStyle(
          fontSize: fontsize, color: Colors.black, fontFamily: 'Lato'));
}

Widget _textField(
    {bool obscure = false,
    int detailInfo = 0,
    TextInputType input = TextInputType.text}) {
  return Container(
    height: 50,
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.9),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[300],
          offset: Offset(5.0, 5.0),
          blurRadius: 5.0,
          spreadRadius: 2,
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    child: TextField(
      obscureText: obscure,
      keyboardType: input,
      decoration: InputDecoration(border: InputBorder.none),
      onChanged: ((value) {
        switch (detailInfo) {
          case 1:
            name = value;
            break;
          case 2:
            email = value;
            break;
          case 3:
            password = value;
            break;
          case 4:
            confirmPassword = value;
            break;
          case 5:
            birthday = value;
            break;
          case 6:
            number = value;
            break;
        }
      }),
    ),
  );
}

showAlertDialog(BuildContext context, String message) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context, true);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Message"),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
