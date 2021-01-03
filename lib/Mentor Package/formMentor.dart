import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentor_match_app/Login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'HomeMentor.dart';

class MentorForm extends StatefulWidget {
  @override
  _MentorFormState createState() => _MentorFormState();
}

int page = 1;
String mentorOccupation;
List<String> dropDownItems = ['label', '1 hour', '1.5 hours', '2 hours'];
String mentorSessionsLength = 'label';
//PlatformFile pickedFile;
String select;
String mentorCollege;
String mentorDegree;
String mentorMeaning;
String emailApproval;

class _MentorFormState extends State<MentorForm> {
  CollectionReference userRefrence =
      FirebaseFirestore.instance.collection('MentorMentee');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 100),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Images/Fall_BG.jpg'),
              fit: BoxFit.cover)),
      child: IntroductionScreen(
        done: Container(
          height: 1,
          width: 1,
        ),
        globalBackgroundColor: Colors.transparent,
        onDone: () {},
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
                        color: Colors.white.withOpacity(0.97),
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            customText('Which college do you study in? ', 18),
                            SizedBox(height: 20),
                            _textField(detailInfo: 1),
                            SizedBox(height: 20),
                            customText(
                                'Which degree are you specializing/specialized in? ',
                                18),
                            SizedBox(height: 20),
                            _textField(detailInfo: 2),
                            SizedBox(height: 20),
                            customText(
                                'In one sentence or word, describe what does being a mentor mean to you',
                                18),
                            SizedBox(height: 20),
                            _textField(detailInfo: 3),
                            SizedBox(height: 20),
                            customText(
                                'How long do you want your sessions?', 18),
                            SizedBox(height: 20),
                            Container(
                              height: 40,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
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
                                    value: mentorSessionsLength == null
                                        ? 'label'
                                        : mentorSessionsLength,
                                    items: dropDownItems.map((item) {
                                      return DropdownMenuItem(
                                        child: new Text(item),
                                        value: item,
                                      );
                                    }).toList(),
                                    onChanged: ((value) {
                                      setState(() {
                                        mentorSessionsLength = value;
                                      });
                                    })),
                              ),
                            ),
                            SizedBox(height: 20),
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
                          color: Colors.white.withOpacity(0.97),
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              customText('What is your occupation? ', 18),
                              SizedBox(height: 20),
                              Transform(
                                transform: Matrix4.translationValues(-10, 0, 0),
                                child: Row(
                                  children: [
                                    CircularCheckBox(
                                      value: mentorOccupation ==
                                              'I am still studying'
                                          ? true
                                          : false,
                                      onChanged: (bool x) {
                                        setState(() {
                                          x == true
                                              ? mentorOccupation =
                                                  'I am still studying'
                                              : mentorOccupation = null;
                                        });
                                      },
                                    ),
                                    customText('I am still studying', 18),
                                  ],
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(-10, 0, 0),
                                child: Row(
                                  children: [
                                    CircularCheckBox(
                                      value:
                                          mentorOccupation == 'I just graduated'
                                              ? true
                                              : false,
                                      onChanged: (bool x) {
                                        setState(() {
                                          x == true
                                              ? mentorOccupation =
                                                  'I just graduated'
                                              : mentorOccupation = null;
                                        });
                                      },
                                    ),
                                    customText('I just graduated', 18),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(-10, 0, 0),
                                child: Row(
                                  children: [
                                    CircularCheckBox(
                                      value: mentorOccupation == 'I am working'
                                          ? true
                                          : false,
                                      onChanged: (bool x) {
                                        setState(() {
                                          x == true
                                              ? mentorOccupation =
                                                  'I am working'
                                              : mentorOccupation = null;
                                        });
                                      },
                                    ),
                                    customText('I am working', 18),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              customText(
                                  'Age and Address Proof (Any one of the following: Aadhaar Card, Driver\'s License) *This is for internal purpose only and will not be shared',
                                  18),
                              SizedBox(height: 20),
                              _textField(),
                              SizedBox(height: 20),
                              customText(
                                  'To proceed with us, you would have to sign the terms and conditions. Can we take that on email?',
                                  18),
                              SizedBox(height: 20),
                              Transform(
                                transform: Matrix4.translationValues(-10, 0, 0),
                                child: Row(
                                  children: [
                                    CircularCheckBox(
                                      value:
                                          emailApproval == 'Yes' ? true : false,
                                      onChanged: (bool x) {
                                        setState(() {
                                          x == true
                                              ? emailApproval = 'Yes'
                                              : emailApproval = null;
                                        });
                                      },
                                    ),
                                    customText('Yes', 18),
                                  ],
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(-10, 0, 0),
                                child: Row(
                                  children: [
                                    CircularCheckBox(
                                      value:
                                          emailApproval == 'No' ? true : false,
                                      onChanged: (bool x) {
                                        setState(() {
                                          x == true
                                              ? emailApproval = 'No'
                                              : emailApproval = null;
                                        });
                                      },
                                    ),
                                    customText('No', 18),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
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
                  textColor: Colors.black,
                  padding: EdgeInsets.all(0.0),
                  shape: StadiumBorder(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.yellow,
                          Colors.orange,
                        ],
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20.0, letterSpacing: 1.5),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
                  ),
                  onPressed: () async {
                    if (mentorCollege == null ||
                        mentorDegree == null ||
                        mentorMeaning == null ||
                        mentorSessionsLength == 'label' ||
                        mentorOccupation == null ||
                        emailApproval == null) {
                      showAlertDialog(
                          context, 'Please fill out all the details');
                    } else {
                      try {
                        userRefrence
                            .doc(Email.substring(0, Email.indexOf('@')))
                            .update({
                              'College': mentorCollege,
                              'Degree specialization': mentorDegree,
                              'What does being a mentor mean to you':
                                  mentorMeaning,
                              'Session length': mentorSessionsLength,
                              'Occupation': mentorOccupation,
                              'Approval to email': emailApproval,
                              'formFilled': true,
                              'select': 'mentor',
                            })
                            .then((value) => Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 800),
                                    child: HomeMentor())))
                            .catchError((error) =>
                                showAlertDialog(context, 'Some error occured'));
                        final prefs = await SharedPreferences.getInstance();
                        if(checkboxvalue == true || method =='google') {
                          prefs.setString(
                              'mentormatch_email',
                              Email.toString());
                          prefs.setString(
                              'mentorormatch',
                              'mentor');
                        }
                        main();
                      } catch (e) {
                        showAlertDialog(context, e);
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

//_________________________________________________________________________________________________________
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
            mentorCollege = value;
            break;
          case 2:
            mentorDegree = value;
            break;
          case 3:
            mentorMeaning = value;
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
