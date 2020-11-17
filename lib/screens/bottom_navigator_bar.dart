

import 'file:///J:/max_projects/bmi/lib/screens/recipes_screen.dart';
import 'file:///J:/max_projects/bmi/lib/screens/tab_controller.dart';
import 'package:bmi/screens/about_developer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class MainButtonNavigatorBar extends StatefulWidget {
  static const String routeName = "Bottom Navigation Bar";

  @override
  _MainButtonNavigatorBarState createState() => _MainButtonNavigatorBarState();
}

class _MainButtonNavigatorBarState extends State<MainButtonNavigatorBar> {
  int currentPage = 0;

  final List<Widget> pages =[
    BmiTabBarController(),
    RecipesScreen(),
    AboutDeveloperScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentPage,
        elevation: 10,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: kMainColor,
        selectedItemColor: Colors.white,
        selectedLabelStyle: kMainStyle.copyWith(fontSize: 15),
        unselectedItemColor: Colors.white70,
        unselectedLabelStyle: kSecStyle.copyWith(fontSize: 10),
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 20),

        onTap: (index){
          setState(() {
            currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon:  Icon(Icons.home) ,label: "BMI" ),
          BottomNavigationBarItem(icon:  Icon(Icons.search) ,label: "Find Food" ),
          BottomNavigationBarItem(icon:  Icon(Icons.person) ,label: "About Me" ),
        ],

      ) ,
    );
  }
}
