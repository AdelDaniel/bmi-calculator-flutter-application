
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../model/data_model.dart';
import '../widgets/ReultScreenButton.dart';
import '../widgets/ResultTableInfo.dart';
import '../widgets/SaveDialog.dart';

//  BMI Categories:
//  Underweight = <18.5
//  Normal weight = 18.5–24.9
//  Overweight = 25–29.9
//  Obesity = BMI of 30 or greater

class ResultScreen extends StatelessWidget {
  static const String routeName = "Result Screen";

  @override
  Widget build(BuildContext context) {
    BmiData newPersonData = Get.arguments;

    double finalResult = 0;
    String resultText = 'Your BMI Result..';
    String resultDetails;

    double goodWeight1, goodWeight2;

    finalResult = newPersonData.weight /
        (newPersonData.height * newPersonData.height / 10000);
    goodWeight1 = 19 * (newPersonData.height * newPersonData.height / 10000);
    goodWeight2 = 24.9 * (newPersonData.height * newPersonData.height / 10000);

    if (finalResult <= 18.5) {
      resultText = "Underweight";
      resultDetails =
          ' your Weight Must Be Between (${goodWeight1.toStringAsFixed(1)} ~ ${goodWeight2.toStringAsFixed(1)}) Kg';
    } else if (finalResult <= 24.9 && finalResult > 18.5) {
      resultText = "Normal Weight ";
      resultDetails = 'Your Weight Is Perfect';
    } else if (finalResult < 29.9 && finalResult > 24.9) {
      resultText = "Overweight";
      resultDetails =
          ' your Weight Must Be Between (${goodWeight1.toStringAsFixed(1)} ~ ${goodWeight2.toStringAsFixed(1)}) Kg';
    } else if (finalResult > 29.9) {
      resultText = "Obesity ";
      resultDetails =
          ' your Weight Must Be Between (${goodWeight1.toStringAsFixed(1)} ~ ${goodWeight2.toStringAsFixed(1)}) Kg';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      backgroundColor: kMainColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Your BMI..',
                  style: kMainStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: inactiveColor,
                width: double.infinity,
                margin: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          resultText,
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              color: Colors.green[800],
                              fontSize: 25.0,
                              wordSpacing: 5.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        finalResult.toStringAsFixed(1),
                        style: kMainStyle.copyWith(
                            backgroundColor: Colors.transparent),
                        textScaleFactor: 2,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        resultDetails,
                        style: kSecStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ResultTableInfo(
                        newPersonData: newPersonData, finalResult: finalResult),
                  ],
                ),
              ),
            ),
            Container(
              color: kMainColor,
              child: Center(
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.exclamationCircle,
                      color: Colors.green[800],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'your BMI must be Betweem (19 ~ 24.9)',
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 10.0,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  ResultScreenButton(
                    label: 'Save Result',
                    onTap: () {
                      TextEditingController addTitleController =
                          TextEditingController();
                      Get.dialog(
                        SaveDialog(
                            finalResult: finalResult,
                            addTitleController: addTitleController,
                            newPersonData: newPersonData,
                            resultText: resultText),
                      );
                    },
                  ),
                  ResultScreenButton(
                    label: 'Cancel',
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
