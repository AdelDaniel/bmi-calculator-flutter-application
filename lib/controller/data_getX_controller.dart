import 'package:bmi/helper/db_helper.dart';
import 'package:get/get.dart';
import '../model/data_model.dart';

class Controller extends GetxController {
  final DBHelper dbHelper = DBHelper();
  List<BmiData>  bmiData = [
    // BmiData(
    //     age: 25,
    //     detail: ' none ',
    //     title: '1',
    //     weight: 80,
    //     height: 170,
    //     dateTime: DateTime.now(),
    //     result: 10,
    //     id: DateTime.now().toIso8601String(),
    //     gender: Gender.female),
    // BmiData(
    //     age: 25,
    //     detail: ' none ',
    //     title: '1',
    //     weight: 80,
    //     height: 170,
    //     dateTime: DateTime.now(),
    //     result: 10,
    //     id: DateTime.now().toIso8601String(),
    //     gender: Gender.female),
    // BmiData(
    //     age: 25,
    //     title: '1',
    //     detail: ' none ',
    //     weight: 80,
    //     height: 170,
    //     dateTime: DateTime.now(),
    //     result: 10,
    //     id: DateTime.now().toIso8601String(),
    //     gender: Gender.female),
  ];

  addNewResult(BmiData bmiDataItem) async {
    //to check all data in the list from db helper before insert new
    //so it will fill the table first then add new
    await getResultsFromDbHelper();
    int returnedId = await dbHelper.insert(bmiDataItem);
    bmiDataItem.id = returnedId;
    bmiData.insert(0,bmiDataItem);
    update();
  }

  Future<void> getResultsFromDbHelper() async {
    if(bmiData.isNotEmpty)return;
    // print('c');
    bmiData = (await dbHelper.getAllResults())
        .map((item) => BmiData(
                    id: (item["id"]).toString(),
                    title: item["title"] ==""? "~": item["title"],
                    detail: item['detail'],
                    result: item["result"],
                    weight: item["weight"],
                    age: item["age"],
                    height: item["height"],
                    gender: item["gender"] == "male"?Gender.male:Gender.female,
                    dateTime: DateTime.parse(item["dateTime"])))
        .toList();

    bmiData = bmiData.reversed.toList();
    // print(bmiData);
    return ;
  }

  // Future<List<BmiData>> getResultsFromDbHelper() async {
  //   print('c');
  //   var data = (await dbHelper.getAllResults());
  //   print(data);
  //   bmiData = data.map((item) => BmiData(
  //       id: item["id"].toString(),
  //       title: item["title"].toString(),
  //       detail: item['detail'].toString(),
  //       result: item["result"],
  //       weight: item["weight"],
  //       age: item["age"],
  //       height: item["height"],
  //       gender: item["gender"],
  //       dateTime: item["dateTime"]))
  //       .toList();
  //   print("n");
  //   print(bmiData[0]);
  //   return bmiData.reversed;
  // }

  // Future<dynamic> getResultsFromDbHelper() async {
  //   print('c');
  //   return await dbHelper.getAllResults();
  //   // bmiData.reversed;
  // }

  test() {
    bmiData.add(
      BmiData(
          age: 25,
          detail: ' none ',
          title: '1',
          weight: 80,
          height: 170,
          dateTime: DateTime.now(),
          result: 10,
          id: DateTime.now().toIso8601String(),
          gender: Gender.female),
    );
    update();
  }
}
