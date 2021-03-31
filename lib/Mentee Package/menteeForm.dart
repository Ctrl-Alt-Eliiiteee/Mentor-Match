import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentor_match_app/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenteeForm extends StatefulWidget {
  @override
  _MenteeFormState createState() => _MenteeFormState();
}

String _firstname;
String _lastname;
String _dateOfBirth = 'Date of birth';
String _state;
String _city;
String _phoneNumber;
String _email;
String _password;
String _select;

DateTime _dateTime;

class _MenteeFormState extends State<MenteeForm> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'images/Background.png',
                ),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 50),
                  child: Text("Create Account",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900])),
                ),
                SizedBox(height: 30),
                Container(
                    height: height / 2 + 100,
                    width: width - 50,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all()),
                    child: Center(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _customTextField(
                              width: width - 80,
                              variable: 0,
                              hint: "First name"),
                          SizedBox(height: 15),
                          _customTextField(
                              width: width - 80,
                              variable: 1,
                              hint: "Last name"),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Container(
                                  width: 100,
                                  child: TextFormField(
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                        hintText: _dateOfBirth,
                                        hintStyle:
                                            TextStyle(color: Colors.blue[900])),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.calendar_today_outlined),
                                onPressed: () async {
                                  DateTime picker = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now());
                                  if (picker != null && picker != _dateTime) {
                                    setState(() {
                                      _dateTime = picker;
                                      _dateOfBirth = _dateTime.day.toString() +
                                          '/' +
                                          _dateTime.month.toString() +
                                          '/' +
                                          _dateTime.year.toString();
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          _customTextField(
                              width: width - 80, variable: 2, hint: "State"),
                          SizedBox(height: 15),
                          _customTextField(
                              width: width - 80, variable: 3, hint: "City"),
                          SizedBox(height: 15),
                          _customTextField(
                              width: width - 80,
                              variable: 4,
                              hint: "Phone number",
                              type: TextInputType.number),
                          SizedBox(height: 15),
                          _customTextField(
                              width: width - 80, variable: 5, hint: "Email id"),
                          SizedBox(height: 15),
                          _customTextField(
                            width: width - 80,
                            variable: 6,
                            hint: "Password",
                            obscureText: true,
                          ),
                        ],
                      ),
                    ))),
                SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () async {
                      if (_firstname == null ||
                          _lastname == null ||
                          _dateOfBirth == null ||
                          _state == null ||
                          _city == null ||
                          _email == null ||
                          _phoneNumber == null ||
                          _password == null) {
                        showAlertDialog(
                            context, "Please fill out all the fields");
                      } else if (_password.length < 8) {
                        showAlertDialog(
                            context, "Password length should be >=8");
                      } else if (!_email.contains('@') ||
                          !_email.contains('.com')) {
                        showAlertDialog(context, 'Invalid email');
                      } else {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _email, password: _password);
                        } catch (signUpError) {
                          if (signUpError is PlatformException) {
                            if (signUpError.code ==
                                'ERROR_EMAIL_ALREADY_IN_USE') {
                              showAlertDialog(
                                  context, 'Email already registered');
                            }
                          }
                        }
                        var user = await Firestore.instance.collection(_select);
                        user.doc(_email).set({
                          'Firstname': _firstname,
                          'Lastname': _lastname,
                          'Date of Birth': _dateOfBirth,
                          'State': _state,
                          'City': _city,
                          'Phone Number': _phoneNumber,
                        }).then((value) => {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()))
                            });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 6,
                        primary: Colors.blue[300],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: Container(
                        width: width - 150,
                        height: 60,
                        child: Center(
                            child: Text("Get Started!",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1.2)))))
              ],
            ),
          ),
        ),
      )),
    );
  }
}

Widget _customTextField(
    {double width = 100,
    int variable = 0,
    TextInputType type = TextInputType.text,
    String hint = 'Provide Hint',
    bool obscureText = false}) {
  return Container(
    width: width,
    child: TextFormField(
      onChanged: (value) {
        if (variable == 0)
          _firstname = value;
        else if (variable == 1)
          _lastname = value;
        else if (variable == 2)
          _state = value;
        else if (variable == 3)
          _city = value;
        else if (variable == 4)
          _phoneNumber = value;
        else if (variable == 5)
          _email = value;
        else if (variable == 6) _password = value;
      },
      keyboardType: type,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: hint, labelStyle: TextStyle(color: Colors.blue[900])),
    ),
  );
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
