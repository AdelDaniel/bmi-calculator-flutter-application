import 'package:flutter/foundation.dart';

class BmiData {
  String _id;
  final String _title;
  final String _detail;
  final double _result;
  final double _weight;
  final double _age;
  final double _height;
  final Gender _gender;
  final DateTime _dateTime;

  BmiData(
      {String id,
      @required String title,
      @required String detail,
      @required double result,
      @required double weight,
      @required double age,
      @required double height,
      @required Gender gender,
      @required DateTime dateTime})
      : _id = id,
        _detail = detail,
        _result = result,
        _weight = weight,
        _title = title,
        _age = age,
        _height = height,
        _gender = gender,
        _dateTime = dateTime;

  get age => _age;
  DateTime get dateTime => _dateTime;
  get detail => _detail;
  get gender => _gender;
  get height => _height;
  get id => _id;
  get result => _result;
  get title => _title;
  get weight => _weight;
  set id(int id) => _id = id.toString();
}

enum Gender { male, female }
