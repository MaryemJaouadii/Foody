import 'package:flutter/cupertino.dart';

class Ingredient{
  String ingrId;
  String ingrName;
  String catId;
  int calories;

  Ingredient(this.ingrId, this.ingrName, this.catId, this.calories);
}

class IngredientView extends ChangeNotifier{
  static List<Ingredient> selectedIngredients = [];
  Ingredient ingredient;
  bool isChecked;

  IngredientView(this.ingredient, {this.isChecked = false});

  setChecked(){
    isChecked=!isChecked;
    selectedIngredients.contains(ingredient) ? selectedIngredients.remove(ingredient) : selectedIngredients.add(ingredient);
   // notifyListeners();
  }

}


