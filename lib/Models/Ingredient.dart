
List<Ingredient> ingredients = [
  Ingredient("1","Milk","Dp"),Ingredient("2","Eggs","Dp"),Ingredient("3", "Tomato", "Veg"),
  Ingredient("4", "Pepper", "Spc"),Ingredient("5","Cheese","Dp"),Ingredient("6", "Potato", "Veg"),
  Ingredient("7", "Cumen", "Spc")
];

class Ingredient{
  String ingrId;
  String ingrName;
  String catId;
  //TODO calories in 100g

  Ingredient(this.ingrId, this.ingrName, this.catId);
}

class IngredientView{
  Ingredient ingredient;
  bool isChecked;

  IngredientView(this.ingredient, {this.isChecked = false});

  setChecked(bool checked){
    this.isChecked=checked;
  }

  bool getChecked() {
    return this.isChecked;
  }

  //
  // addIngredient()=>isChecked=true;
  //
  // removeIngredient()=>isChecked=false;
  // TODO I think tji fi classe recherche


}


