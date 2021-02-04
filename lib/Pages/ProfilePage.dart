import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.blue,
          child: Center(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                        height: 100,
                        width: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/Images/mentor.png'))),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ButtonTheme(
                            height: 20,
                            child: FlatButton(
                              onPressed: () {},
                              color: Colors.white,
                              child: Icon(Icons.add),
                              shape: CircleBorder(),
                            ),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 170),
                      child:
                      Text('Soham', style: TextStyle(color: Colors.white)),
                    )),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: MediaQuery.of(context).size.height - 250,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          FlatButton(
                              minWidth: MediaQuery.of(context).size.width - 200,
                              onPressed: () {},
                              child: customText('Help')),
                          FlatButton(
                              minWidth: MediaQuery.of(context).size.width - 200,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AccountPage()));
                              },
                              child: customText('Account')),
                          FlatButton(
                              minWidth: MediaQuery.of(context).size.width - 200,
                              onPressed: () {},
                              child: customText('Privacy')),
                          FlatButton(
                              minWidth: MediaQuery.of(context).size.width - 200,
                              onPressed: () {},
                              child: customText('Payment')),
                          FlatButton(
                              minWidth: MediaQuery.of(context).size.width - 200,
                              onPressed: () {},
                              child: customText('Terms and conditions')),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

CollectionReference user = FirebaseFirestore.instance.collection('MentorMentee');
String email;

Future<String> _getData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('mentormatch_email');
  await user.doc(email.substring(0, email.indexOf('@'))).get().then((DocumentSnapshot snapshot) {
    if (snapshot.exists) {
      select = snapshot.data()['select'];
      print(select);
      if(select == 'mentee'){
        birthday = snapshot.data()['Birthday'];
        name = snapshot.data()['Name'];
        contactNumber = snapshot.data()['Contact number'];
        gender = snapshot.data()['Gender'];
        tvShow = snapshot.data()['Favorite TvShow'];
        menteeClass = snapshot.data()['Class'];
        menteeBoard = snapshot.data()['Board'];
        menteeAspiredCollege = snapshot.data()['Aspired College'];
        menteeSchool = snapshot.data()['School'];
        menteeSessionLength = snapshot.data()['Session Length'];
        menteeSessions = snapshot.data()['Sessions'];
        menteeSessionTime = snapshot.data()['Session Time'];
      }
      if(select == 'mentor'){
        birthday = snapshot.data()['Birthday'];
        name = snapshot.data()['Name'];
        contactNumber = snapshot.data()['Contact number'];
        gender = snapshot.data()['Gender'];
        mentorCollege = snapshot.data()['College'];
        mentorDegree = snapshot.data()['Degree specialization'];
        mentorMeaning = snapshot.data()['What does being a mentor mean to you'];
        mentorSessionLength = snapshot.data()['Session length'];
        mentorOccupation = snapshot.data()['Occupation'];
      }
    }
  }).catchError((value) => print('Error Catched'));
  return select;
}

String select;

String mentorCollege;
String mentorDegree;
String mentorOccupation;
String mentorSessionLength;
String mentorMeaning;

String menteeClass;
String menteeBoard;
String menteeAspiredCollege;
String menteeSchool;
String menteeSessionLength;
String menteeSessionTime;
String menteeSessions;

String birthday;
String contactNumber;
String tvShow;
String gender;
String name;


class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: FutureBuilder<String>(
            future: _getData(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  child: Center(
                    child: (select=='mentee')?Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(select),
                        customText(name),
                        customText(birthday),
                        customText(contactNumber),
                        customText(gender),
                        customText(tvShow),
                        customText(menteeClass),
                        customText(menteeSessionTime),
                        customText(menteeBoard),
                        customText(menteeSchool),
                        customText(menteeAspiredCollege),
                        customText(menteeSessionLength),
                        customText(menteeSessions),
                      ],
                    ):
                    (select == 'mentor')?Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(select),
                        customText(name),
                        customText(birthday),
                        customText(contactNumber),
                        customText(gender),
                        customText(mentorOccupation),
                        customText(mentorSessionLength),
                        customText(mentorMeaning),
                        customText(mentorDegree),
                        customText(mentorCollege),
                      ],
                    ):Container(child: Text("Error Loading Details"))
                  ),
                );
              }
            },
          ),
        ));
  }
}

bool done = false;

// class EditAccountDetails extends StatefulWidget {
//   @override
//   _EditAccountDetailsState createState() => _EditAccountDetailsState();
// }
//
// class _EditAccountDetailsState extends State<EditAccountDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Center(
//             child: Container(
//               width: MediaQuery.of(context).size.width - 100,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text('Name'),
//                   TextFormField(
//                     initialValue: name,
//                     onChanged: ((value) {
//                       setState(() {
//                         name = value.toString();
//                       });
//                     }),
//                   ),
//                   Text('Birthdate'),
//                   TextFormField(
//                     initialValue: birthdate,
//                     onChanged: ((value) {
//                       setState(() {
//                         birthdate = value.toString();
//                       });
//                     }),
//                   ),
//                   Text('Contact Number'),
//                   TextFormField(
//                     initialValue: number,
//                     onChanged: ((value) {
//                       setState(() {
//                         number = value.toString();
//                       });
//                     }),
//                   ),
//                   Text('Gender'),
//                   TextFormField(
//                     initialValue: gender,
//                     onChanged: ((value) {
//                       setState(() {
//                         gender = value.toString();
//                       });
//                     }),
//                   ),
//                   Text('College'),
//                   TextFormField(
//                     initialValue: college,
//                     onChanged: ((value) {
//                       setState(() {
//                         college = value.toString();
//                       });
//                     }),
//                   ),
//                   Text('Degree'),
//                   TextFormField(
//                     initialValue: degree,
//                     onChanged: ((value) {
//                       setState(() {
//                         degree = value.toString();
//                       });
//                     }),
//                   ),
//                   Text('Occupation'),
//                   TextFormField(
//                     initialValue: occupation,
//                     onChanged: ((value) {
//                       setState(() {
//                         occupation = value.toString();
//                       });
//                     }),
//                   ),
//                   done == false
//                       ? RaisedButton(
//                       onPressed: () async {
//                         setState(() {
//                           done = true;
//                         });
//                         await updateValues(context);
//                         Navigator.pop(context);
//                       },
//                       child: Text('Done'))
//                       : CircularProgressIndicator(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// void updateValues(BuildContext context) async {
//   await user
//       .doc('details')
//       .update({
//     'Birthday': birthdate,
//     'Name': name,
//     'ContactNumber': number,
//     'Gender': gender,
//     'Occupation': occupation,
//     'Degree': degree,
//     'College': college,
//   })
//       .then((value) => Navigator.pop(context))
//       .catchError((value) => print(value));
// }

Widget customText(String message) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      message != null ? message : 'Null',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
