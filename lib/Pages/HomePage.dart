import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                height: h,
                width: w,
                child: Image.asset('images/Background.png', fit: BoxFit.cover)),
            Padding(
              padding: EdgeInsets.only(
                  left: 0.04 * w, top: 0.03 * h, right: 0.04 * w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(0.02 * w),
                    child: Text(
                      '@MentorMatch',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 0.044 * w),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 10; i++)
                          Padding(
                            padding: EdgeInsets.all(0.02 * w),
                            child: Container(
                              width: 0.18 * w,
                              height: 0.18 * w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.orange),
                            ),
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.04 * w,
                  ),
                  Padding(
                    padding: EdgeInsets.all(0.02 * w),
                    child: Text(
                      'Videos',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 0.044 * w),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 10; i++)
                          Padding(
                              padding: EdgeInsets.all(0.02 * w),
                              child: Container(
                                height: 2 / 3 * w,
                                width: 2 / 3 * w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(0.041 * w),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                    )),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(0.041 * w),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaY: 1, sigmaX: 1),
                                        child: Container(
                                          color: Colors.blue.shade200
                                              .withOpacity(0.2),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 0.29 * w,
                                                  width: 0.569 * w,
                                                  decoration: BoxDecoration(
                                                      color: Colors.orange,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.041 * w),
                                                      border: Border.all(
                                                        width: 2,
                                                        color: Colors.white,
                                                        style:
                                                            BorderStyle.solid,
                                                      )),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      0.0333 * w),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 0.416 * w,
                                                        child: Text(
                                                          'Mistakes - Science vs Commerce',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .blue[900],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  0.05 * w),
                                                        ),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                            Icons
                                                                .favorite_outline,
                                                            color: Colors
                                                                .blue[900],
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 0.0166 * w,
                                                        left: w / 30,
                                                        right: w / 30,
                                                        bottom: 0.0166 * w),
                                                    child: Text(
                                                      '20 Lakh views   10hr ago',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blue[900],
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 0.0388 * w),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.04 * w,
                  ),
                  Padding(
                    padding: EdgeInsets.all(0.02 * w),
                    child: Text(
                      'Blogs',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 0.044 * w),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 10; i++)
                          Padding(
                              padding: EdgeInsets.all(0.02 * w),
                              child: Container(
                                height: 0.5138 * w,
                                width: 0.444 * w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(0.0416 * w),
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                    )),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(0.0416 * w),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaY: 1, sigmaX: 1),
                                        child: Container(
                                          color: Colors.blue.shade200
                                              .withOpacity(0.2),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 0.236 * w,
                                                  width: 0.361 * w,
                                                  decoration: BoxDecoration(
                                                      color: Colors.orange,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0416 * w),
                                                      border: Border.all(
                                                        width: 2,
                                                        color: Colors.white,
                                                        style:
                                                            BorderStyle.solid,
                                                      )),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 0.04 * w,
                                                      right: 0.04 * w,
                                                      top: 0.01 * w),
                                                  child: Container(
                                                    child: Text(
                                                      'Fun facts about school',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blue[900],
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 0.04 * w),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 0.0166 * w,
                                                        left: 0.0333 * w,
                                                        right: 0.0333 * w,
                                                        bottom: 0.0166 * w),
                                                    child: Text(
                                                      '20 Lakh views   10hr ago',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blue[900],
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
