import 'package:flutter/material.dart';
import 'package:mentor_match_app/Mentor%20Package/MentorRegistration/Details.dart';

class Subject {
  const Subject({this.title, this.image});
  final String title;
  final String image;
}

const List<Subject> subjectChoices = const <Subject>[
  const Subject(image: 'images/RegistrationFormPngs/maths.png', title: 'Maths'),
  const Subject(
      image: 'images/RegistrationFormPngs/physics.png', title: 'Physics'),
  const Subject(
      image: 'images/RegistrationFormPngs/chemistry.png', title: 'Chemistry'),
  const Subject(image: 'images/RegistrationFormPngs/physics.png', title: 'Csc'),
  const Subject(
      image: 'images/RegistrationFormPngs/biology.png', title: 'Biology'),
  const Subject(
      image: 'images/RegistrationFormPngs/money.png', title: 'Commerce'),
  const Subject(
      image: 'images/RegistrationFormPngs/economy.png', title: 'Economics'),
  const Subject(
      image: 'images/RegistrationFormPngs/accounts.png', title: 'Accounts'),
  const Subject(image: 'images/RegistrationFormPngs/business.png', title: 'BM'),
  const Subject(image: 'images/RegistrationFormPngs/balance.png', title: 'Law'),
];

class StrongSubjects extends StatefulWidget {
  @override
  _StrongSubjectsState createState() => _StrongSubjectsState();
}

class _StrongSubjectsState extends State<StrongSubjects> {
  void initState() {
    super.initState();
  }

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
                "Subjects you are strong in \n",
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
              itemCount: subjectChoices.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return SubjectButtons(choice: subjectChoices[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectButtons extends StatefulWidget {
  final choice;

  const SubjectButtons({Key key, this.choice}) : super(key: key);
  @override
  _SubjectButtonsState createState() => _SubjectButtonsState();
}

class _SubjectButtonsState extends State<SubjectButtons> {
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
                      if (strongSubjects.contains(widget.choice.title)) {
                        strongSubjects.remove(widget.choice.title);
                      } else {
                        strongSubjects.add(widget.choice.title);
                      }
                    });
                    print(strongSubjects);
                  },
                  child: Stack(
                    children: [
                      Center(
                          child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image.asset(widget.choice.image.toString()),
                      )),
                      (strongSubjects.contains(widget.choice.title))
                          ? Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                border: Border.all(color: Colors.white),
                                color: Colors.white.withOpacity(0.5),
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
