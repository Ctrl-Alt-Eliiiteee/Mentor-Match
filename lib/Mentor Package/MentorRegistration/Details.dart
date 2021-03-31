import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentor_match_app/Login.dart';
import 'package:mentor_match_app/Mentor%20Package/MentorRegistration/EdDetails.dart';
import 'package:mentor_match_app/Mentor%20Package/MentorRegistration/Hobbies.dart';
import 'package:mentor_match_app/Mentor%20Package/MentorRegistration/Subjects.dart';
import 'package:mentor_match_app/Mentor%20Package/MentorRegistration/TwoChoices.dart';
import 'package:mentor_match_app/Mentor%20Package/MentorRegistration/mentorForm.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [
  EdDetails(),
  StrongSubjects(),
  MentorHobbies(),
  TwoChoice(),
];

// EdDetails
String collegeName;
String collegeYear;
String twelfthMarks;
String degree = 'Graduation Date';
String preferredSession = '';

// Subjects
List<String> strongSubjects = [];

// Hobbies
List<String> hobbyChoices = [];
String extraHobbies = '';

// Two Choices
List<String> choicesSeleted = [];

int _index = 0;

class MentorDetails extends StatefulWidget {
  final String email;
  final String password;

  const MentorDetails({Key key, this.email, this.password}) : super(key: key);
  @override
  _MentorDetailsState createState() => _MentorDetailsState();
}

class _MentorDetailsState extends State<MentorDetails> {
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 30),
                  child: (_index == 0)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Colors.blue[900],
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(color: Colors.blue[900]),
                                      text:
                                          "Before we begin the training process, we\'d like to know you more ;)"),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ),
                pages[_index],
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (_index != 0)
                          ? ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _index -= 1;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 6,
                                  primary: Colors.blue[400],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)))),
                              child: Container(
                                  width: width / 2 - 50,
                                  height: 60,
                                  child: Center(
                                      child: Text("Back",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: 1.2)))))
                          : Container(),
                      ElevatedButton(
                          onPressed: () async {
                            if ((collegeName == null ||
                                    collegeYear == null ||
                                    twelfthMarks == null ||
                                    degree == null ||
                                    preferredSession == null) &&
                                _index == 0) {
                              showAlertDialog(
                                  context, 'Please enter education Details');
                            } else if (strongSubjects.length == 0 &&
                                _index == 1) {
                              showAlertDialog(
                                  context, 'Please enter your strong subjets');
                            } else if (hobbyChoices.length == 0 &&
                                _index == 2) {
                              showAlertDialog(
                                  context, 'Please enter your hobbies');
                            } else if (choicesSeleted.length != 5 &&
                                _index == 3) {
                              showAlertDialog(
                                  context, 'Please select all the fields');
                              print(choicesSeleted.length);
                            } else if (_index < 3) {
                              setState(() {
                                _index += 1;
                              });
                            } else {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              print("Done");
                              setState(() {
                                isDone = true;
                              });
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: widget.email,
                                        password: widget.password);
                              } catch (signUpError) {
                                if (signUpError is PlatformException) {
                                  if (signUpError.code ==
                                      'ERROR_EMAIL_ALREADY_IN_USE') {
                                    showAlertDialog(
                                        context, 'Email already registered');
                                  }
                                }
                              }
                              ///// PARTH'S CODE HERE //////
                              var user =
                                  await Firestore.instance.collection('Mentor');
                              user.doc(widget.email).set({
                                "First name": firstname,
                                "Last name": lastname,
                                "Date of Birth": dateOfBirth,
                                "State": state,
                                "City": city,
                                "Phone Number": phoneNumber,
                                "College name": collegeName,
                                "College year": collegeYear,
                                "Graduation Date": degree,
                                "12th Marks": twelfthMarks,
                                "Preferred Session type": preferredSession,
                                "Strong Subjects":
                                    FieldValue.arrayUnion(strongSubjects),
                                "Hobbies and Interests":
                                    FieldValue.arrayUnion(hobbyChoices),
                                "Choices Seleted":
                                    FieldValue.arrayUnion(choicesSeleted),
                              }).catchError((e) {
                                showAlertDialog(context, e.toString());
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
                              primary: Colors.blue[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          child: Container(
                              width:
                                  (_index == 0) ? width - 60 : width / 2 - 50,
                              height: 60,
                              child: Center(
                                  child: Text("Next",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 1.2))))),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
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
