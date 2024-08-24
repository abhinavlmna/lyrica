import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lyrica/Colors/colors.dart';
import 'package:lyrica/Screens/home.dart';

const colorizeColors = [
  Colors.grey,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];
const colorizeTextStyle = TextStyle(
  fontSize: 80.0,
  fontFamily: 'Horizon',
);

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Splashscreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Homepage(
                  controller: null,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
          height: mediaQuery.size.height * 1,
          width: mediaQuery.size.width * 2,
          child: Stack(
            children: [
              Positioned(
                  child: Image.asset(
                'assets/images/splashbackground.jpg',
                height: mediaQuery.size.height * 0.8,
                width: mediaQuery.size.width * 2,
                fit: BoxFit.fill,
              )),
              Positioned(
                top: 360,
                left: 80,
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'LIVE IN',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                    ColorizeAnimatedText(
                      'LYRICA',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                  ],
                  isRepeatingAnimation: false,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              )
            ],
          )),
    );
  }
}
