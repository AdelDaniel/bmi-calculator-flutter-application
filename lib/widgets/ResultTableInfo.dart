
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/data_model.dart';
import '../constants.dart';

class ResultTableInfo extends StatefulWidget {
  const ResultTableInfo({
    Key key,
    @required this.newPersonData,
    @required this.finalResult,
  }) : super(key: key);

  final BmiData newPersonData;
  final double finalResult;

  @override
  _ResultTableInfoState createState() => _ResultTableInfoState();
}

class _ResultTableInfoState extends State<ResultTableInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: [
          Table(
            border: TableBorder.all(color: activeColor),
            children: [
              TableRow(children: [

                TextInResultTable('Result'),
                TextInResultTable('Weight'),
                TextInResultTable('Height'),
                TextInResultTable('Age'),
                TextInResultTable('Gender'),
              ]),
              TableRow(children: [

                TextInResultTable(widget.finalResult.toStringAsFixed(2)),
                TextInResultTable(widget.newPersonData.weight.toStringAsFixed(2)),
                TextInResultTable(widget.newPersonData.height.toStringAsFixed(2)),
                TextInResultTable(widget.newPersonData.age.toString()),
                TextInResultTable(
                    widget.newPersonData.gender == Gender.male ? '🚹' : '🚺'),
              ])
            ],
          ),
          Text('Time: ${DateFormat(' dd-MM-yyyy  hh:mm a').format(widget.newPersonData.dateTime)}',)
        ],

      ),
    );
  }
}

class TextInResultTable extends StatelessWidget {
  const TextInResultTable(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: kSecStyle,
      textAlign: TextAlign.center,
    );
  }
}

