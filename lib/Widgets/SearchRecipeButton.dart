import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodproject/screens/totalRecipes.dart';
import 'package:http/http.dart' as http;

import '../Models/Ingredient.dart';
import '../Models/recipe_model.dart';
import '../constants.dart';

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
          //gradient: kGradientColor,
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(15.0)),
      child: OutlinedButton(
        onPressed: () async {
          print("entered in button");
          String tot = '';

          if (IngredientView.selectedIngredients.isNotEmpty) {
            setState(() {
              loading = true;
            });
            tot = IngredientView.selectedIngredientsNames.join(' ');
            print("**********************");
            print(tot);
            recipies = new List<RecipeModel>.empty(growable: true);
            String url =
                "https://api.edamam.com/search?q=${tot}&app_id=227f981e&app_key=bc3ecb377a931c694b6b49412d31e012";
            var response = await http.get(Uri.parse(url));
            print(" $response this is response");
            Map<String, dynamic> jsonData = jsonDecode(response.body);
            print("this is json Data $jsonData");
            jsonData["hits"]?.forEach((element) {
              print(element.toString());
              RecipeModel recipeModel =
                  new RecipeModel('', '', '', '', 0, 0, 0, 0, 0, 0, []);
              recipeModel = RecipeModel.fromMap(element['recipe']);
              recipies.add(recipeModel);
              print(recipeModel.url);
            });
            setState(() {
              loading = false;
            });

            print("doing it");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TotalRecipes(recipies)));
          } else {
            print("not doing it");
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text('Go on!',
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
