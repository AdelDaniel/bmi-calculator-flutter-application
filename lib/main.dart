import 'file:///J:/max_projects/bmi/lib/screens/bottom_navigator_bar.dart';
import 'package:bmi/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'screens/input_screen.dart';
import 'screens/tab_controller.dart';
import 'screens/result_screen.dart';
import 'screens/table_screean.dart';
import 'package:flutter/services.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        title: "BMI And Search For Recipes: Adel Nabil",

        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: kMainColor,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: kMainColor,
        ),
        home: SplashScreen(),
        getPages: [
          GetPage(name: InputScreen.routeName, page: () => InputScreen()),
          GetPage(name: TableScreen.routeName, page: () => TableScreen()),
          GetPage(
              name: ResultScreen.routeName,
              page: () => ResultScreen(),
              transitionDuration: Duration(milliseconds: 250),
              transition: Transition.cupertino,
              curve: Curves.easeOutCirc),
          GetPage(
              name: BmiTabBarController.pageRoute, page: () => BmiTabBarController()),
        ]);
  }
}
