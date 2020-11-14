import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:get/get.dart';

class ResultScreenButton extends StatelessWidget {
  final Function onTap;
  final String label;
  const ResultScreenButton({
    this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: Get.width / 2,
        color: label == 'Cancel' ? inactiveColor : activeColor,
        height: 66.0,
        child: Center(
            child: FittedBox(
          child: Text(
            label,
            style: kMainStyle,
          ),
        )),
      ),
    );
  }
}
