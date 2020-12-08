import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:file_picker/file_picker.dart';
import '../authentication.dart';

String email;
String name;
String birthdate;
String gender;
String number;
String college;
String degree;
String profession;
String hobbies;
String mentorMeaning;
String noOfSessions;
String approval;
PlatformFile pickedFile;

class formMentor extends StatefulWidget {
  @override
  _formMentorState createState() => _formMentorState();
}

class _formMentorState extends State<formMentor> {
  @override
  double sizeBetweenCards = 5;
  String professionTemp = ' ';
  DateTime _dateTime;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#FFF116'),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage(
                  'images/MentorMatch.png',
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width - 20,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Mentor Registeration Form',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(height: 20),
                          Text(
                            'We at Mentor Match, believe that something has to change in the way we approach our academic journeys, and now is the perfect time to make it happen. If you\'re ready to embark on a journey that could potentially change the life of a student forever and help achieve their academic goals, you\'ve come to the right place. But before we rocket launch you into the world of changing lives, we have to do one last thing...',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _textFields(
                      context, "Email Address", "Your email address", 0),
                  SizedBox(height: sizeBetweenCards),
                  _textFields(context, "What's your name?", "Your answer", 1),
                  SizedBox(height: sizeBetweenCards),
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'What\'s your zodiac si- just kidding! When\'s your birthday? ',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          FlatButton(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              minWidth: 40,
                              child: Row(
                                children: [
                                  Text(
                                    birthdate != null ? birthdate : 'dd-mm-yy',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Icon(Icons.date_range_outlined),
                                ],
                              ),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: _dateTime == null
                                            ? DateTime.now()
                                            : _dateTime,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now())
                                    .then((date) {
                                  setState(() {
                                    _dateTime = date;
                                    birthdate = (_dateTime.day.toString() +
                                        '-' +
                                        _dateTime.month.toString() +
                                        '-' +
                                        _dateTime.year.toString() +
                                        '');
                                  });
                                });
                              }),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: sizeBetweenCards),
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Gender ',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Column(
                            children: [
                              ListTile(
                                  leading: Checkbox(
                                      checkColor: HexColor('#FFF116'),
                                      value: gender == 'Male' ? true : false,
                                      onChanged: (bool value) {
                                        setState(() {
                                          if (value == true) {
                                            gender = 'Male';
                                          } else {
                                            gender = null;
                                          }
                                        });
                                      }),
                                  title: Transform(
                                    transform: Matrix4.translationValues(
                                        -16, 0.0, 0.0),
                                    child: Text('Male',
                                        style: TextStyle(fontSize: 20)),
                                  )),
                              ListTile(
                                  leading: Checkbox(
                                      checkColor: HexColor('#FFF116'),
                                      value: gender == 'Female' ? true : false,
                                      onChanged: (bool value) {
                                        setState(() {
                                          if (value == true) {
                                            gender = 'Female';
                                          } else {
                                            gender = null;
                                          }
                                        });
                                      }),
                                  title: Transform(
                                    transform: Matrix4.translationValues(
                                        -16, 0.0, 0.0),
                                    child: Text('Female',
                                        style: TextStyle(fontSize: 20)),
                                  )),
                              ListTile(
                                  leading: Checkbox(
                                      checkColor: HexColor('#FFF116'),
                                      value: gender == 'Other' ? true : false,
                                      onChanged: (bool value) {
                                        setState(() {
                                          if (value == true) {
                                            gender = 'Other';
                                          } else {
                                            gender = null;
                                          }
                                        });
                                      }),
                                  title: Transform(
                                    transform: Matrix4.translationValues(
                                        -16, 0.0, 0.0),
                                    child: Text('Other',
                                        style: TextStyle(fontSize: 20)),
                                  )),
                            ],
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  _textFields(context, "You have our number, do give us yours!",
                      "Your answer", 2),
                  SizedBox(height: sizeBetweenCards),
                  _textFields(context, "Which college did you study in?",
                      "Your answer", 3),
                  SizedBox(height: sizeBetweenCards),
                  _textFields(context, "What degree did you specialize in?",
                      "Your answer", 4),
                  SizedBox(height: sizeBetweenCards),
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Which profession do you study in? ',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Column(
                            children: [
                              ListTile(
                                  leading: Checkbox(
                                      checkColor: HexColor('#FFF116'),
                                      value: profession == 'I am still studying'
                                          ? true
                                          : false,
                                      onChanged: (bool value) {
                                        setState(() {
                                          if (value == true) {
                                            profession = 'I am still studying';
                                          } else {
                                            profession = null;
                                          }
                                        });
                                      }),
                                  title: Transform(
                                    transform: Matrix4.translationValues(
                                        -16, 0.0, 0.0),
                                    child: Text('I am still studying',
                                        style: TextStyle(fontSize: 20)),
                                  )),
                              ListTile(
                                  leading: Checkbox(
                                      checkColor: HexColor('#FFF116'),
                                      value: profession == 'I just graduated'
                                          ? true
                                          : false,
                                      onChanged: (bool value) {
                                        setState(() {
                                          if (value == true) {
                                            profession = 'I just graduated';
                                          } else {
                                            profession = null;
                                          }
                                        });
                                      }),
                                  title: Transform(
                                    transform: Matrix4.translationValues(
                                        -16, 0.0, 0.0),
                                    child: Text('I just graduated',
                                        style: TextStyle(fontSize: 20)),
                                  )),
                              ListTile(
                                  leading: Checkbox(
                                      checkColor: HexColor('#FFF116'),
                                      value: profession == 'I am working'
                                          ? true
                                          : false,
                                      onChanged: (bool value) {
                                        setState(() {
                                          if (value == true) {
                                            profession = 'I am working';
                                          } else {
                                            profession = null;
                                          }
                                        });
                                      }),
                                  title: Transform(
                                    transform: Matrix4.translationValues(
                                        -16, 0.0, 0.0),
                                    child: Text('I am working',
                                        style: TextStyle(fontSize: 20)),
                                  )),
                              ListTile(
                                  leading: Checkbox(
                                      checkColor: HexColor('#FFF116'),
                                      value: profession == 'Unemployed'
                                          ? true
                                          : false,
                                      onChanged: (bool value) {
                                        setState(() {
                                          if (value == true) {
                                            profession = 'Unemployed';
                                          } else {
                                            profession = null;
                                          }
                                        });
                                      }),
                                  title: Transform(
                                    transform: Matrix4.translationValues(
                                        -16, 0.0, 0.0),
                                    child: Text('Unemployed',
                                        style: TextStyle(fontSize: 20)),
                                  )),
                            ],
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  _textFields(
                      context,
                      "What are you passionate about a.k.a what are your hobbies? ",
                      "Your answer",
                      5),
                  SizedBox(height: sizeBetweenCards),
                  _textFields(
                      context,
                      "In one sentence or word, what is being a mentor mean to you? ",
                      "Your answer",
                      6),
                  SizedBox(height: sizeBetweenCards),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'How many times a week would you like to take your study session? (Yep, you get to choose)  ',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Column(
                          children: [
                            ListTile(
                                leading: Checkbox(
                                    checkColor: HexColor('#FFF116'),
                                    value: noOfSessions ==
                                            '3 times a week (12 sessions)'
                                        ? true
                                        : false,
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          noOfSessions =
                                              '3 times a week (12 sessions)';
                                        } else {
                                          noOfSessions = null;
                                        }
                                      });
                                    }),
                                title: Transform(
                                  transform:
                                      Matrix4.translationValues(-16, 0.0, 0.0),
                                  child: Text('3 times a week (12 sessions)',
                                      style: TextStyle(fontSize: 20)),
                                )),
                            ListTile(
                                leading: Checkbox(
                                    checkColor: HexColor('#FFF116'),
                                    value: noOfSessions ==
                                            '4 times a week (16 sessions)'
                                        ? true
                                        : false,
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          noOfSessions =
                                              '4 times a week (16 sessions)';
                                        } else {
                                          noOfSessions = null;
                                        }
                                      });
                                    }),
                                title: Transform(
                                  transform:
                                      Matrix4.translationValues(-16, 0.0, 0.0),
                                  child: Text('4 times a week (16 sessions)',
                                      style: TextStyle(fontSize: 20)),
                                )),
                            ListTile(
                                leading: Checkbox(
                                    checkColor: HexColor('#FFF116'),
                                    value: noOfSessions ==
                                            '5 times a week (20 sessions)'
                                        ? true
                                        : false,
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          noOfSessions =
                                              '5 times a week (20 sessions)';
                                        } else {
                                          noOfSessions = null;
                                        }
                                      });
                                    }),
                                title: Transform(
                                  transform:
                                      Matrix4.translationValues(-16, 0.0, 0.0),
                                  child: Text('5 times a week (20 sessions)',
                                      style: TextStyle(fontSize: 20)),
                                )),
                          ],
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                  SizedBox(height: sizeBetweenCards),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Age and Address Proof (Any one of the following: Aadhaar Card, Driver\'s License) *This is for internal purpose only and will not be shared',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 20, bottom: 20),
                            child: pickedFile == null
                                ? RaisedButton(
                                    onPressed: () async {
                                      FilePickerResult result =
                                          await FilePicker.platform.pickFiles();
                                      if (result != null) {
                                        setState(() {
                                          pickedFile = result.files.first;
                                        });
                                      }
                                    },
                                    child: Text('Upload'),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border(
                                        top: BorderSide(
                                            width: 1, color: Colors.black),
                                        bottom: BorderSide(
                                            width: 1, color: Colors.black),
                                        left: BorderSide(
                                            width: 1, color: Colors.black),
                                        right: BorderSide(
                                            width: 1, color: Colors.black),
                                      ),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width - 200,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              pickedFile.name,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.cancel),
                                            onPressed: () {
                                              setState(() {
                                                pickedFile = null;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                      ],
                    ),
                  ),
                  SizedBox(height: sizeBetweenCards),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'To proceed with us, you would need to sign the terms and conditions, can we take that forward on email?',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Column(
                          children: [
                            ListTile(
                                leading: Checkbox(
                                    checkColor: HexColor('#FFF116'),
                                    value: approval == 'Yes' ? true : false,
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          approval = 'Yes';
                                        } else {
                                          approval = null;
                                        }
                                      });
                                    }),
                                title: Transform(
                                  transform:
                                      Matrix4.translationValues(-16, 0.0, 0.0),
                                  child: Text('Yes',
                                      style: TextStyle(fontSize: 20)),
                                )),
                            ListTile(
                                leading: Checkbox(
                                    checkColor: HexColor('#FFF116'),
                                    value: approval == 'No' ? true : false,
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (value == true) {
                                          approval = 'No';
                                        } else {
                                          approval = null;
                                        }
                                      });
                                    }),
                                title: Transform(
                                  transform:
                                      Matrix4.translationValues(-16, 0.0, 0.0),
                                  child: Text('No',
                                      style: TextStyle(fontSize: 20)),
                                )),
                          ],
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    width: 150,
                    child: RaisedButton(
                      color: HexColor('#3c8ed3'),
                      onPressed: () {
                        if (email == null ||
                            number == null ||
                            gender == null ||
                            birthdate == null ||
                            number == null ||
                            college == null ||
                            degree == null ||
                            profession == null ||
                            hobbies == null ||
                            mentorMeaning == null ||
                            noOfSessions == null ||
                            approval == null ||
                            pickedFile == null) {
                          _showAlertDialog(context);
                        } else {
                          print('Done');
                        }
                        // print(board + ' ' + studyclass);
                      },
                      child: Text("Submit",
                          style: TextStyle(
                            color: HexColor('#FFF116'),
                            fontSize: 20,
                            letterSpacing: 1.2,
                          )),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text("Please enter all the details"),
    actions: [
      FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("Ok"),
      ),
    ],
    elevation: 10,
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

Widget _textFields(
    BuildContext context, String title, String texthint, int index) {
  return Container(
    width: MediaQuery.of(context).size.width - 20,
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Container(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: texthint, hintStyle: TextStyle(fontSize: 18)),
                  onChanged: ((value) {
                    if (index == 0) {
                      email = value;
                    } else if (index == 1) {
                      name = value;
                    } else if (index == 2) {
                      number = value;
                    } else if (index == 3) {
                      college = value;
                    } else if (index == 4) {
                      degree = value;
                    } else if (index == 5) {
                      hobbies = value;
                    } else if (index == 6) {
                      mentorMeaning = value;
                    }
                  }),
                )),
          ),
          SizedBox(height: 30),
        ],
      ),
    ),
  );
}
