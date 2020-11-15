
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:get/get.dart';
import '../model/data_model.dart';
import '../controller/data_getX_controller.dart';

class SaveDialog extends StatelessWidget {
  const SaveDialog(
      {Key key,
      @required this.finalResult,
      @required this.addTitleController,
      @required this.newPersonData,
      @required this.resultText})
      : super(key: key);

  final double finalResult;
  final TextEditingController addTitleController;
  final BmiData newPersonData;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      child: Container(
        color: inactiveColor,
        height: Get.height / 3.5,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Add title',
                style: kMainStyle,
              ),
              Text(
                'Result =' + finalResult.toStringAsFixed(2),
                style: kMainStyle,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: addTitleController,
                // onChanged: (value) => addTitle = value,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: activeColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: activeColor, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),

              // add data to list
              RaisedButton(
                  color: activeColor,
                  child: Text('Submit'),
                  onPressed: () async {
                    Get.back();
                    Get.snackbar('Saving', 'please wait until saving....' ,icon: Icon(Icons.timer));
                    await Get.find<Controller>().addNewResult(
                      BmiData(
                          detail: resultText,
                          id: newPersonData.dateTime.toIso8601String(),
                          result: finalResult,
                          weight: newPersonData.weight,
                          title: addTitleController.text == null ?"~":addTitleController.text,
                          age: newPersonData.age,
                          height: newPersonData.height,
                          gender: newPersonData.gender,
                          dateTime: newPersonData.dateTime),
                    );
                    Get.back();
                    Get.snackbar('Saved', 'Save your Result');
                    Get.rawSnackbar(
                        title: 'Saved', message: 'Save your Result');

                  }),
            ],
          ),
        ),
      ),
    );
  }
}
