import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Ingredient{
  String ingrId;
  String ingrName;
  String catId;
  int calories;

  Ingredient(this.ingrId, this.ingrName, this.catId, this.calories);
}

class IngredientView{
  Ingredient ingredient;
  IngredientView(this.ingredient);
  //IMPORTANT
  /*
  *You cannot access to [_selectedIngredients] and [_selectedIngredientsNames] directly
  *and you cannot use the method .add or .remove on their get methods
  *if you want to add or remove an item please use addToSelectedIngredients or removeFromSelectedIngredients
  *you  still can use other boolean methods as long as they don't modify the list
   */
  static List<Ingredient> _selectedIngredients = [];
  static List<String> _selectedIngredientsNames = [];

  static get selectedIngredients => UnmodifiableListView(_selectedIngredients);
  static get selectedIngredientsNames => UnmodifiableListView(_selectedIngredientsNames);

  static addToSelectedIngredients(Ingredient ingredient){
    if(!selectedIngredients.contains(ingredient)) {
      _selectedIngredients.add(ingredient);
      _selectedIngredientsNames.add(ingredient.ingrName.toLowerCase());
    }
  }

  static removeFromSelectedIngredients(Ingredient ingredient){
    if(selectedIngredients.contains(ingredient)) {
      _selectedIngredients.remove(ingredient);
      _selectedIngredientsNames.remove(ingredient.ingrName.toLowerCase());
    }
  }

  static removeFromSelectedIngredientsByName(String name){
    if(_selectedIngredientsNames.contains(name)) {
      _selectedIngredientsNames.remove(name);
      _selectedIngredients.removeWhere((element) => element.ingrName.toLowerCase()==name);
    }
  }

  setChecked(){
    if(selectedIngredients.contains(ingredient)) {
      _selectedIngredients.remove(ingredient);
      _selectedIngredientsNames.remove(ingredient.ingrName.toLowerCase());
    } else {
      _selectedIngredients.add(ingredient);
      _selectedIngredientsNames.add(ingredient.ingrName.toLowerCase());
    }
  }

 static String getTotalIngredients() {
    String tot='';
    for (var i in selectedIngredients)
      tot+=i.ingrName+ ' ';
    return tot;
  }

}


