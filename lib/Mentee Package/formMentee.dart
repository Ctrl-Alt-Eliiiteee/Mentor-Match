import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentor_match_app/Login.dart';
import 'package:page_transition/page_transition.dart';

import 'HomeMentee.dart';

class MenteeForm extends StatefulWidget {
  @override
  _MneteeFormState createState() => _MneteeFormState();
}

String menteeSessions;
int page = 1;
List<String> dropDownItems = ['label', '1 hour', '1.5 hours', '2 hours'];
String select;
String menteeSessionsLength = 'label';
String menteeSchool;
String menteeClass;
String menteeBoard;
String menteeTime;
String menteeTvShow;
String menteeAspiredCollege;

class _MneteeFormState extends State<MenteeForm> {
  CollectionReference userRefrence =
      FirebaseFirestore.instance.collection('MentorMentee');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Images/Snow_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: IntroductionScreen(
            done: Container(),
            onDone: () {},
            globalBackgroundColor: Colors.transparent,
            pages: [
              PageViewModel(
                  title: '',
                  bodyWidget: Align(
                    alignment: Alignment.center,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height - 250,
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 80,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white.withOpacity(0.97),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                customText('Where do you go to school? ', 18),
                                SizedBox(height: 20),
                                _textField(detailInfo: 1),
                                SizedBox(height: 20),
                                customText(
                                    'Starting to sound like an aunty at a wedding but... which standard do you study in? ',
                                    18),
                                SizedBox(height: 20),
                                _textField(detailInfo: 2),
                                SizedBox(height: 20),
                                customText(
                                    'Let us know which board you study in', 18),
                                SizedBox(height: 20),
                                _textField(detailInfo: 3),
                                SizedBox(height: 20),
                                customText(
                                    'How would you like your sessions? ', 18),
                                Transform(
                                  transform:
                                      Matrix4.translationValues(-10, 0, 0),
                                  child: Row(
                                    children: [
                                      CircularCheckBox(
                                        value: menteeSessions == 'In-Person'
                                            ? true
                                            : false,
                                        onChanged: (bool x) {
                                          setState(() {
                                            x == true
                                                ? menteeSessions = 'In-Person'
                                                : menteeSessions = null;
                                          });
                                        },
                                      ),
                                      customText('In-Person', 18),
                                    ],
                                  ),
                                ),
                                Transform(
                                  transform:
                                      Matrix4.translationValues(-10, 0, 0),
                                  child: Row(
                                    children: [
                                      CircularCheckBox(
                                        value: menteeSessions == 'Online'
                                            ? true
                                            : false,
                                        onChanged: (bool x) {
                                          setState(() {
                                            x == true
                                                ? menteeSessions = 'Online'
                                                : menteeSessions = null;
                                          });
                                        },
                                      ),
                                      customText('Online', 18),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              PageViewModel(
                  title: '',
                  bodyWidget: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height - 250,
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
                                    customText(
                                        'How long do you want your sessions?',
                                        18),
                                    SizedBox(height: 20),
                                    Container(
                                      height: 40,
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        color: Colors.yellow,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[300],
                                            offset: Offset(5.0, 5.0),
                                            blurRadius: 5.0,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            value: menteeSessionsLength == null
                                                ? 'label'
                                                : menteeSessionsLength,
                                            items: dropDownItems.map((item) {
                                              return DropdownMenuItem(
                                                child: new Text(item),
                                                value: item,
                                              );
                                            }).toList(),
                                            onChanged: ((value) {
                                              setState(() {
                                                menteeSessionsLength = value;
                                              });
                                            })),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    customText(
                                        'What time are you comfirtable with? ',
                                        18),
                                    SizedBox(height: 20),
                                    _textField(detailInfo: 4),
                                    SizedBox(height: 20),
                                    customText(
                                        'What\'s your favorite tv show? And no, we aren\'t asking you this just for fun... we genuinely want to know! ',
                                        18),
                                    SizedBox(height: 20),
                                    _textField(detailInfo: 5),
                                    SizedBox(height: 20),
                                    customText(
                                        'Which college or stream do you aspire to undertake after school?  ',
                                        18),
                                    SizedBox(height: 20),
                                    _textField(detailInfo: 6),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
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
                            'Submit',
                            style:
                                TextStyle(fontSize: 20.0, letterSpacing: 1.5),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 70.0, vertical: 15.0),
                        ),
                        onPressed: () {
                          if (menteeSchool == null ||
                              menteeClass == null ||
                              menteeBoard == null ||
                              menteeSessions == null ||
                              menteeSessionsLength == 'label' ||
                              menteeTime == null ||
                              menteeTvShow == null ||
                              menteeAspiredCollege == null) {
                            showAlertDialog(
                                context, 'Please fill out all the details');
                          } else {
                            try {
                              userRefrence
                                  .doc(Email.substring(0, Email.indexOf('@')))
                                  .update({
                                    'School': menteeSchool,
                                    'Class': menteeClass,
                                    'Board': menteeBoard,
                                    'Sessions': menteeSessions,
                                    'Session Length': menteeSessionsLength,
                                    'Session Time': menteeTime,
                                    'Favorite TvShow': menteeTvShow,
                                    'Aspired College': menteeAspiredCollege,
                                    'formFilled': true,
                                    'select': 'mentee',
                                  })
                                  .then((value) => Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          duration: Duration(milliseconds: 800),
                                          child: HomeMentee())))
                                  .catchError((error) => showAlertDialog(
                                      context, 'Some error occured'));
                            } catch (e) {
                              showAlertDialog(context, e);
                            }
                          }
                        },
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}

Widget customText(String message, double fontsize) {
  return Text(message,
      style: TextStyle(
          fontSize: fontsize, color: Colors.black, fontFamily: 'Lato'));
}

Widget _textField({int detailInfo = 0}) {
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
      decoration: InputDecoration(border: InputBorder.none),
      onChanged: ((value) {
        switch (detailInfo) {
          case 1:
            menteeSchool = value;
            break;
          case 2:
            menteeClass = value;
            break;
          case 3:
            menteeBoard = value;
            break;
          case 4:
            menteeTime = value;
            break;
          case 5:
            menteeTvShow = value;
            break;
          case 6:
            menteeAspiredCollege = value;
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
