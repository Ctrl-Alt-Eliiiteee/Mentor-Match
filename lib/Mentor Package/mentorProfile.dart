import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match_app/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MentorProfile extends StatefulWidget {
  @override
  _MentorProfileState createState() => _MentorProfileState();
}

class _MentorProfileState extends State<MentorProfile> {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                width: width - 80,
                height: height / 3 - 30,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.white)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "JANUARY\n\n",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            TextSpan(
                                text: "Rs. 12000\n",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ])),
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 40,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "HOURS\n\n",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            TextSpan(
                                text: "12\n",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "MENTEES\n\n",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            TextSpan(
                                text: "3\n",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "SUBJECTS\n\n",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            TextSpan(
                                text: "7\n",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ])),
                        ],
                      ),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 50,
          ),
          _button(
              title: "Plan History",
              context: context,
              icon:
                  Icon(Icons.calendar_today_outlined, color: Colors.blue[900])),
          Container(
            width: MediaQuery.of(context).size.width - 50,
            child: Divider(
              height: 0,
              color: Colors.blue[900],
            ),
          ),
          _button(
              title: "Settings",
              context: context,
              icon: Icon(Icons.settings, color: Colors.blue[900])),
          Container(
            width: MediaQuery.of(context).size.width - 50,
            child: Divider(
              height: 0,
              color: Colors.blue[900],
            ),
          ),
          _button(
              context: context,
              title: "Help",
              icon: Icon(Icons.help, color: Colors.blue[900])),
          Container(
            width: MediaQuery.of(context).size.width - 50,
            child: Divider(
              height: 0,
              color: Colors.blue[900],
            ),
          ),
          _button(
              title: "Legal",
              context: context,
              icon: Icon(Icons.paste_sharp, color: Colors.blue[900])),
          Container(
            width: MediaQuery.of(context).size.width - 50,
            child: Divider(
              height: 0,
              color: Colors.blue[900],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _button({Icon icon, String title, int index, BuildContext context}) {
  return Padding(
    padding: EdgeInsets.only(right: 20),
    child: Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await FirebaseAuth.instance.signOut();
              prefs.setString('mentormatch_email', '');
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: ListTile(
              leading: icon,
              title: Text(
                title,
                style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w300,
                    fontSize: 25),
              ),
            ),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios_sharp,
          color: Colors.blue[900],
          size: 20,
        ),
      ],
    ),
  );
}
