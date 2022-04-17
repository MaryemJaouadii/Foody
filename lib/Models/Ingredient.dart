import 'dart:collection';

import '../myData/IngredientsData.dart';

class Ingredient {
  String ingrName;
  String catId;

  Ingredient(this.ingrName, this.catId);
}

class IngredientView {
  Ingredient ingredient;
  IngredientView(this.ingredient);
  //IMPORTANT
  /*
  *you cannot use the method .add or .remove on selectedIngredients get methods (9olli 3lech taw n9olek 3lech xD)
  *if you want to add or remove an item please use addToSelectedIngredients or removeFromSelectedIngredients
  *you  still can use other boolean methods as long as they don't modify the list
   */
  static List<Ingredient> _selectedIngredients = [];
  static List<String> _selectedIngredientsNames = [];

  static get selectedIngredients => UnmodifiableListView(_selectedIngredients);
  static get selectedIngredientsNames =>
      UnmodifiableListView(_selectedIngredientsNames);

  static addToSelectedIngredients(Ingredient ingredient) {
    if (!selectedIngredients.contains(ingredient)) {
      _selectedIngredients.add(ingredient);
      _selectedIngredientsNames.add(ingredient.ingrName.toLowerCase());
    }
  }

  static addToSelectedIngredientsByName(String name) {
    if (!selectedIngredientsNames.contains(name)) {
      _selectedIngredients.add(ingredientsData
          .firstWhere((element) => element.ingrName.toLowerCase() == name));
      _selectedIngredientsNames.add(name);
      print(
          "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\nadded successfully\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    }
  }

  static removeFromSelectedIngredients(Ingredient ingredient) {
    if (selectedIngredients.contains(ingredient)) {
      _selectedIngredients.remove(ingredient);
      _selectedIngredientsNames.remove(ingredient.ingrName.toLowerCase());
    }
  }

  static removeFromSelectedIngredientsByName(String name) {
    if (_selectedIngredientsNames.contains(name)) {
      _selectedIngredientsNames.remove(name);
      _selectedIngredients
          .removeWhere((element) => element.ingrName.toLowerCase() == name);
    }
  }

  setChecked() {
    if (selectedIngredients.contains(ingredient)) {
      _selectedIngredients.remove(ingredient);
      _selectedIngredientsNames.remove(ingredient.ingrName.toLowerCase());
    } else {
      _selectedIngredients.add(ingredient);
      _selectedIngredientsNames.add(ingredient.ingrName.toLowerCase());
    }
  }

  static String getTotalIngredients() => selectedIngredientsNames.join(" ");
}
