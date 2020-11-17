import 'package:flutter/material.dart';

import 'table_screen.dart';
import 'input_screen.dart';
import '../controller/data_getX_controller.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' as ic;

class BmiTabBarController extends StatelessWidget {
  static const String pageRoute = 'Tab Bar';

  final Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          actions: [
            IconButton(
                icon: Icon(ic.FontAwesomeIcons.check),
                onPressed: () {
                  controller.test();
                }),
            // IconButton(
            //     icon: Icon(Icons.settings),
            //     onPressed: () {
            //       Get.bottomSheet(
            //        // BottomSheetContant(),
            //       );
            //     })
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.table_chart)),

            ],
          ),
        ),
        body: TabBarView(
          children: [
            InputScreen(),
            TableScreen(),

          ],
        ),
      ),
    );
  }
}

// class BottomSheetContant extends StatefulWidget {
//   const BottomSheetContant({
//     Key key,
//   }) : super(key: key);

//   @override
//   _BottomSheetContantState createState() => _BottomSheetContantState();
// }

// class _BottomSheetContantState extends State<BottomSheetContant> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Center(
//           child: CircleColorPicker(
//             initialColor: kMainColor,
//             onChanged: (color) {
//               setState(() {
//                 kMainColor = color;
//               });
//             },
//             size: const Size(300, 300),
//             strokeWidth: 4,
//             thumbSize: 36,
//           ),
//         ),
//         IconButton(
//           icon: Icon(
//             ic.FontAwesomeIcons.check,
//             color: Colors.white,
//           ),
//           onPressed: () {},
//         ),
//       ],
//     );
//   }
// }

// class TabBarController extends StatefulWidget {
//   static const String pageRoute = 'Tab Bar';
//   @override
//   _TabBarControllerState createState() => _TabBarControllerState();
// }

// class _TabBarControllerState extends State<TabBarController>
//     with SingleTickerProviderStateMixin {
//   TabController _tabController;
//   ScrollController _scrollViewController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(vsync: this, length: 2);
//     _scrollViewController = ScrollController(initialScrollOffset: 0.0);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _scrollViewController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: NestedScrollView(
//         controller: _scrollViewController,
//         headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               title: Text('Tab Controller Example'),
//               pinned: true,
//               floating: true,
//               forceElevated: boxIsScrolled,
//               bottom: TabBar(
//                 tabs: <Widget>[
//                   Tab(
//                     text: "Home",
//                     icon: Icon(Icons.home),
//                   ),
//                   Tab(
//                     text: "Example page",
//                     icon: Icon(Icons.help),
//                   )
//                 ],
//                 controller: _tabController,
//               ),
//             )
//           ];
//         },
//         body: TabBarView(
//           children: <Widget>[
//             InputScreen(),
//             TableScreen(),
//           ],
//           controller: _tabController,
//         ),
//       ),
//     );
//   }
// }
