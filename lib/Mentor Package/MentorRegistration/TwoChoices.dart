import 'package:flutter/material.dart';
import 'package:mentor_match_app/Mentor%20Package/MentorRegistration/Details.dart';

class Choice {
  const Choice(this.image1, this.image2, this.title1, this.title2);
  final String image1;
  final String image2;
  final String title1;
  final String title2;
}

const List<Choice> choices = const <Choice>[
  const Choice('images/RegistrationFormPngs/dog.png',
      'images/RegistrationFormPngs/cat1.png', 'Dog', 'Cat'),
  //
  const Choice('images/RegistrationFormPngs/netflix.png',
      'images/RegistrationFormPngs/youtube.png', 'Netflix', 'YouTube'),
  //
  const Choice('images/RegistrationFormPngs/beach.png',
      'images/RegistrationFormPngs/mountain.png', 'Beach', 'Mountains'),
  //
  const Choice('images/RegistrationFormPngs/books.png',
      'images/RegistrationFormPngs/old.png', 'Books', 'Camera'),
  //
  const Choice('images/RegistrationFormPngs/sun.png',
      'images/RegistrationFormPngs/rain.png', 'Sun', 'Rain'),
];

class TwoChoice extends StatefulWidget {
  @override
  _TwoChoiceState createState() => _TwoChoiceState();
}

bool isDone = false;

class _TwoChoiceState extends State<TwoChoice> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20),
      child: Stack(
        children: [
          (isDone)
              ? Container(
                  width: width - 10,
                  height: height - 10,
                  //padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Colors.white)),
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue[900],
                  ),
                )
              : Container(
                  width: 0,
                  height: 0,
                ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Just don't ask why...\n",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blue[900],
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: choices.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 80,
                                height: 80,
                                //padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    border: Border.all(color: Colors.white)),
                                child: Center(
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      )),
                                      onPressed: () {
                                        setState(() {
                                          if (choicesSeleted.contains(
                                              choices[index].title1)) {
                                            choicesSeleted
                                                .remove(choices[index].title1);
                                          } else if (choicesSeleted.contains(
                                              choices[index].title2)) {
                                            choicesSeleted
                                                .remove(choices[index].title2);
                                            choicesSeleted
                                                .add(choices[index].title1);
                                          } else {
                                            choicesSeleted
                                                .add(choices[index].title1);
                                          }
                                        });
                                        print(choicesSeleted);
                                      },
                                      child: Stack(
                                        children: [
                                          Center(
                                              child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Image.asset(
                                                choices[index].image1),
                                          )),
                                          (choicesSeleted.contains(
                                                  choices[index].title1))
                                              ? Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                  ),
                                                  child: Icon(
                                                    Icons.check,
                                                    size: 30,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              : Container()
                                        ],
                                      )),
                                )),
                            Text('or'),
                            Container(
                                width: 80,
                                height: 80,
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    border: Border.all(color: Colors.white)),
                                child: Center(
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      )),
                                      onPressed: () {
                                        setState(() {
                                          if (choicesSeleted.contains(
                                              choices[index].title2)) {
                                            choicesSeleted
                                                .remove(choices[index].title2);
                                          } else if (choicesSeleted.contains(
                                              choices[index].title1)) {
                                            choicesSeleted
                                                .remove(choices[index].title1);
                                            choicesSeleted
                                                .add(choices[index].title2);
                                          } else {
                                            choicesSeleted
                                                .add(choices[index].title2);
                                          }
                                        });
                                        print(choicesSeleted);
                                      },
                                      child: Stack(
                                        children: [
                                          Center(
                                              child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Image.asset(
                                                choices[index].image2),
                                          )),
                                          (choicesSeleted.contains(
                                                  choices[index].title2))
                                              ? Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                  ),
                                                  child: Icon(
                                                    Icons.check,
                                                    size: 30,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      )),
                                )),
                          ],
                        ),
                        SizedBox(height: 20)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
