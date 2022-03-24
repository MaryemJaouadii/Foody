
List<Ingredient> ingredients = [
  Ingredient("1","Milk","Dp"),Ingredient("2","Eggs","Dp"),Ingredient("3", "Tomato", "Veg"),
  Ingredient("4", "Pepper", "Spc"),Ingredient("5","Cheese","Dp"),Ingredient("6", "Potato", "Veg"),
  Ingredient("7", "Cumen", "Spc")
];

class Ingredient{
  String ingrId;
  String ingrName;
  String catId;

  Ingredient(this.ingrId, this.ingrName, this.catId);
}

class IngredientView{
  Ingredient ingredient;
  bool ingrIsChecked;

  IngredientView(this.ingredient, {this.ingrIsChecked = false});
}


