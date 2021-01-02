import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ForgotPassword.dart';
import 'package:page_transition/page_transition.dart';

import 'Mentee Package/HomeMentee.dart';
import 'Mentor Package/HomeMentor.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
String Email="";
String Password="";
class _LoginState extends State<Login> {
  CollectionReference userRefrence =
      FirebaseFirestore.instance.collection('MentorMentee');
  bool checkboxvalue = false;
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
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
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
                                        Icons.lock,
                                        color: Colors.deepPurple[400],
                                        size: 15,
                                      ),
                                    ),
                                    TextField(
                                      onChanged: (text){
                                        Password=text;
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        contentPadding:
                                        const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                            horizontal: 20.0),
                                        hintText: 'Password',
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
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        child: Transform.scale(
                                          scale: 0.75,
                                          child: Checkbox(
                                            value: checkboxvalue,
                                            activeColor: Colors.lightBlue[700],
                                            onChanged: (bool newValue) {
                                              setState(() {
                                                checkboxvalue = newValue;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Remember me',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(context, PageTransition(
                                          child: ForgotPassword(),
                                          type: PageTransitionType.fade,
                                          duration: Duration(milliseconds: 1000)
                                      ));
                                    },
                                    child: Text(
                                      'forgot password?',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                  onPressed: () async{
                                    //TODO
                                    try {
                                      UserCredential newUser = await FirebaseAuth
                                          .instance.signInWithEmailAndPassword(
                                          email: Email, password: Password);
                                      userRefrence.doc(Email.substring(0, Email.indexOf('@'))).get().then((DocumentSnapshot documentSnapshot) {
                                        if (documentSnapshot.exists) {
                                          var select1 = documentSnapshot
                                              .data()['select'];
                                          print(select1);
                                          //  CircleAvtarImage=link.toString();
                                          if (select1 == 'Mentor') {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeMentor()));
                                          } else if (select1 == 'Mentee') {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeMentee()));
                                          } else {
                                            print('Correct the credentials');
                                          }
                                        } else {
                                          print('unsucsessful');
                                        }
                                      }
                                      );
                                    }
                                    catch(e){

                                    }
                                  },
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account?",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Lato',
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        print('hello world!');
                                      },
                                      child: Text(
                                        ' Sign Up',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 1,
                                      width: 50,
                                      color: Colors.black54,
                                    ),
                                    Text(
                                      'Sign up with',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      width: 50,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage('images/facebook.png'),
                                  ),
                                  SizedBox(width: 10,),
                                  CircleAvatar(
                                    backgroundImage: AssetImage('images/google.png'),
                                  )
                                ],
                              )
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

// import 'package:animator/animator.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:flutter_login/flutter_login.dart';
// import 'package:flare_flutter/flare_actor.dart';
// import 'package:mentor_match_app/Mentee%20Package/formMentee.dart';
// import 'package:mentor_match_app/Mentor%20Package/formMentor.dart';
// import 'Mentee Package/HomeMentee.dart';
// import 'Mentor Package/HomeMentor.dart';
// import 'advertisement.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// String select = "Mentee";
// final googleSignIn = GoogleSignIn();
// String email = '';
// String formFilled = 'No';
//
// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   CollectionReference userRefrence =
//       FirebaseFirestore.instance.collection('MentorMentee');
//   String password = '';
//   Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
//   Future<String> _loginUser(LoginData data) {
//     return Future.delayed(loginTime).then((_) {
//       return null;
//     });
//   }
//
//   Future<String> _recoverPassword(String name) {
//     return Future.delayed(loginTime).then((_) {
//       return null;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: select == "Mentee" ? Colors.yellow : Colors.blue,
//         accentColor: Colors.white,
//         cursorColor: Colors.white,
//       ),
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           children: [
//             Container(
//               height: h / 1.2,
//               width: w,
//               child: RotatedBox(
//                 quarterTurns: 0,
//                 child: FlareActor(
//                   select == "Mentee"
//                       ? 'images/auth yellow flare.flr'
//                       : 'images/auth blue flare.flr',
//                   animation: 'Flow',
//                   alignment: Alignment.bottomCenter,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: w / 4, left: w / 7),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Welcome ",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 36,
//                       fontFamily: 'Fredoka One',
//                     ),
//                   ),
//                   Text(
//                     "Back ",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 36,
//                       fontFamily: 'Fredoka One',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             FlutterLogin(
//               title: "",
//               emailValidator: (value) {
//                 if (!value.contains('@') || !value.endsWith('.com')) {
//                   return "Email must contain '@' and end with '.com'";
//                 }
//                 return null;
//               },
//               passwordValidator: (value) {
//                 if (value.isEmpty || value.length < 6) {
//                   return 'Password is empty';
//                 }
//                 return null;
//               },
//               onLogin: (loginData) async {
//                 email = loginData.name;
//                 password = loginData.password;
//                 try {
//                   UserCredential newUser = await FirebaseAuth.instance
//                       .signInWithEmailAndPassword(
//                           email: email, password: password);
//                   userRefrence
//                       .doc(email.substring(0, email.indexOf('@')))
//                       .get()
//                       .then((DocumentSnapshot documentSnapshot) {
//                     if (documentSnapshot.exists) {
//                       var select1 = documentSnapshot.data()['select'];
//                       print(select1);
//                       //  CircleAvtarImage=link.toString();
//                       if (select1 == select && select == 'Mentor') {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => HomeMentor()));
//                       } else if (select1 == select && select == 'Mentee') {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => HomeMentee()));
//                       } else {
//                         print('Correct the credentials');
//                       }
//                     } else {
//                       print('unsucsessful');
//                     }
//                   });
//                 } catch (e) {
//                   print(e);
//                 }
//                 //add firebase code here
//                 return _loginUser(loginData);
//               },
//               onSignup: (loginData) async {
//                 email = loginData.name;
//                 password = loginData.password;
//                 //add firebase code here
//                 try {
//                   final newUser = await FirebaseAuth.instance
//                       .createUserWithEmailAndPassword(
//                           email: email, password: password);
//                   userRefrence
//                       .doc(email.substring(0, email.indexOf('@')))
//                       .set({
//                         'Email': email,
//                         'select': select,
//                         'formFilled': formFilled,
//                       })
//                       .then((value) => print('user Added'))
//                       .catchError((error) => print('Failed to add'));
//                   if (select == 'Mentor') {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => formMentor()));
//                   } else if (select == 'Mentee') {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => formMentee()));
//                   } else {
//                     print('Correct the credentials');
//                   }
//                 } catch (e) {
//                   print(e);
//                 }
//                 return _loginUser(loginData);
//               },
//               onRecoverPassword: (email) {
//                 //reset pw of email
//                 return _recoverPassword(email);
//               },
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                   bottom: .005 * h,
//                   left: .30 * w,
//                   right: .30 * w,
//                   top: .93 * h),
//               child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: RaisedButton(
//                     color: Colors.white,
//                     elevation: 0,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(FlutterIcons.question_ant,
//                             color: Colors.black54, size: 20),
//                         Text(
//                           'Advertisement',
//                           style: TextStyle(color: Colors.black54),
//                         ),
//                       ],
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => advertisementPage()));
//                     },
//                   )),
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                   bottom: .07 * h,
//                   left: .24 * w,
//                   right: .24 * w,
//                   top: .865 * h),
//               child: Animator<double>(
//                 tween: Tween<double>(begin: 300, end: 0),
//                 cycles: 2,
//                 duration: Duration(seconds: 2),
//                 builder: (context, animatorState, child) => Center(
//                   child: Container(
//                       height: animatorState.value,
//                       width: animatorState.value,
//                       child: Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Padding(
//                           padding: EdgeInsets.only(),
//                           child: RaisedButton(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(18.0))),
//                             elevation: 5,
//                             color: Colors.white,
//                             child: Center(
//                                 child: ListView(
//                               scrollDirection: Axis.horizontal,
//                               children: [
//                                 Image(
//                                     image:
//                                         AssetImage('images/Google logo.webp'),
//                                     width: .06 * w,
//                                     height: .04 * h),
//                                 SizedBox(
//                                   width: .03 * w,
//                                 ),
//                                 Align(
//                                   alignment: Alignment.center,
//                                   child: Text('Sign in with Google',
//                                       style: TextStyle(
//                                           color: Colors.black54,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15)),
//                                 ),
//                               ],
//                             )),
//                             onPressed: () async {
//                               final user = await googleSignIn.signIn();
//                               if (user == null) {
//                                 return;
//                               } else {
//                                 final googleAuth = await user.authentication;
//                                 final credential =
//                                     GoogleAuthProvider.credential(
//                                   accessToken: googleAuth.accessToken,
//                                   idToken: googleAuth.idToken,
//                                 );
//                                 Fluttertoast.showToast(
//                                     msg: "Please Wait Signing In",
//                                     toastLength: Toast.LENGTH_SHORT,
//                                     gravity: ToastGravity.BOTTOM,
//                                     timeInSecForIosWeb: 1,
//                                     backgroundColor: Colors.black54,
//                                     textColor: Colors.white,
//                                     fontSize: 13.0);
//                                 await FirebaseAuth.instance
//                                     .signInWithCredential(credential);
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => LoggedInWidget()),
//                                 );
//                               }
//                             },
//                           ),
//                         ),
//                       )),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topRight,
//               child: Padding(
//                 padding: EdgeInsets.only(right: .1 * w, top: .10 * h),
//                 child: Column(
//                   children: [
//                     Text('Account',
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontFamily: 'Fredoka One')),
//                     Text('Type',
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontFamily: 'Fredoka One')),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     RaisedButton(
//                       shape: RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(12.0))),
//                       elevation: 0.5,
//                       color: Colors.transparent,
//                       child: Container(
//                         width: .225 * w,
//                         height: .075 * h,
//                         child: Align(
//                           alignment: select == "Mentee"
//                               ? Alignment.centerRight
//                               : Alignment.centerLeft,
//                           child: Container(
//                             width: .07 * h,
//                             height: .1 * w,
//                             child: Center(
//                               child: Text(
//                                 select,
//                                 style: TextStyle(
//                                   fontSize: 11,
//                                   color: Colors.black,
//                                   fontFamily: 'Fredoka One',
//                                 ),
//                               ),
//                             ),
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(12))),
//                           ),
//                         ),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           if (select == "Mentee")
//                             select = "Mentor";
//                           else
//                             select = "Mentee";
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Login()));
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LoggedInWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//
//     return Container(
//       alignment: Alignment.center,
//       color: Colors.blueGrey.shade900,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Logged In',
//             style: TextStyle(color: Colors.white),
//           ),
//           SizedBox(height: 8),
//           CircleAvatar(
//             maxRadius: 25,
//             //backgroundImage: NetworkImage(user.photoURL),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Name: ' + user.displayName,
//             style: TextStyle(color: Colors.white),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Email: ' + user.email,
//             style: TextStyle(color: Colors.white),
//           ),
//           SizedBox(height: 8),
//           ElevatedButton(
//             onPressed: () async {
//               await googleSignIn.disconnect();
//               FirebaseAuth.instance.signOut();
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => Login()));
//             },
//             child: Text('Logout'),
//           )
//         ],
//       ),
//     );
//   }
// }
