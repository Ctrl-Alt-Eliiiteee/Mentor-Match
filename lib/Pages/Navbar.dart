import 'package:flutter/material.dart';
import 'package:mentor_match_app/Mentee%20Package/menteeForm.dart';
import 'package:mentor_match_app/Mentor%20Package/mentorHome.dart';
import 'package:mentor_match_app/Mentor%20Package/mentorProfile.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

int _index = 0;

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
          body: (_index == 0)
              ? MentorHome()
              : (_index == 3)
                  ? MentorProfile()
                  : Center(
                      child: Text("Page no: $_index"),
                    ),
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue[100],
            onPressed: () {
              setState(() {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => HomePage()));
              });
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.blue[900]),
                    shape: BoxShape.circle,
                  ),
                ),
                Center(
                    child: Icon(
                  Icons.more_horiz,
                  size: 40,
                  color: Colors.blue[900],
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
                  borderRadius: BorderRadius.all(Radius.circular(25)),
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
                  items: [
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        icon: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          color: (_index == 0)
                              ? Colors.blue[50].withOpacity(0.7)
                              : Colors.transparent,
                          elevation: (_index == 0) ? 3 : 0,
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.home,
                            ),
                          ),
                        ),
                        label: ''),
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        icon: Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            color: (_index == 1)
                                ? Colors.blue[50].withOpacity(0.7)
                                : Colors.blue[300].withOpacity(0),
                            elevation: (_index == 1) ? 3 : 0,
                            child: Container(
                              width: 40,
                              height: 40,
                              child: Icon(
                                Icons.calendar_today,
                              ),
                            ),
                          ),
                        ),
                        label: ''),
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        icon: Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            color: (_index == 2)
                                ? Colors.blue[50].withOpacity(0.7)
                                : Colors.blue[300].withOpacity(0),
                            elevation: (_index == 2) ? 3 : 0,
                            child: Container(
                              width: 40,
                              height: 40,
                              child: Icon(Icons.phone_android),
                            ),
                          ),
                        ),
                        label: ''),
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        icon: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          color: (_index == 3)
                              ? Colors.blue[50].withOpacity(0.7)
                              : Colors.blue[300].withOpacity(0),
                          elevation: (_index == 3) ? 3 : 0,
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                        ),
                        label: ''),
                  ],
                  onTap: (value) {
                    setState(() {
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
