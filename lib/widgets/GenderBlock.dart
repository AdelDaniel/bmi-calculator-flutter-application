import 'package:flutter/material.dart';
import '../constants.dart';

class GenderBlock extends StatelessWidget {
  final IconData iconData;
  final String iconTitle;
  GenderBlock(this.iconData, this.iconTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.white,
          ),
          SizedBox(
            height: 5.0,
          ),
          FittedBox(
            child: Text(
              iconTitle,
              style: kSecStyle,
            ),
          )
        ],
      ),
    );
  }
}
