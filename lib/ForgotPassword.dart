import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Login.dart';
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String Email="";
  String ContactNumber="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.lightBlue[700],
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                'images/Maskwhite.png',
                fit: BoxFit.cover,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Material(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/Logo.png'),
                        radius: 100.0,
                      ),
                      shape: CircleBorder(),
                      elevation: 10,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 35,
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.mail,
                                        color: Colors.deepPurple[400],
                                        size: 15,
                                      ),
                                    ),
                                    TextField(
                                      onChanged: (text){
                                        Email=text;
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                        const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                            horizontal: 20.0),
                                        hintText: 'Email',
                                        hintStyle: TextStyle(fontSize: 10),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              //color: Colors.black,
                                            )),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            // color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 35,
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.phone,
                                        color: Colors.deepPurple[400],
                                        size: 15,
                                      ),
                                    ),
                                    TextField(
                                      onChanged: (text){
                                        ContactNumber=text;
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                        const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                            horizontal: 20.0),
                                        hintText: 'Contact Number',
                                        hintStyle: TextStyle(fontSize: 10),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              //color: Colors.black,
                                            )),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            // color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              Text('A confirmation mail has been sent to your Mail ID ',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 12,
                                ),),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 200,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(colors: [
                                    Colors.yellowAccent,
                                    Colors.yellowAccent[700],
                                  ]),
                                ),
                                child: FlatButton(
                                    onPressed: (){
                                      Navigator.pushReplacement(context, PageTransition(
                                          child: Login(),
                                          type: PageTransitionType.fade,
                                          duration: Duration(milliseconds: 1000)
                                      ));
                                    },
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}


