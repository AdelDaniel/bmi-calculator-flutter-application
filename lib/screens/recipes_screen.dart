
import '../constants.dart';
import '../services/recipe_service.dart';
import 'package:get/get.dart';
import '../widgets/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/recipe_card.dart';

class RecipesScreen extends StatefulWidget {
  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}



class _RecipesScreenState extends State<RecipesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height : MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  inactiveColor,
                  activeColor
                ],
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.bottomLeft
              )
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "What will you cook today?",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Overpass'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Just press 🔎 in AppBar and Enter Ingredients you have and we will show the best recipe for you",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'OverpassRegular'),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Obx(()=>Container(
                      child: ListView.builder(
                        itemExtent: 200,
                        //shrinkWrap: true,
                        itemCount: RecipeService.getRecipes.length,
                        itemBuilder: (context, index)=> RecipeTile(
                          recipe: RecipeService.getRecipes[index]
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
