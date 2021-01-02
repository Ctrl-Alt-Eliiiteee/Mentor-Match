import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../Login.dart';

class HomeMentee extends StatefulWidget {
  @override
  _HomeMenteeState createState() => _HomeMenteeState();
}

class _HomeMenteeState extends State<HomeMentee> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HOME MENTEE'),
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
