
import '../widgets/main_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/data_getX_controller.dart';
import '../constants.dart';

class TableScreen extends StatelessWidget {
  static const String routeName = "Table page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Controller>(
          init: Controller(),
          builder: (controller) {
            return FutureBuilder(
                future: controller.getResultsFromDbHelper(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator()),
                    );
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        color: inactiveColor,
                        child: MainTable(controller),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
