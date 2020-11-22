import 'dart:convert';
import '../model/recipe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../very_important_data_keys.dart';

class RecipeService extends GetxController {
  List<MainItem> mainItems = [];
  //List hits = [];
  static RxList _recipes = List<Recipe>().obs;

  Future getAllRecipes(String searchWord) async {
    _recipes.clear();
    String url =
        "https://api.edamam.com/search?q=$searchWord&app_id=$applicationID&app_key=$applicationKey";
    var response = await http.get(url);
    //  print(" $response this is response");
    Map<String, dynamic> jsonDataBody = jsonDecode(response.body);
    //  print("this is json Data $jsonDataBody"); // good
    jsonDataBody["hits"].forEach((element) {
      //   print(element.toString());
      Recipe recipe = Recipe.fromJson(element['recipe']);
      //  print(recipe.uri);
      _recipes.add(recipe);
    });
    return;
  }

  static get getRecipes => _recipes;
}
