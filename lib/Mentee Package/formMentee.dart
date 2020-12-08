import 'package:flutter/material.dart';

import '../authentication.dart';
class formMentee extends StatefulWidget {
  @override
  _formMenteeState createState() => _formMenteeState();
}

class _formMenteeState extends State<formMentee> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text('formMentee'),
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
