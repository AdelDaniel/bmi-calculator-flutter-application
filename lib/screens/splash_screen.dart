import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bmi/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_navigator_bar.dart';
import 'tab_controller.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashscreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> hideScreen() async {
    await Future.delayed(Duration(milliseconds: 2950), () async {
      Get.offAll(MainButtonNavigatorBar()
      );
    });
  }

  bool hided = false;

  @override
  void didChangeDependencies() {
    if (!hided) {
      hideScreen();
      hided = true;
    }
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: inactiveColor,
      ),
      child: Center(
        child: WavyAnimatedTextKit(
          isRepeatingAnimation: false,
          textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          //pause between repetation
          pause: Duration(milliseconds: 100),
          speed: Duration(milliseconds: 250),
          text: ['B M I', 'BMI'],
        ),
      ),
    ));
  }
}
