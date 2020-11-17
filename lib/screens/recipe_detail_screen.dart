import 'dart:convert';

import 'package:bmi/model/recipe.dart';
import 'package:bmi/screens/recipe_web_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe ;
  const RecipeDetailScreen({Key key, this.recipe}) : super(key: key);

@override
Widget build(BuildContext context) {

  List totalNutrientsString(Map<String , dynamic> allData){
    List<String> list = [];
    allData.forEach((key, value) {
        list.add("${value['label']} ${value['quantity'].toStringAsFixed(2)} ${value['unit']} ");
    });
    return list;
  }
  return Scaffold(
    body: CachedNetworkImage(
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      imageUrl: recipe.image,
      imageBuilder: (context, imageProvider) => Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),

        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 8,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Text(recipe.label ,
                style: kMainStyle.copyWith(fontSize: 25 ,backgroundColor: Colors.black12),),
                // Allows the user to reveal the app bar if they begin scrolling back
                // up the list of items.
                floating: true,
                snap: true,
                // Display a placeholder widget to visualize the shrinking size.
                flexibleSpace:CachedNetworkImage(
                  // height: MediaQuery.of(context).size.height *50/100,
                  //width: MediaQuery.of(context).size.width,
                  // fit: BoxFit.fill,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  imageUrl: recipe.image,
                  imageBuilder: (context, imageProvider) => Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitWidth,
                      ),
                    ),),),
                pinned: false,
                //excludeHeaderSemantics: true,
                 toolbarHeight: MediaQuery.of(context).size.height * 40 / 100,
                //collapsedHeight: 20,
                // Make the initial height of the SliverAppBar larger than normal.
                expandedHeight: MediaQuery.of(context).size.height * 15 / 100,
              ),
              //
               SliverList(delegate: SliverChildListDelegate.fixed([
                 Column(
                   children: [
                     DataCard(title: 'Calories',list: [recipe.calories.toStringAsFixed(2)]),
                     DataCard(title: 'Total Weight',list: [recipe.totalWeight.toStringAsFixed(2)]),
                     DataCard(title: 'Total Time',list: [recipe.totalTime.toStringAsFixed(2)]),
                     DataCard(title: 'Yield',list: [recipe.yield.toStringAsFixed(2)]),
                     DataCard(title: 'Cautions',list: recipe.cautions),
                     DataCard(title: 'Ingredient Lines',list: recipe.ingredientLines),
                     DataCard(title: 'Diet Labels',list: recipe.dietLabels),
                     DataCard(title: 'Health Labels',list: recipe.healthLabels),



                       DataCard(
                           title: 'Total Nutrients',
                           list: totalNutrientsString(recipe.totalNutrients)),

                     Column(
                       children: List.generate(recipe.digest.length, (index)
                          => DataCard(
                              title: 'Digest of: ${ recipe.digest[index].label}',
                              list: [
                                "Daily: ${recipe.digest[index].daily.toStringAsFixed(2)} ${recipe.digest[index].unit}  " ,
                                "hasRDI: ${recipe.digest[index].hasRDI ?"yes":"No"} " ,
                                "total: ${recipe.digest[index].total.toString()} ${recipe.digest[index].unit }" ,
                                "tag: ${recipe.digest[index].tag} ",] ),),
                     ),
                     SizedBox(height: 50,)
                   ],
                 ),

               ],))
            ],
          ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: GestureDetector(
                  onTap: () async{
                     // print(recipe.url + " this is what we are going to see");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecipeWebView(recipe.url,),
                    ));

                  },
                  child: Container(
                    color: activeColor,
                    // margin: EdgeInsets.only(top: 10.0),
                    width: double.infinity,
                    height: 50.0,
                    child: Center(
                        child: Text(
                          'Go To Source 🌐: ${recipe.source}',
                          style: kMainStyle.copyWith(fontSize: 18),
                        )),
                  ),
                ),
              ),
            ),]
        ),
      ),
    ));
}}


class DataCard extends StatelessWidget {
  final String title;
  final list ;

  const DataCard({ this.title, this.list}) ;

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white.withOpacity(0.6),
      child: ListTile(
        title: Text(title),
        
        subtitle: Container(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(list.length, (index) => Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(list[index]),
              )),
            )
        ),
      ),
    );
  }
}

