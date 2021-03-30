import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match_app/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenteeProfile extends StatefulWidget {
  @override
  _MenteeProfileState createState() => _MenteeProfileState();
}

class _MenteeProfileState extends State<MenteeProfile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'images/Background.png',
                ),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 30),
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 80,
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            _button(
                title: "Plan History",
                icon: Icon(Icons.calendar_today_outlined,
                    color: Colors.blue[900])),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Divider(
                height: 0,
                color: Colors.blue[900],
              ),
            ),
            _button(
                title: "Settings",
                icon: Icon(Icons.settings, color: Colors.blue[900])),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Divider(
                height: 0,
                color: Colors.blue[900],
              ),
            ),
            _button(
                title: "Help", icon: Icon(Icons.help, color: Colors.blue[900])),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Divider(
                height: 0,
                color: Colors.blue[900],
              ),
            ),
            _button(
                title: "Legal",
                icon: Icon(Icons.paste_sharp, color: Colors.blue[900])),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Divider(
                height: 0,
                color: Colors.blue[900],
              ),
            ),
            _button(
                title: "Logout",
                index: -1,
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
      ),
    );
  }

  Widget _button({Icon icon, String title, int index}) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () async {
                if (index == -1) {
                  final prefs = await SharedPreferences.getInstance();
                  await FirebaseAuth.instance.signOut();
                  prefs.setString('mentormatch_email', '');
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                }
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
}
