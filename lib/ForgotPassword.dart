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
    var h =MediaQuery.of(context).size.height;
    var w =MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.lightBlue[700],
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                'images/Maskwhite.png',
                fit: BoxFit.cover,
                height: h,
                width: w,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: h/13.44,
                    ),
                    Material(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/Logo.png'),
                        radius: h/6.72,
                      ),
                      shape: CircleBorder(),
                      elevation: 10,
                    ),
                    SizedBox(
                      height: h/22.4,
                    ),
                    Padding(
                      padding:  EdgeInsets.all(h/40),
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(h/44.8)),
                        child: Padding(
                          padding:  EdgeInsets.all(h/33.6),
                          child: Column(
                            children: [
                              SizedBox(
                                height: h/19.2,
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.mail,
                                        color: Colors.deepPurple[400],
                                        size: h/44.8,
                                      ),
                                    ),
                                    TextField(
                                      onChanged: (text){
                                        Email=text;
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                        EdgeInsets.symmetric(
                                            vertical: h/44.8,
                                            horizontal: h/33.6),
                                        hintText: 'Email',
                                        hintStyle: TextStyle(fontSize: h/67.2),
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
                                height: h/134.4,
                              ),
                              SizedBox(
                                height: h/19.2,
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.phone,
                                        color: Colors.deepPurple[400],
                                        size: h/44.8,
                                      ),
                                    ),
                                    TextField(
                                      onChanged: (text){
                                        ContactNumber=text;
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                         EdgeInsets.symmetric(
                                            vertical: h/44.8,
                                            horizontal: h/33.6),
                                        hintText: 'Contact Number',
                                        hintStyle: TextStyle(fontSize: h/67.2),
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
                                height: h/33.6,
                              ),
                              Text('A confirmation mail has been sent to your Mail ID ',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: h/56,
                                ),),
                              SizedBox(
                                height: h/33.6,
                              ),
                              Container(
                                width: h/3.36,
                                height: h/16.8,
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


