import 'package:flutter/material.dart';
import 'package:foodproject/Models/Ingredient.dart';



List categories = [
  IngredientCategory("Dp","images/milk.png", "Eggs and Diary products"),
  IngredientCategory("Veg", "images/vegetable.png","Vegetables"),
  IngredientCategory("Spc",  "images/spices.png", "Spices, herbs and seeds"),
  IngredientCategory("Sg","images/sugar.png", "Sugar and chocolates"),
  IngredientCategory("Fr", "images/fruit.png","Fruits"),
  IngredientCategory("Fl",  "images/flour.png", "Flours and yeasts"),
  IngredientCategory("Oil", "images/oil.png", "Oils and fats")

];

class IngredientCategory{
  late String catId;
  late String catImg;
  late String catName;

  IngredientCategory(this.catId, this.catImg, this.catName);

  List<IngredientView> getIngredientsView(){
    List<IngredientView> result = [];
    for (var element in ingredients) {
      if(element.catId == catId) {
        result.add(IngredientView(element));
      }
    }
    return result;
  }

}


