import 'package:flutter/material.dart';
import 'package:mentor_match_app/Mentor%20Package/MentorRegistration/Details.dart';

class Hobby {
  const Hobby({this.title, this.image});
  final String title;
  final String image;
}

const List<Hobby> hobbyButtons = const <Hobby>[
  const Hobby(
      image: 'images/RegistrationFormPngs/Steering-wheel.png', title: 'Cars'),
  const Hobby(image: 'images/RegistrationFormPngs/cat.png', title: 'Pets'),
  const Hobby(image: 'images/RegistrationFormPngs/brain.png', title: 'Trivia'),
  const Hobby(
      image: 'images/RegistrationFormPngs/wrench.png', title: 'Building'),
  const Hobby(image: 'images/RegistrationFormPngs/canvas.png', title: 'Art'),
  const Hobby(image: 'images/RegistrationFormPngs/food.png', title: 'Cooking'),
  const Hobby(
      image: 'images/RegistrationFormPngs/tent.png', title: 'Travelling'),
  const Hobby(
      image: 'images/RegistrationFormPngs/party.png', title: 'Socializing'),
  const Hobby(
      image: 'images/RegistrationFormPngs/circuit.png', title: 'Technology'),
  const Hobby(
      image: 'images/RegistrationFormPngs/lovesong.png', title: 'Music'),
  const Hobby(
      image: 'images/RegistrationFormPngs/gym-dumbel.png', title: 'Fitness'),
  const Hobby(image: 'images/RegistrationFormPngs/movie.png', title: 'Movies'),
  const Hobby(
      image: 'images/RegistrationFormPngs/video-game.png', title: 'Games'),
  const Hobby(image: 'images/RegistrationFormPngs/soccer.png', title: 'Sports'),
  const Hobby(
      image: 'images/RegistrationFormPngs/man.png', title: 'Reading/Writing'),
];

class MentorHobbies extends StatefulWidget {
  @override
  _MentorHobbiesState createState() => _MentorHobbiesState();
}

class _MentorHobbiesState extends State<MentorHobbies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Your hobbies and interests \n",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                    fontSize: 25),
              ),
            ),
            GridView.builder(
              primary: false,
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              itemCount: hobbyButtons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return HobbyButtons(choice: hobbyButtons[index]);
              },
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Did we miss a few? \n",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                    fontSize: 20),
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      hobbyChoices.remove(extraHobbies);
                      extraHobbies = value;
                      hobbyChoices.add(extraHobbies);
                      print(hobbyChoices);
                    });
                  },
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.blue[900],
                      ),
                      border: InputBorder.none,
                      hintText: "Enter your hobbies here..."),
                ))
          ],
        ),
      ),
    );
  }
}

class HobbyButtons extends StatefulWidget {
  final choice;

  const HobbyButtons({Key key, this.choice}) : super(key: key);
  @override
  _HobbyButtonsState createState() => _HobbyButtonsState();
}

class _HobbyButtonsState extends State<HobbyButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 80,
            height: 80,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: Colors.white)),
            child: Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  )),
                  onPressed: () {
                    setState(() {
                      if (hobbyChoices.contains(widget.choice.title)) {
                        hobbyChoices.remove(widget.choice.title);
                      } else {
                        hobbyChoices.add(widget.choice.title);
                      }
                    });
                    print(hobbyChoices);
                  },
                  child: Stack(
                    children: [
                      Center(
                          child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image.asset(widget.choice.image.toString()),
                      )),
                      (hobbyChoices.contains(widget.choice.title))
                          ? Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                border: Border.all(color: Colors.white),
                                color: Colors.white.withOpacity(0.7),
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
        Text(
          '\n' + widget.choice.title,
          style: TextStyle(color: Colors.blue[900]),
        )
      ],
    );
  }
}
