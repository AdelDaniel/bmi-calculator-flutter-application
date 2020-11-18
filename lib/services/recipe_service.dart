
import 'dart:convert';
import '../model/recipe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RecipeService extends GetxController {

  List<MainItem> mainItems =[];
  //List hits = [];
  static RxList _recipes = List<Recipe>().obs;
  static const String _applicationID = "acfdcdf7";
  static const  String _applicationKey = '2c2a9bbb08a38991897cb7bdc5c3b493';


  Future getAllRecipes(String searchWord) async{
    String url =
        "https://api.edamam.com/search?q=$searchWord&app_id=$_applicationID&app_key=$_applicationKey";
    var response = await http.get(url);
    //  print(" $response this is response");
    Map<String, dynamic> jsonDataBody = jsonDecode(response.body);
    //  print("this is json Data $jsonDataBody"); // good
    jsonDataBody["hits"].forEach((element) {
    //   print(element.toString());
      Recipe recipe = Recipe.fromJson(element['recipe']);
    //  print(recipe.uri);
      _recipes.insert(0,recipe);
    });
    return;
  }

  static get getRecipes => _recipes;

}