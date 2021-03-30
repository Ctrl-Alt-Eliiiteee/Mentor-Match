import 'package:flutter/material.dart';
import 'package:mentor_match_app/Mentee%20Package/menteeForm.dart';
import 'package:mentor_match_app/Mentee%20Package/menteeHome.dart';
import 'package:mentor_match_app/Mentee%20Package/menteeProfile.dart';
import 'package:mentor_match_app/Mentor%20Package/MonthlyPlanner.dart';
import 'package:mentor_match_app/Mentor%20Package/mentorHome.dart';
import 'package:mentor_match_app/Mentor%20Package/mentorProfile.dart';
import 'package:mentor_match_app/Pages/HomePage.dart';
import 'package:mentor_match_app/Pages/ProfilePage.dart';

class NavBar extends StatefulWidget {
  final String select;

  const NavBar({Key key, this.select}) : super(key: key);
  @override
  _NavBarState createState() => _NavBarState();
}

int _index = 0;
bool _floatingButtonClicked = false;
Color _floatingColor = Colors.blue[100];

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/Background.png',
              ),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
          body: (_floatingButtonClicked)
              ? Homepage()
              : (widget.select == 'Mentor')
                  ? (_index == 0)
                      ? MentorHome()
                      : (_index == 1)
                          ? Planner()
                          : (_index == 3)
                              ? MentorProfile()
                              : Center(
                                  child: Text("Page no: $_index"),
                                )
                  : (_index == 0)
                      ? MenteeHome()
                      : (_index == 1)
                          ? Planner()
                          : (_index == 3)
                              ? MenteeProfile()
                              : Center(child: Text("Page no: $_index")),
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton(
            backgroundColor: _floatingColor,
            onPressed: () {
              setState(() {
                _floatingColor = Colors.blue[900];
                _floatingButtonClicked = true;
              });
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: (_floatingColor == Colors.blue[100])
                          ? Colors.blue[900]
                          : Colors.white,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Center(
                    child: Icon(
                  Icons.more_horiz,
                  size: 40,
                  color: (_floatingColor == Colors.blue[100])
                      ? Colors.blue[900]
                      : Colors.white,
                ))
              ],
            ),
            elevation: 0,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white, Colors.blue[200]
                        //HexColor('#59cdff')
                      ],
                      //stops: [0, 0.8],
                      tileMode: TileMode.clamp)),
              child: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _index,
                  unselectedItemColor: Colors.blue[900],
                  selectedItemColor: Colors.blue[900],
                  elevation: 0,
                  items: [
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        icon: Container(
                          height: 45,
                          width: 45,
                          child: (_index == 0)
                              ? Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  color: Colors.white.withOpacity(0.9),
                                  elevation: (_index == 0) ? 3 : 0,
                                  child: Icon(
                                    Icons.home,
                                  ),
                                )
                              : Icon(
                                  Icons.home,
                                ),
                        ),
                        label: ''),
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        icon: Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Container(
                            height: 45,
                            width: 45,
                            child: (_index == 1)
                                ? Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    color: Colors.white.withOpacity(0.9),
                                    elevation: 3,
                                    child: Icon(
                                      Icons.calendar_today,
                                    ),
                                  )
                                : Icon(Icons.calendar_today),
                          ),
                        ),
                        label: ''),
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        icon: Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Container(
                            height: 45,
                            width: 45,
                            child: (_index == 2)
                                ? Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    color: Colors.white.withOpacity(0.9),
                                    elevation: 3,
                                    child: Icon(
                                      Icons.phone_android,
                                    ),
                                  )
                                : Icon(
                                    Icons.phone_android,
                                  ),
                          ),
                        ),
                        label: ''),
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        icon: Container(
                          height: 45,
                          width: 45,
                          child: (_index == 3)
                              ? Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  color: Colors.white.withOpacity(0.9),
                                  elevation: 3,
                                  child: Icon(
                                    Icons.person,
                                  ),
                                )
                              : Icon(Icons.person),
                        ),
                        label: ''),
                  ],
                  onTap: (value) {
                    setState(() {
                      _floatingButtonClicked = false;
                      _floatingColor = Colors.blue[100];
                      _index = value;
                    });
                  },
                ),
              )),
        ),
      ),
    );
  }
}
