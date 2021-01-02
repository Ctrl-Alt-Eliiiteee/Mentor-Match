import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../Login.dart';

class HomeMentor extends StatefulWidget {
  @override
  _HomeMentorState createState() => _HomeMentorState();
}

class _HomeMentorState extends State<HomeMentor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HOME MENTOR'),
            RaisedButton(
              onPressed: () {
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
    );
  }
}
