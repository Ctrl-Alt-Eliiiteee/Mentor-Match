import 'package:flutter/material.dart';
import 'package:mentor_match_app/database.dart';

import '../authentication.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

String email;
String name;
String number;
String school;
String hobbies;
String tvShow;
String futureStream;
String time = '__:__';
String birthdate = 'dd-mm-yy';
String gender;
String board = ' ';
String studyclass = ' ';
String studySession;
String sessionLength;

class formMentee extends StatefulWidget {
  @override
  _formMenteeState createState() => _formMenteeState();
}

class _formMenteeState extends State<formMentee> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor('#FFF116'),
          body: AnimationLimiter(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 800),
                  child: SlideAnimation(
                    verticalOffset: 150.0,
                    child: FlipAnimation(
                      child: SignUpForm(),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  final String uid;

  const SignUpForm({Key key, this.uid}) : super(key: key);
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  double sizeBetweenCards = 5;
  DateTime _dateTime;
  TimeOfDay studyTime;
  String boardTemp;
  String classTemp;
  Widget build(BuildContext context) {
    return Center(
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
                      Text('Mentee Registeration Form',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 20),
                      Text(
                        'So, we get that 2020 has been absolutely crazy - Zoom is the new school, Houseparty is the new actual party and Netflix is the new movie theatre. We thought since things seem to be getting a cool upgrade during these times when the old stuff isn\'t available, why not just change the way we study too and make it something fun. And while you\'re having fun, also manage to get you all the skills you need to ace your academics. ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _textFields(context, 'Email', 'Your email address', 0),
              SizedBox(height: sizeBetweenCards),
              _textFields(context, 'What\'s your name', 'Your name', 1),
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
                                birthdate,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
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
                                transform:
                                    Matrix4.translationValues(-16, 0.0, 0.0),
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
                                transform:
                                    Matrix4.translationValues(-16, 0.0, 0.0),
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
                                transform:
                                    Matrix4.translationValues(-16, 0.0, 0.0),
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
              SizedBox(height: sizeBetweenCards),
              _textFields(context, 'You have our number, do give us yours',
                  'Your answer', 2),
              SizedBox(height: sizeBetweenCards),
              _textFields(
                  context, 'Which School do you Study in?', 'Your answer', 3),
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
                          'Which board do you study in? ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Column(
                        children: [
                          ListTile(
                              leading: Checkbox(
                                  checkColor: HexColor('#FFF116'),
                                  value: board == 'ICSE' ? true : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        board = 'ICSE';
                                      } else {
                                        board = null;
                                      }
                                    });
                                  }),
                              title: Transform(
                                transform:
                                    Matrix4.translationValues(-16, 0.0, 0.0),
                                child: Text('ICSE',
                                    style: TextStyle(fontSize: 20)),
                              )),
                          ListTile(
                              leading: Checkbox(
                                  checkColor: HexColor('#FFF116'),
                                  value: board == 'CBSE' ? true : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        board = 'CBSE';
                                      } else {
                                        board = null;
                                      }
                                    });
                                  }),
                              title: Transform(
                                transform:
                                    Matrix4.translationValues(-16, 0.0, 0.0),
                                child: Text('CBSE',
                                    style: TextStyle(fontSize: 20)),
                              )),
                          ListTile(
                              leading: Checkbox(
                                  checkColor: HexColor('#FFF116'),
                                  value: board == 'State board' ? true : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        board = 'State board';
                                      } else {
                                        board = null;
                                      }
                                    });
                                  }),
                              title: Transform(
                                transform:
                                    Matrix4.translationValues(-16, 0.0, 0.0),
                                child: Text('State board',
                                    style: TextStyle(fontSize: 20)),
                              )),
                          ListTile(
                              leading: Checkbox(
                                  checkColor: HexColor('#FFF116'),
                                  value:
                                      board == 'International Baccalaureate(IB)'
                                          ? true
                                          : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        board =
                                            'International Baccalaureate(IB)';
                                      } else {
                                        board = null;
                                      }
                                    });
                                  }),
                              title: Transform(
                                transform:
                                    Matrix4.translationValues(-16, 0.0, 0.0),
                                child: Text('International Baccalaureate(IB)',
                                    style: TextStyle(fontSize: 20)),
                              )),
                          Row(
                            children: [
                              SizedBox(width: 17),
                              Checkbox(
                                  checkColor: HexColor('#FFF116'),
                                  value: board == "Other" ? true : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        board = "Other";
                                      } else {
                                        board = null;
                                      }
                                    });
                                  }),
                              Text('Other: ', style: TextStyle(fontSize: 20)),
                              Container(
                                  width: 200,
                                  child: TextField(
                                    onChanged: ((value) {
                                      boardTemp = value;
                                    }),
                                  )),
                            ],
                          ),
                        ],
                      ),
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
                          'Starting to sound like an aunty at a wedding but... which standard do you study in?',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Column(
                        children: [
                          ListTile(
                              leading: Checkbox(
                                  checkColor: HexColor('#FFF116'),
                                  value: studyclass == 'Class 9' ? true : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        studyclass = 'Class 9';
                                      } else {
                                        studyclass = null;
                                      }
                                    });
                                  }),
                              title: Transform(
                                transform:
                                    Matrix4.translationValues(-16, 0.0, 0.0),
                                child: Text('Class 9',
                                    style: TextStyle(fontSize: 20)),
                              )),
                          ListTile(
                              leading: Checkbox(
                                  checkColor: HexColor('#FFF116'),
                                  value:
                                      studyclass == 'Class 10' ? true : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        studyclass = 'Class 10';
                                      } else {
                                        studyclass = null;
                                      }
                                    });
                                  }),
                              title: Transform(
                                transform:
                                    Matrix4.translationValues(-16, 0.0, 0.0),
                                child: Text('Class 10',
                                    style: TextStyle(fontSize: 20)),
                              )),
                          ListTile(
                              leading: Checkbox(
                                  checkColor: HexColor('#FFF116'),
                                  value:
                                      studyclass == 'Class 11' ? true : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        studyclass = 'Class 11';
                                      } else {
                                        studyclass = null;
                                      }
                                    });
                                  }),
                              title: Transform(
                                transform:
                                    Matrix4.translationValues(-16, 0.0, 0.0),
                                child: Text('Class 11',
                                    style: TextStyle(fontSize: 20)),
                              )),
                          ListTile(
                              leading: Checkbox(
                                  checkColor: HexColor('#FFF116'),
                                  value:
                                      studyclass == 'Class 12' ? true : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        studyclass = 'Class 12';
                                      } else {
                                        studyclass = null;
                                      }
                                    });
                                  }),
                              title: Transform(
                                transform:
                                    Matrix4.translationValues(-16, 0.0, 0.0),
                                child: Text('Class 12',
                                    style: TextStyle(fontSize: 20)),
                              )),
                          Row(
                            children: [
                              SizedBox(width: 17),
                              Checkbox(
                                  checkColor: HexColor('#FFF116'),
                                  value: studyclass == 'Other' ? true : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        studyclass = 'Other';
                                      } else {
                                        studyclass = null;
                                      }
                                    });
                                  }),
                              Text('Other: ', style: TextStyle(fontSize: 20)),
                              Container(
                                  width: 200,
                                  child: TextField(
                                    onChanged: ((value) {
                                      classTemp = value;
                                    }),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              SizedBox(height: sizeBetweenCards),
              _textFields(
                  context,
                  'What are you passionate about a.k.a what are your hobbies?',
                  'Your answer',
                  4),
              SizedBox(height: sizeBetweenCards),
              _textFields(
                  context,
                  'What\'s your favorite tv show? And no, we aren\'t asking you this just for fun... we genuinely want to know! ',
                  'Your answer',
                  5),
              SizedBox(height: sizeBetweenCards),
              _textFields(
                  context,
                  'Which college or stream do you aspire to undertake after school?',
                  'Your answer',
                  6),
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
                          'How many times a week would you like to take your study session? (Yep, you get to choose)  ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Column(
                        children: [
                          ListTile(
                              leading: Checkbox(
                                  checkColor: HexColor('#FFF116'),
                                  value: studySession ==
                                          '3 times a week (12 sessions)'
                                      ? true
                                      : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        studySession =
                                            '3 times a week (12 sessions)';
                                      } else {
                                        studySession = null;
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
                                  value: studySession ==
                                          '4 times a week (16 sessions)'
                                      ? true
                                      : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        studySession =
                                            '4 times a week (16 sessions)';
                                      } else {
                                        studySession = null;
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
                                  value: studySession ==
                                          '5 times a week (20 sessions)'
                                      ? true
                                      : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        studySession =
                                            '5 times a week (20 sessions)';
                                      } else {
                                        studySession = null;
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
                          'How long would you want the sessions to be? (You get to choose this too)',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Column(
                        children: [
                          ListTile(
                              leading: Checkbox(
                                  checkColor: HexColor('#FFF116'),
                                  value:
                                      sessionLength == '1 hour' ? true : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        sessionLength = '1 hour';
                                      } else {
                                        sessionLength = null;
                                      }
                                    });
                                  }),
                              title: Transform(
                                transform:
                                    Matrix4.translationValues(-16, 0.0, 0.0),
                                child: Text('1 hour',
                                    style: TextStyle(fontSize: 20)),
                              )),
                          ListTile(
                              leading: Checkbox(
                                  checkColor: HexColor('#FFF116'),
                                  value: sessionLength == '1.5 hour'
                                      ? true
                                      : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        sessionLength = '1.5 hour';
                                      } else {
                                        sessionLength = null;
                                      }
                                    });
                                  }),
                              title: Transform(
                                transform:
                                    Matrix4.translationValues(-16, 0.0, 0.0),
                                child: Text('1.5 hour',
                                    style: TextStyle(fontSize: 20)),
                              )),
                          ListTile(
                              leading: Checkbox(
                                  checkColor: HexColor('#FFF116'),
                                  value:
                                      sessionLength == '2 hour' ? true : false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if (value == true) {
                                        sessionLength = '2 hour';
                                      } else {
                                        sessionLength = null;
                                      }
                                    });
                                  }),
                              title: Transform(
                                transform:
                                    Matrix4.translationValues(-16, 0.0, 0.0),
                                child: Text('2 hour',
                                    style: TextStyle(fontSize: 20)),
                              )),
                        ],
                      ),
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
                          'What time would you like the session to take place? (Make sure to keep time to relax as well, you have your whole life to be busy!) ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: FlatButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            minWidth: 40,
                            child: Row(
                              children: [
                                Text(
                                  time,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Icon(Icons.access_time),
                              ],
                            ),
                            onPressed: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then((times) {
                                setState(() {
                                  studyTime = times;
                                  time = times.hour.toString() +
                                      ':' +
                                      times.minute.toString();
                                });
                              });
                            }),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
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
                        school == null ||
                        classTemp == null ||
                        boardTemp == null ||
                        hobbies == null ||
                        tvShow == null ||
                        futureStream == null ||
                        studyTime == null ||
                        sessionLength == null ||
                        time == null) {
                      _showAlertDialog(context);
                    } else {
                      if (board == "Other") {
                        board = boardTemp;
                      }
                      if (studyclass == "Other") {
                        studyclass = classTemp;
                      }
                      updateDatabase();
                      print(studyclass + ' ' + board);
                    }
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
    );
  }
}

Future updateDatabase() async {}

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
                      school = value;
                    } else if (index == 4) {
                      hobbies = value;
                    } else if (index == 5) {
                      tvShow = value;
                    } else if (index == 6) {
                      futureStream = value;
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
