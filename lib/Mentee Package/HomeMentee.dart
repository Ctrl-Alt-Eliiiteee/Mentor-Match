import 'package:flutter/material.dart';
import 'package:mentor_match_app/Pages/HomePage.dart';
import 'package:mentor_match_app/Pages/ProfilePage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Login.dart';

class HomeMentee extends StatefulWidget {
  @override
  _HomeMenteeState createState() => _HomeMenteeState();
}

class _HomeMenteeState extends State<HomeMentee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('HOME MENTEE'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 50.0,
                    child: RaisedButton(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Homepage()));
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Colors.white,
                      textColor: Color.fromRGBO(0, 160, 227, 1),
                      child: Text("HomePage",
                          style: TextStyle(fontSize: 15)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 50.0,
                    child: RaisedButton(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Colors.white,
                      textColor: Color.fromRGBO(0, 160, 227, 1),
                      child: Text("Profile",
                          style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('mentormatch_email', '');
                  prefs.setString('mentorormatch', '');
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 800),
                          child: Login()));
                },
                child: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
