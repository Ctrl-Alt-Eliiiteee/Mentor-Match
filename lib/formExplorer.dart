import 'package:flutter/material.dart';

class ExplorerForm extends StatefulWidget {
  @override
  _ExplorerFormState createState() => _ExplorerFormState();
}

class _ExplorerFormState extends State<ExplorerForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Images/Jungle_BG.jpg'),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height - 250,
                ),
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(2.0, 5.0),
                          blurRadius: 5.0,
                          spreadRadius: 1,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50),
                          Text(
                            'Get the most of mentor match by joining as a Mentor or a Mentee!',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.1),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Card(
                              elevation: 8,
                              child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.yellow,
                                          Colors.orange,
                                        ],
                                      )),
                                  child: Center(
                                      child: Text('Join Now',
                                          style: TextStyle(
                                            fontSize: 18,
                                          )))),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  FlatButton(
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage(
                                            'assets/Images/mentor.png'),
                                        radius: 50,
                                      ),
                                      onPressed: () {},
                                      shape: CircleBorder()),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/Images/mentor_word.png'))),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  FlatButton(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                          'assets/Images/Mentee.png'),
                                      radius: 50,
                                    ),
                                    onPressed: () {},
                                    shape: CircleBorder(),
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/Images/mentee_word.png'))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height - 150),
              child: Center(
                child: RaisedButton(
                  elevation: 8,
                  textColor: Colors.black,
                  padding: EdgeInsets.all(0.0),
                  shape: StadiumBorder(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.yellow,
                          Colors.orange,
                        ],
                      ),
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(fontSize: 20.0, letterSpacing: 1.5),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
