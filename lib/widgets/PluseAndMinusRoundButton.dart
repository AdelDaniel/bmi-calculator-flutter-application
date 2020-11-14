import 'package:flutter/material.dart';
import '../constants.dart';

class PluseAndMinusRoundButton extends StatelessWidget {
  final IconData myIcon;
  final Function onPressed;

  PluseAndMinusRoundButton({this.myIcon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: RawMaterialButton(
        shape: CircleBorder(),
        fillColor: Colors.white54,
        focusColor: activeColor,
        onPressed: onPressed,
        child: Icon(
          myIcon,
          color: Colors.white,
        ),
        hoverColor: activeColor,
        highlightColor: activeColor,
        splashColor: activeColor,
        padding: const EdgeInsets.all(0),
        constraints: BoxConstraints(
          minHeight: 56.0,
          maxHeight: 56.0,
          maxWidth: 56.0,
          minWidth: 56.0,
        ),
      ),
    );
  }
}
