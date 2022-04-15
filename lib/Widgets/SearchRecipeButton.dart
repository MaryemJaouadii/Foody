import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/Ingredient.dart';
import '../Models/recipe_model.dart';
import 'dart:convert';
import 'package:foodproject/screens/totalRecipes.dart';


class SearchRecipeButton extends StatefulWidget {

  @override
  State<SearchRecipeButton> createState() => _SearchRecipeButtonState();
}

class _SearchRecipeButtonState extends State<SearchRecipeButton> {
  bool loading = false;
  List<RecipeModel> recipies = new List<RecipeModel>.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFEA676A),
          borderRadius: BorderRadius.circular(15.0)),
      child: OutlinedButton(
        onPressed: () async {
          String tot='';
          for (var i in IngredientView.selectedIngredients)
            tot+=i.ingrName+ ' ';
          print(tot);

          if (IngredientView.selectedIngredients.isNotEmpty) {
            setState(() {
              loading = true;
            });
            recipies = new List<RecipeModel>.empty(growable: true);
            String url =
                "https://api.edamam.com/search?q=${tot}&app_id=227f981e&app_key=bc3ecb377a931c694b6b49412d31e012";
            var response = await http.get(Uri.parse(url)
            );
            print(" $response this is response");
            Map<String, dynamic> jsonData = jsonDecode(response.body) ;
            print("this is json Data $jsonData");
            jsonData["hits"]?.forEach((element) {
              print(element.toString());
              RecipeModel recipeModel = new RecipeModel('','','','',0,0,0,0,0,0);
              recipeModel =
                  RecipeModel.fromMap(element['recipe']);
              recipies.add(recipeModel);
              print(recipeModel.url);
            });
            setState(() {
              loading = false;
            });

            print("doing it");
            Navigator.push(context, MaterialPageRoute(builder: (context) => TotalRecipes(recipies)));
          } else {
            print("not doing it");
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: const Text('Go on!',
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20.0,
              )),
        ),
      ),
    );
  }
}