import 'package:flutter/material.dart';
import 'package:foodproject/Models/Ingredient.dart';
import '../myData/IngredientsData.dart';

class Category{
  late String catId;
  late String catImg;
  late String catName;

  Category(this.catId, this.catImg, this.catName);

  List<Ingredient> getIngredients(){
    List<Ingredient> result = [];
    for (var element in ingredientsData) {
      if(element.catId == catId) {
        result.add(element);
      }
    }
    return result;
  }

}


