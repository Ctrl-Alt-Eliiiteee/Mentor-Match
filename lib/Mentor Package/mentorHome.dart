import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

String name = 'Soham Sakaria';
// Refer this
// NAME, Subject, Time, Date
List<List<String>> upcomingStudents = [
  ['Eeshan Dutta', 'Trigonometry', '2 Hours', '10th Feb'],
  ['Parth Pandey', 'Trigonometry', '2 Hours', '10th Feb'],
  ['Parth Srivastava', 'Trigonometry', '2 Hours', '10th Feb'],
];

List<List<String>> doneStudents = [
  ['Soham Sakaria', 'Trigonometry', '2 Hours', '10th Feb'],
  ['Parth Srivastava', 'Trigonometry', '2 Hours', '10th Feb']
];

class MentorHome extends StatefulWidget {
  @override
  _MentorHomeState createState() => _MentorHomeState();
}

class _MentorHomeState extends State<MentorHome> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Welcome,\n",
                    style: TextStyle(color: Colors.blue[900])),
                TextSpan(
                    text: "$name\n",
                    style: TextStyle(
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900])),
              ])),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: IconButton(
                icon: Icon(
                  Icons.message,
                  size: width * 0.08,
                  color: Colors.blue[900],
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text("Current Session",
              style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900])),
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                width: width - 40,
                height: height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.blue[800]],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "You need to help\n", style: TextStyle()),
                            TextSpan(
                                text: upcomingStudents[0][0],
                                style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold,
                                )),
                          ])),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(text: "With\n", style: TextStyle()),
                            TextSpan(
                                text: upcomingStudents[0][1],
                                style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold,
                                )),
                          ])),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(text: "for\n", style: TextStyle()),
                            TextSpan(
                                text: upcomingStudents[0][2],
                                style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold,
                                )),
                          ])),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () {
                              print(width.toString() + ' ' + height.toString());
                            },
                            child: Container(
                              height: 55,
                              width: width / 2 - 80,
                              child: Center(
                                child: Text("START SESSION",
                                    style: TextStyle(
                                        fontSize: width * 0.05,
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)))),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0, top: 20),
          child: Text("Upcoming Sessions",
              style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900])),
        ),
        SizedBox(
          height: width * 0.02,
        ),
        Expanded(
          child: CarouselSlider(
            options: CarouselOptions(
              height: height * 0.17,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
            ),
            items: upcomingStudents.map((index) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Container(
                        width: width - 40,
                        //height: height / 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                              colors: [Colors.blue[300], Colors.blue[600]],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 5, right: 20),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "You need to help\n",
                                        style: TextStyle()),
                                    TextSpan(
                                        text: index[0],
                                        style: TextStyle(
                                          fontSize: width * 0.05,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ])),
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(text: "With\n", style: TextStyle()),
                                  TextSpan(
                                      text: index[1],
                                      style: TextStyle(
                                        fontSize: width * 0.05,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 5, right: 20),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "for \n", style: TextStyle()),
                                    TextSpan(
                                        text: index[2],
                                        style: TextStyle(
                                          fontSize: width * 0.05,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ])),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 5, right: 20),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(text: "for\n", style: TextStyle()),
                                    TextSpan(
                                        text: index[3],
                                        style: TextStyle(
                                          fontSize: width * 0.05,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ])),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                },
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0, top: 20),
          child: Text("Session History",
              style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900])),
        ),
        SizedBox(
          height: width * 0.02,
        ),
        Expanded(
          child: CarouselSlider(
            options: CarouselOptions(
              height: height * 0.17,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
            ),
            items: doneStudents.map((index) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Container(
                        width: width - 40,
                        //height: height / 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                              colors: [Colors.blue[300], Colors.blue[600]],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 5, right: 20),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "You need to help\n",
                                        style: TextStyle()),
                                    TextSpan(
                                        text: index[0],
                                        style: TextStyle(
                                          fontSize: width * 0.05,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ])),
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(text: "With\n", style: TextStyle()),
                                  TextSpan(
                                      text: index[1],
                                      style: TextStyle(
                                        fontSize: width * 0.05,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ])),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 5, right: 20),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "for \n", style: TextStyle()),
                                    TextSpan(
                                        text: index[2],
                                        style: TextStyle(
                                          fontSize: width * 0.05,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ])),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 5, right: 20),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(text: "for\n", style: TextStyle()),
                                    TextSpan(
                                        text: index[3],
                                        style: TextStyle(
                                          fontSize: width * 0.05,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ])),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                },
              );
            }).toList(),
          ),
        )
      ],
    ));
  }
}
