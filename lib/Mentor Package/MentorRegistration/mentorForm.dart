import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentor_match_app/Mentor%20Package/MentorRegistration/Details.dart';

class MentorForm extends StatefulWidget {
  @override
  _MentorFormState createState() => _MentorFormState();
}

String firstname;
String lastname;
String dateOfBirth = 'Date of birth';
String state;
String city;
String phoneNumber;
String _email;
String _password;
String _select = 'Mentor';

DateTime _dateTime;

class _MentorFormState extends State<MentorForm> {
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Container(
                                    width: 100,
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      dateOfBirth,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: IconButton(
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
                                        dateOfBirth = _dateTime.day.toString() +
                                            '/' +
                                            _dateTime.month.toString() +
                                            '/' +
                                            _dateTime.year.toString();
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Divider(
                              color: Colors.black45,
                              thickness: 1,
                            ),
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
                      if (firstname == null ||
                          lastname == null ||
                          dateOfBirth == null ||
                          state == null ||
                          city == null ||
                          _email == null ||
                          phoneNumber == null ||
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MentorDetails(
                                      email: _email,
                                      password: _password,
                                    )));
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
          firstname = value;
        else if (variable == 1)
          lastname = value;
        else if (variable == 2)
          state = value;
        else if (variable == 3)
          city = value;
        else if (variable == 4)
          phoneNumber = value;
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
