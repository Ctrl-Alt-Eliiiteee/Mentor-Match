import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match_app/Pages/Navbar.dart';
import 'package:mentor_match_app/Pages/ProfilePage.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Login.dart';

String NameofMentee = "", Description = "";

class Planner extends StatefulWidget {
  @override
  _PlannerState createState() => _PlannerState();
}

String duration = "";
List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];
DateTime _dateTime = DateTime.now();
TimeOfDay _timeOfDay = TimeOfDay.now(); //start time
TimeOfDay _timeOfDay1 = TimeOfDay.now(); //endtime

String _startTime = TimeOfDay.now().toString();
String _endTime = TimeOfDay.now().toString();

String _sessionDate = _dateTime.day.toString() +
    ' ' +
    months[_dateTime.month - 1] +
    ' ' +
    _dateTime.year.toString();

String _date = months[DateTime.now().month - 1] +
    ' ' +
    DateTime.now().day.toString() +
    ', ' +
    DateTime.now().year.toString();

Map<DateTime, List> _events;
List _selectedEvents;
AnimationController _animationController;
CalendarController _calendarController;

class _PlannerState extends State<Planner> {
  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    _events = {
      _dateTime: ['Event A'],
    };
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Today \n",
                      style: TextStyle(color: Colors.blue[900], fontSize: 20)),
                  TextSpan(
                      text: '\n$_date',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900])),
                ])),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateNewSession()));
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      child: Center(
                        child: Text("+ NEW SESSION"),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        primary: Colors.blue[600])),
              )
            ],
          ),
          TableCalendar(
            calendarController: _calendarController,
            events: _events,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              selectedColor: Colors.blue[400],
              todayColor: Colors.blue[200],
              markersColor: Colors.blue[700],
              outsideDaysVisible: false,
            ),
            headerStyle: HeaderStyle(
              formatButtonTextStyle:
                  TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            onDaySelected: _onDaySelected,
          ),
        ],
      ),
    );
  }
}

class SelectSubjects {
  final String name;
  final Color buttonColor;

  SelectSubjects(this.name, this.buttonColor);
}

List<SelectSubjects> _subjectSeletion = <SelectSubjects>[
  SelectSubjects('English', Colors.amber),
  SelectSubjects('Maths', Colors.green[200]),
  SelectSubjects('Chemistry', Colors.purple),
  SelectSubjects('Physics', Colors.pink),
  SelectSubjects('Biology', Colors.blue),
  SelectSubjects('BST', Colors.pink[200]),
];

String _subjectSeletecForSession; //TO DO

class CreateNewSession extends StatefulWidget {
  @override
  _CreateNewSessionState createState() => _CreateNewSessionState();
}

int _subjectSelected = -1;

class _CreateNewSessionState extends State<CreateNewSession> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Background.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue[900]),
          title: Text(
            "New Session",
            style: TextStyle(
                color: Colors.blue[900],
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: width - 30,
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name of the Mentee",
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                  TextFormField(
                    //TO DO name of mentee
                    onChanged: (text) {
                      NameofMentee = text;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.blue[900],
                      focusColor: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Subject",
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    itemCount: _subjectSeletion.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return SubjectButton(_subjectSeletion[index]);
                    },
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Date and Time',
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          _sessionDate,
                          style:
                              TextStyle(fontSize: 25, color: Colors.blue[900]),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          DateTime _date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100));
                          if (_date != null) {
                            setState(() {
                              _dateTime = _date;
                              _sessionDate = _dateTime.day.toString() +
                                  ' ' +
                                  months[_dateTime.month - 1] +
                                  ' ' +
                                  _dateTime.year.toString();
                            });
                          }
                        },
                        icon: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.blue[900],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.blue[900],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From\n',
                            style: TextStyle(color: Colors.blue[900]),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            onPressed: () async {
                              TimeOfDay _time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(hour: 12, minute: 12));
                              if (_time != null) {
                                setState(() {
                                  _timeOfDay = _time;
                                  _startTime = _timeOfDay.format(context);
                                });
                              }
                            },
                            child: Container(
                                width: width / 2 - 100,
                                height: 50,
                                child: Center(
                                    child: Text(_timeOfDay.format(context)))),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'to\n',
                            style: TextStyle(color: Colors.blue[900]),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            onPressed: () async {
                              TimeOfDay _time1 = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(hour: 12, minute: 12));
                              if (_time1 != null) {
                                setState(() {
                                  _timeOfDay1 = _time1;
                                  _endTime = _timeOfDay1.format(context);
                                });
                              }
                            },
                            child: Container(
                                width: width / 2 - 100,
                                height: 50,
                                child: Center(child: Text(_endTime))),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                  TextFormField(
                    // TO DO description
                    onChanged: (text) {
                      Description = text;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Colors.blue[900],
                      focusColor: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue[400],
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      onPressed: () {
                        int value = _dateTime.day.toInt() +
                            (_dateTime.month.toInt() - 1) * 30;
                        double initialtime = _timeOfDay.hour.toDouble() +
                            (_timeOfDay.minute.toDouble() / 60);
                        double finaltime = _timeOfDay1.hour.toDouble() +
                            (_timeOfDay1.minute.toDouble() / 60);
                        /////////////////////CREATE SESSION CODE////////////////////////////
                        FirebaseFirestore.instance
                            .collection("SessionDetails")
                            .doc(Email)
                            .collection("UniqueDetails")
                            .doc(NameofMentee)
                            .set({
                          'Name': NameofMentee,
                          'Description': Description,
                          'Subselected': _subjectSeletecForSession,
                          'Duration':
                              (finaltime - initialtime).toInt().toString(),
                          'CompValue': value,
                          'SessionDate': _sessionDate,
                        }).then((value) => {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NavBar(
                                                select: 'Mentor',
                                              )))
                                });
                      },
                      child: Container(
                        width: 140,
                        height: 60,
                        child: Center(child: Text("Create Session")),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget SubjectButton(final SelectSubjects choice) {
    return TextButton(
        onPressed: () {
          setState(() {
            _subjectSeletecForSession = choice.name;
            print(_subjectSeletecForSession);
          });
        },
        style: TextButton.styleFrom(
            backgroundColor: choice.buttonColor, primary: Colors.white),
        child: (choice.name == _subjectSeletecForSession)
            ? Stack(
                children: [
                  Center(
                    child: Icon(Icons.check),
                  ),
                  Center(
                    child: Text(
                      choice.name,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.3),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            : Text(
                choice.name,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ));
  }
}
