
import '../constants.dart';
import '../model/recipe.dart';
import '../screens/recipe_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';


class RecipeTile extends StatefulWidget {
  final Recipe recipe;

  RecipeTile({this.recipe});

  @override
  _RecipeTileState createState() => _RecipeTileState();
}

class _RecipeTileState extends State<RecipeTile> {

  @override
  Widget build(BuildContext context) {
    return
      Card(
        elevation: 10,
        margin: const EdgeInsets.all(10),
        color: Colors.transparent,

        child: GestureDetector(
          onTap: ()  {
            Get.to(RecipeDetailScreen(recipe: widget.recipe,));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              color: Colors.white,
              child: Stack(

                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),topLeft: Radius.circular(15)),
                    child: CachedNetworkImage(

                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      imageUrl:widget.recipe.image,
                    ),
                  ),

                  Center(
                    child: Container(
                      height: 100,
                      width: 200,
                      color: Colors.white70,

                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  widget.recipe.label,
                                style: kMainStyle.copyWith(fontSize: 20,color: Colors.black)
                              ),
                              Text(
                                widget.recipe.source,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    fontFamily: 'OverpassRegular'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}