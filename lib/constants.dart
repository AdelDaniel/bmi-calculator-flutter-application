import 'package:flutter/material.dart';

const double minHeight = 90.0;
const double maxHeight = 250.0;
const int maxAge = 150;
const int minAge = 0;
const double minWeight = 0.0;
const double maxWeight = 210.0;

const TextStyle kMainStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 40.0,
    textBaseline: TextBaseline.alphabetic);
const TextStyle kFirstRowStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    textBaseline: TextBaseline.alphabetic);

const TextStyle kSecStyle = TextStyle(
    color: Colors.white54, fontWeight: FontWeight.w400, fontSize: 15.0);
const Color activeColor = Color(0xFF3949AB);
const Color inactiveColor = Color(0xFF1d1f33);
Color kMainColor = Color(0xFF000033);

enum EnumGender { male, female }

Text upDownLabel(String lb) {
  return Text(
    lb,
    style: kSecStyle,
  );
}

Icon upDownIcon(IconData ic) {
  return Icon(
    ic,
    color: activeColor,
    size: 30.0,
  );
}
