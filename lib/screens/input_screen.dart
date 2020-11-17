import '../model/data_model.dart';
import '../helper/db_helper.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' as ic;
import '../widgets/PluseAndMinusRoundButton.dart';
import 'result_screen.dart';
import 'package:get/get.dart';
import '../widgets/MainBlock.dart';
import '../widgets/SliderWidget.dart';
import '../widgets/GenderBlock.dart';

class InputScreen extends StatefulWidget {
  static const String routeName = "Input page";
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  DBHelper dbHelper;
  @override
  void initState() {
    dbHelper = DBHelper();
    dbHelper.createDatabase();
    super.initState();
  }

  double height = 172.0, weight = 75.0;
  double age = 22;
  Color maleColor = activeColor;
  Color femaleColor = inactiveColor;

  void changedAge(double _age) {
    setState(() {
      (_age > maxAge) || (_age < minAge) ? age = age : age = _age;
    });
  }

  void changedSlidedHeight(double _sliderValue) {
    setState(() {
      (_sliderValue > maxHeight) || (_sliderValue < minHeight)
          ? height = height
          : height = _sliderValue;
    });
  }

  void changedSlidedWeight(double _weight) {
    setState(() {
      (_weight > maxWeight) || (_weight < minWeight)
          ? weight = weight
          : weight = _weight;
    });
  }

  void onPressed(EnumGender i) {
    setState(() {
      i == EnumGender.male
          ? maleColor = activeColor
          : maleColor = inactiveColor;
      i == EnumGender.female
          ? femaleColor = activeColor
          : femaleColor = inactiveColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  inactiveColor.withOpacity(0.7),
                  activeColor.withOpacity(0.7)
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter
            )
        ),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FittedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              MainBlock(
                                containerChild: GenderBlock(
                                    ic.FontAwesomeIcons.male, 'Male'),
                                containerColor: maleColor,
                                onTap: () => onPressed(EnumGender.male),
                              ),
                              MainBlock(
                                containerChild: GenderBlock(
                                    ic.FontAwesomeIcons.female, 'Female'),
                                containerColor: femaleColor,
                                onTap: () => onPressed(EnumGender.female),
                              ),
                            ],
                          ),
                        ),
                        FittedBox(
                          child: MainBlock(
                            containerChild: Container(
                              margin: const EdgeInsets.all(30),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Your Age',
                                    style: kSecStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: <Widget>[
                                      Text(
                                        '$age',
                                        style: kMainStyle,
                                      ),
                                      Text(
                                        'Old',
                                        style: kSecStyle,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      PluseAndMinusRoundButton(
                                        myIcon: ic.FontAwesomeIcons.plus,
                                        onPressed: () => changedAge(age + 1),
                                      ),
                                      PluseAndMinusRoundButton(
                                        myIcon: ic.FontAwesomeIcons.minus,
                                        onPressed: () => changedAge(age - 1),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    MainBlock(
                      containerChild: SliderWidget(
                        label: 'HEGHIT',
                        max: maxHeight,
                        min: minHeight,
                        sliderValue: height,
                        onPressed: changedSlidedHeight,
                      ),
                    ),
                    MainBlock(
                      containerChild: SliderWidget(
                        label: 'WEGHIT',
                        max: maxWeight,
                        min: minWeight,
                        sliderValue: weight,
                        onPressed: changedSlidedWeight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(ResultScreen.routeName,
                    arguments: BmiData(
                      id: null,
                      result: null,
                      detail: '~',
                      weight: weight,
                      title: '~',
                      age: age,
                      height: height,
                      gender: maleColor == activeColor
                          ? Gender.male
                          : Gender.female,
                      dateTime: DateTime.now(),
                    ));

                // Get.to(
                //   ResultScreen(
                //       personWeight: weight,
                //       personHight: height,
                //       personAge: age,
                //       personGender: maleColor == activeColor
                //           ? Gender.male
                //           : Gender.female),
                // arguments: BmiData(
                //     id: null,
                //     result: null,
                //     weight: weight,
                //     title: null,
                //     age: age,
                //     height: height,
                //     gender: maleColor == activeColor
                //         ? Gender.male
                //         : Gender.female,
                //     dateTime: null),

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ResultScreen(
                //         personWeight: weight,
                //         personHight: height,
                //         personAge: age,
                //         personGender: maleColor == activeColor
                //             ? Gender.male
                //             : Gender.female),
                //   ),
                // );
              },
              child: SafeArea(
                child: Container(
                  color: activeColor,
                  // margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: 66.0,
                  child: Center(
                      child: Text(
                    'Calculate',
                    style: kMainStyle,
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
