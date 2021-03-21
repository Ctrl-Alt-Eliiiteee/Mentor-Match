import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Planner extends StatefulWidget {
  @override
  _PlannerState createState() => _PlannerState();
}

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
TimeOfDay _timeOfDay = TimeOfDay.now();
TimeOfDay _timeOfDay1 = TimeOfDay.now();

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.amber,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_subjectSelected != 0)
                              _subjectSelected = 0;
                            else
                              _subjectSelected = -1;
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 60,
                          child: Center(
                              child: (_subjectSelected == 0)
                                  ? Stack(
                                      children: [
                                        Center(child: Icon(Icons.check)),
                                        Center(
                                          child: Text('English',
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.3))),
                                        )
                                      ],
                                    )
                                  : Text('English')),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.green[200],
                        ),
                        onPressed: () {
                          setState(() {
                            if (_subjectSelected != 1)
                              _subjectSelected = 1;
                            else
                              _subjectSelected = -1;
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 60,
                          child: Center(
                              child: (_subjectSelected == 1)
                                  ? Stack(
                                      children: [
                                        Center(child: Icon(Icons.check)),
                                        Center(
                                          child: Text('Maths',
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.3))),
                                        )
                                      ],
                                    )
                                  : Text('Maths')),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.purple[200],
                        ),
                        onPressed: () {
                          setState(() {
                            if (_subjectSelected != 2)
                              _subjectSelected = 2;
                            else
                              _subjectSelected = -1;
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 60,
                          child: Center(
                              child: (_subjectSelected == 2)
                                  ? Stack(
                                      children: [
                                        Center(child: Icon(Icons.check)),
                                        Center(
                                          child: Text('Chemistry',
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.3))),
                                        )
                                      ],
                                    )
                                  : Text('Chemistry')),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.pink[200],
                        ),
                        onPressed: () {
                          setState(() {
                            if (_subjectSelected != 3)
                              _subjectSelected = 3;
                            else
                              _subjectSelected = -1;
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 60,
                          child: Center(
                              child: (_subjectSelected == 3)
                                  ? Stack(
                                      children: [
                                        Center(child: Icon(Icons.check)),
                                        Center(
                                          child: Text('Physics',
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.3))),
                                        )
                                      ],
                                    )
                                  : Text('Physics')),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.blue[200],
                        ),
                        onPressed: () {
                          setState(() {
                            if (_subjectSelected != 4)
                              _subjectSelected = 4;
                            else
                              _subjectSelected = -1;
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 60,
                          child: Center(
                              child: (_subjectSelected == 4)
                                  ? Stack(
                                      children: [
                                        Center(child: Icon(Icons.check)),
                                        Center(
                                          child: Text('Biology',
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.3))),
                                        )
                                      ],
                                    )
                                  : Text('Biology')),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.red[200],
                        ),
                        onPressed: () {
                          setState(() {
                            if (_subjectSelected != 5)
                              _subjectSelected = 5;
                            else
                              _subjectSelected = -1;
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 60,
                          child: Center(
                              child: (_subjectSelected == 5)
                                  ? Stack(
                                      children: [
                                        Center(child: Icon(Icons.check)),
                                        Center(
                                          child: Text('BST',
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.3))),
                                        )
                                      ],
                                    )
                                  : Text('BST')),
                        ),
                      ),
                    ],
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
                      onPressed: () {},
                      child: Container(
                        width: 140,
                        height: 60,
                        child: Center(child: Text("Create Session")),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
