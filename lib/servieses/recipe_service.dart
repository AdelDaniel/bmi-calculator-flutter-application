
import 'dart:convert';

import 'package:bmi/model/recipe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RecipeService extends GetxController {

  List<MainItem> mainItems =[];
  //List hits = [];
  static RxList recipes = List<Recipe>().obs;
  static const String _applicationID = "ac******7";
  static const  String _applicationKey = '2c2a**************************3b493';


  Future getAllRecipes(String searchWord) async{
    String url =
        "https://api.edamam.com/search?q=$searchWord&app_id=${_applicationID}&app_key=${_applicationKey}";
    var response = await http.get(url);
    //  print(" $response this is response");
    Map<String, dynamic> jsonDataBody = jsonDecode(response.body);
    //  print("this is json Data $jsonDataBody"); // good
    jsonDataBody["hits"].forEach((element) {
    //   print(element.toString());
      Recipe recipe = Recipe.fromJson(element['recipe']);
    //  print(recipe.uri);
      recipes.insert(0,recipe);
    });
    return;
  }

}