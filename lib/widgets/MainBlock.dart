import 'package:flutter/material.dart';

class MainBlock extends StatelessWidget {
  final Color containerColor;
  final Widget containerChild;
  final Function onTap;
  MainBlock({this.containerChild, this.containerColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: containerChild,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: containerColor == null ? Color(0xFF1d1f33) : containerColor,
        ),
      ),
    );
  }
}
