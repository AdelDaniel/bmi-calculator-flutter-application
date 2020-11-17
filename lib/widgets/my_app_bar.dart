

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/recipe_service.dart';
import 'package:get/get.dart';


class MyAppBar extends StatefulWidget implements PreferredSizeWidget  {
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {


  RecipeService recipeService =RecipeService();

  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  // String searchQuery = "Search query";



  Widget _buildSearchField() {
    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: (value)async{
        //// most important code line

        Get.snackbar("Waiting....", _searchQueryController.text ,icon: Icon(Icons.timer),duration: Duration(hours: 1));
        await recipeService.getAllRecipes(_searchQueryController.text); ////////
        Get.back();
        print(_searchQueryController.text);
      },
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search Data...",
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      // onChanged: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    //ModelRoute is the back icon and it is auto generated
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  // void updateSearchQuery(String newQuery) {
  //   setState(() {
  //     searchQuery = newQuery;
  //   });
  // }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      //updateSearchQuery("");
    });
  }

  _buildTitle(BuildContext context) {
    return Text("What will you cook ?");
  }

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      leading: _isSearching ? const BackButton() : Icon(Icons.fastfood_sharp),
      title: _isSearching ? _buildSearchField() : _buildTitle(context),
      actions: _buildActions(),
    );
  }
}
