import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'advertisement.dart';
import 'authentication.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MentorMatch());
}

class MentorMatch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppIconSplash(),
    );
  }
}

class AppIconSplash extends StatefulWidget {
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
