import 'package:flutter/material.dart';

import '../authentication.dart';
class formMentor extends StatefulWidget {
  @override
  _formMentorState createState() => _formMentorState();
}

class _formMentorState extends State<formMentor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text('formMentor'),
            RaisedButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Authentication()));
              },
            )
          ],
        ),
      ),
    );
  }
}
