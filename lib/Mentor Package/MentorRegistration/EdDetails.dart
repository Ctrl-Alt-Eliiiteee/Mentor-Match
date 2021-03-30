import 'package:flutter/material.dart';
import 'package:mentor_match_app/Mentor%20Package/MentorRegistration/Details.dart';

class EdDetails extends StatefulWidget {
  @override
  _EdDetailsState createState() => _EdDetailsState();
}

DateTime _dateTime = DateTime.now();

class _EdDetailsState extends State<EdDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Education Details\n",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blue[900],
                        fontSize: 25),
                  ),
                ),
                Container(
                    //height: height / 2 + 100,
                    padding: EdgeInsets.only(top: 0, bottom: 40),
                    width: width - 50,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all()),
                    child: Center(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _customTextField(
                              width: width - 80,
                              variable: 0,
                              hint: "College name"),
                          //SizedBox(height: 15),
                          _customTextField(
                              width: width - 80, variable: 1, hint: "Year"),
                          //SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Container(
                                    width: 200,
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(degree,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ))),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20.0),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.calendar_today_outlined,
                                    color: Colors.blue[900],
                                  ),
                                  onPressed: () async {
                                    DateTime picker = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100));
                                    if (picker != null && picker != _dateTime) {
                                      setState(() {
                                        _dateTime = picker;
                                        degree = _dateTime.day.toString() +
                                            '/' +
                                            _dateTime.month.toString() +
                                            '/' +
                                            _dateTime.year.toString();
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Divider(
                              thickness: 1,
                              color: Colors.black45,
                            ),
                          ),
                          //SizedBox(height: 15),
                          _customTextField(
                              width: width - 80,
                              variable: 2,
                              hint: "12th Marks"),
                        ],
                      ),
                    ))),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "How do you prefer to teach\n",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blue[900],
                        fontSize: 25),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "In-person\n",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.blue[900],
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          width: width / 2 - 50,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: Colors.white)),
                          child: Stack(
                            children: [
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      preferredSession = 'In-Person';
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Image.asset(
                                        'images/RegistrationFormPngs/Study.png'),
                                  ),
                                ),
                              ),
                              (preferredSession == 'In-Person')
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Online\n",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.blue[900],
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          width: width / 2 - 50,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: Colors.white)),
                          child: Stack(
                            children: [
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      preferredSession = 'Online';
                                    });
                                  },
                                  child: Image.asset(
                                      'images/RegistrationFormPngs/Laptop.png'),
                                ),
                              ),
                              (preferredSession == 'Online')
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _customTextField(
    {double width = 100,
    int variable = 0,
    TextInputType type = TextInputType.text,
    String hint = 'Provide Hint',
    bool obscureText = false}) {
  return Container(
    width: width,
    child: TextFormField(
      onChanged: (value) {
        if (variable == 0) {
          collegeName = value;
        } else if (variable == 1) {
          collegeYear = value;
        } else if (variable == 2) {
          twelfthMarks = value;
        }
      },
      keyboardType: type,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: hint, labelStyle: TextStyle(color: Colors.blue[900])),
    ),
  );
}
