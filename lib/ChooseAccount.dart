import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mentor_match_app/formExplorer.dart';

import 'Mentee Package/formMentee.dart';
import 'Mentor Package/formMentor.dart';

class ChooseAccount extends StatefulWidget {
  @override
  _ChooseAccountState createState() => _ChooseAccountState();
}

List<String> images = [
  'assets/Images/mentor.png',
  'assets/Images/Mentee.png',
  'assets/Images/explorer.png'
];

List<String> bottomName = [
  'assets/Images/mentor_word.png',
  'assets/Images/mentee_word.png',
  'assets/Images/Exp_name.png'
];
int _currentpage = 0;
List<int> pageNo = [0, 1, 2];

class _ChooseAccountState extends State<ChooseAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Images/Doodle_black.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2 + 100,
                child: CarouselSlider(
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentpage = index;
                      });
                    },
                    height: MediaQuery.of(context).size.height / 2,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage: true,
                  ),
                  items: pageNo.map((i) {
                    return Builder(builder: (BuildContext context) {
                      return RaisedButton(
                        color: Colors.white,
                        padding: EdgeInsets.all(0),
                        elevation: 10,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => _currentpage == 0
                                      ? MentorForm()
                                      : _currentpage == 1
                                          ? MenteeForm()
                                          : ExplorerForm()));
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage(images[i].toString()),
                          radius: MediaQuery.of(context).size.width / 2,
                        ),
                        shape: CircleBorder(),
                      );
                    });
                  }).toList(),
                ),
              ),
              Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(bottomName[_currentpage]))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
