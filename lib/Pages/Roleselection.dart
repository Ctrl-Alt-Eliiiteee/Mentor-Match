import 'package:flutter/material.dart';
import 'package:mentor_match_app/Mentee%20Package/menteeForm.dart';
import 'package:mentor_match_app/Mentor%20Package/MentorRegistration/mentorForm.dart';
import 'package:page_transition/page_transition.dart';

class ChooseRole extends StatefulWidget {
  @override
  _ChooseRoleState createState() => _ChooseRoleState();
}

class _ChooseRoleState extends State<ChooseRole> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'images/Background.png',
                      ),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Center(
                      child: Text("Who are you?",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]))),
                  SizedBox(height: 30),
                  Container(
                      height: height / 3,
                      width: width - 30,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        children: [
                          Container(
                              width: width / 2 - 55,
                              height: height / 3,
                              child: Image.asset(
                                'images/Mentee.png',
                                fit: BoxFit.cover,
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 35, top: 20),
                                  child: Text("Mentee",
                                      style: TextStyle(
                                          fontSize: width * 0.12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900])),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                    padding: EdgeInsets.only(left: 15, top: 0),
                                    child: RichText(
                                        text: TextSpan(
                                            text:
                                                "A School Student \n who never has to \nstudy alone again",
                                            style: TextStyle(
                                                color: Colors.blue[900],
                                                fontSize: 0.05 * width,
                                                fontWeight: FontWeight.w400)))),
                                SizedBox(height: 30),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: MenteeForm(),
                                              type: PageTransitionType.fade));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 6,
                                        primary: Colors.blue[300],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)))),
                                    child: Container(
                                        width: width / 2 - 50,
                                        height: 50,
                                        child: Center(
                                            child: Text("BECOME A MENTEE",
                                                style: TextStyle(
                                                    fontSize: width * 0.04,
                                                    fontWeight: FontWeight.w300,
                                                    letterSpacing: 1.2)))))
                              ],
                            ),
                          )
                        ],
                      )),
                  SizedBox(height: 40),
                  Container(
                      height: height / 3,
                      width: width - 30,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 0, top: 20),
                                  child: Text("Mentor",
                                      style: TextStyle(
                                          fontSize: width * 0.12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900])),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                    padding: EdgeInsets.only(left: 20, top: 0),
                                    child: RichText(
                                        text: TextSpan(
                                            text:
                                                "A College Student \nwho is trained to \nbe astudy buddy!",
                                            style: TextStyle(
                                                color: Colors.blue[900],
                                                fontSize: 0.05 * width,
                                                fontWeight: FontWeight.w400)))),
                                SizedBox(height: 30),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: MentorForm(),
                                              type: PageTransitionType.fade));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 6,
                                        primary: Colors.blue[300],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)))),
                                    child: Container(
                                        width: 130,
                                        height: 50,
                                        child: Center(
                                            child: Text("BECOME A MENTOR",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w300,
                                                    letterSpacing: 1.2)))))
                              ],
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              width: width / 2 - 55,
                              height: height / 3,
                              child: Image.asset(
                                'images/Mentor.png',
                                fit: BoxFit.cover,
                              )),
                        ],
                      )),
                ],
              ))),
    );
  }
}
