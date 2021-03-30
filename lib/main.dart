import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mentor_match_app/Pages/Navbar.dart';
import 'Login.dart';
import 'advertisement.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_preview/device_preview.dart';

String acc = '';
bool seen;
String email;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  email = prefs.getString('mentormatch_email');
  //acc = prefs.getString('mentorormatch');
  seen = prefs.getBool('IntroSeen');
  seen == null
      ? print("Has not seen intropages")
      : print("Has seen intropages");
  print(email);
  runApp(
    MentorMatch(),
  );
}

class MentorMatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return //DevicePreview(
        // enabled: !kReleaseMode,
        // builder: (context) =>
        MaterialApp(
      //locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        textSelectionHandleColor: Colors.transparent,
      ),
      home: seen == null
          ? movingRocket()
          : (email != '')
              ? NavBar()
              : Login(),
      //)
    );
  }
}

// ignore: camel_case_types
class movingRocket extends StatefulWidget {
  @override
  _movingRocketState createState() => _movingRocketState();
}

// ignore: camel_case_types
class _movingRocketState extends State<movingRocket> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () => _controller.animateTo(_controller.position.maxScrollExtent,
          duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn),
    );
    Timer(
      Duration(milliseconds: 2250),
      () => Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: appSplash(),
              duration: Duration(milliseconds: 625))),
    );

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            controller: _controller,
            children: [
              Container(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height * .4876,
              ),
              Stack(
                children: [
                  Container(
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Image.asset(
                    'images/rocket.png',
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
              Center(
                child: Container(
                  color: Color(0xff0072bb),
                  height: MediaQuery.of(context).size.height * .4876,
                ),
              ),
            ],
          ),
          Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class appSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(milliseconds: 1500),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: Introduction(),
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 625))));

    return Image.asset(
      'images/mentor match splash screen.png',
      fit: BoxFit.cover,
    );
  }
}

/*class AppIconSplash extends StatefulWidget {
  @override
  _AppIconSplashState createState() => _AppIconSplashState();
}

class _AppIconSplashState extends State<AppIconSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          DelayedDisplay(
            delay: Duration(seconds: 1),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('images/Mentor Match Logo.jpeg'), width: 250, height: 250),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 250.0,
                    height: 50.0,
                    child: WavyAnimatedTextKit(
                      speed: Duration(milliseconds: 175),
                      textStyle: TextStyle(
                        color: Colors.yellow,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Fredoka One',
                      ),
                      text: ["Mentor Match"],
                      isRepeatingAnimation: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          DelayedDisplay(
            delay: Duration(seconds: 4),
            child: advertisementPage(),
          ),
        ],
      )
    );
  }
}
*/
