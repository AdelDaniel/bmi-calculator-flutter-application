

import 'package:bmi/controller/data_getX_controller.dart';
import 'package:flutter/material.dart';
import '../model/data_model.dart';
import '../constants.dart';
import 'package:intl/intl.dart';


class MainTable extends StatefulWidget {

  const MainTable(this.controller) ;
  final Controller controller;

  @override
  _MainTableState createState() => _MainTableState();
}

class _MainTableState extends State<MainTable> {

  bool sort = true ;
  int sortColumnIndex = 0 ;
  DataColumn dataColumn(String text ,{bool numeric}) {
    return DataColumn(
        onSort: (columnIndex, ascending) {
          setState(() {
            sort = !sort;
            sortColumnIndex = columnIndex;
          });
          onSortColumn(columnIndex, ascending);
        },
      numeric: numeric==true?? false,
      label: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text, style: kFirstRowStyle),
      ),
    );
  }

  onSortColumn(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        widget.controller.bmiData.sort((a, b) => a.dateTime.compareTo(b.dateTime));
      } else {
        widget.controller.bmiData.sort((a, b) => b.dateTime.compareTo(a.dateTime));
      }
    }

    if (columnIndex == 1) {
      if (ascending) {
        widget.controller.bmiData.sort((a, b) => a.title.compareTo(b.title));
      } else {
        widget.controller.bmiData.sort((a, b) => b.title.compareTo(a.title));
      }
    }
    if (columnIndex == 2) {
      if (ascending) {
        widget.controller.bmiData.sort((a, b) => a.result.compareTo(b.result));
      } else {
        widget.controller.bmiData.sort((a, b) => b.result.compareTo(a.result));
      }
    }
    if (columnIndex == 4) {
      if (ascending) {
        widget.controller.bmiData.sort((a, b) => a.weight.compareTo(b.weight));
      } else {
        widget.controller.bmiData.sort((a, b) => b.weight.compareTo(a.weight));
      }
    }
  }

  DataCell dataCell(String text) {
    return DataCell(
      Center(
        child: Text(
          text,
          style: kSecStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dataRowHeight: 60,
      dividerThickness: 2,
      horizontalMargin: 10,
      showBottomBorder: true,
      sortColumnIndex: sortColumnIndex,
      sortAscending: sort,
      columnSpacing: 3,
      headingRowHeight: 80,
      headingRowColor: MaterialStateProperty.resolveWith ((Set  states) {
        if (states.contains(MaterialState.hovered))
          return inactiveColor;
        return activeColor.withOpacity(0.3);  // Use the default value.
      }),
      columns: [
        dataColumn('Time'),
        dataColumn('Title'),
        dataColumn('Result',numeric: true),
        dataColumn('Detail',numeric: true),
        dataColumn('Weight',numeric: true),
        dataColumn('Height',numeric: true),
        dataColumn('Age',numeric: true),
        dataColumn('Gender'),
      ],
      rows: widget.controller.bmiData.map((bmiDataItem) {
        return DataRow(

          selected: true,
          cells: <DataCell>[

            dataCell(DateFormat(' dd-MM-yyyy \n hh:mm a').format(bmiDataItem.dateTime) ),
            dataCell(bmiDataItem.title),
            dataCell(bmiDataItem.result.toStringAsFixed(2)),
            dataCell(bmiDataItem.detail),
            dataCell(bmiDataItem.weight.toStringAsFixed(2)),
            dataCell(bmiDataItem.height.toStringAsFixed(2)),
            dataCell(bmiDataItem.age.toString()),
            dataCell(bmiDataItem.gender == Gender.male
                ? 'Male 🚹'
                : 'Female 🚺'),
          ],
        );
      }).toList(),
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

