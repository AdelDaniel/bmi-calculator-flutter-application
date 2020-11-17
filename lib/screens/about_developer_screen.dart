import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class AboutDeveloperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
        leading: Icon(Icons.info),

      ),
        body: Center(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  inactiveColor,
                  activeColor
                ],
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomLeft
            )
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.white.withOpacity(0.2),
              child: ListTile(
                title: Text("Name" ,style: kSecStyle.copyWith(color: Colors.black38),),
                subtitle: Text("Adel Nabil" ,style: kMainStyle.copyWith(color: Colors.black),),
              ),
            ),
            Card(
              color: Colors.white.withOpacity(0.2),
              child: ListTile(
                title: Text("Mail" ,style: kSecStyle.copyWith(color: Colors.black38),),
                subtitle: Text("3adelnabil555@gmail.com" ,style: kMainStyle.copyWith(color: Colors.black, fontSize: 18),),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
