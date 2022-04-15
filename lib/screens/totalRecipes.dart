import 'package:flutter/material.dart';
import 'package:foodproject/Models/Ingredient.dart';
import 'package:foodproject/Models/recipe_model.dart';
import '../Widgets/recipe_tile.dart';

class TotalRecipes extends StatefulWidget {


  List<RecipeModel> recipies = new List<RecipeModel>.empty(growable: true);


   TotalRecipes(this.recipies);

  @override
  State<TotalRecipes> createState() => _TotalRecipesState();
}

class _TotalRecipesState extends State<TotalRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children: [


            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
              child: Align(child: Text("Best recipes with "+ IngredientView.getTotalIngredients() + ':', style: TextStyle(fontSize: 20.0,),), alignment: Alignment.centerLeft,),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 10.0, maxCrossAxisExtent: 200.0),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  children: List.generate(widget.recipies.length, (index) {
                    return GridTile(
                        child: RecipieTile(
                          widget.recipies[index].source,
                          widget.recipies[index].label,
                          widget.recipies[index].image,
                          widget.recipies[index].url,
                          widget.recipies[index].calories,
                          widget.recipies[index].totalWeight,
                          widget.recipies[index].totalTime,
                          widget.recipies[index].sugar,
                          widget.recipies[index].fat,
                          widget.recipies[index].protein,

                        ));
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
