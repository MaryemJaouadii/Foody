import 'dart:collection';

class RecipeModel {
  String label ;
  String image;
  String source;
  String url;
  int calories;
  int totalWeight;
  int totalTime;
  int sugar;
  int fat;
  int protein;
  List ingredientLines;

  RecipeModel( this.url,  this.source,  this.image,  this.label, this.calories, this.totalWeight,this.totalTime,this.sugar, this.fat,this.protein, this.ingredientLines);

  factory RecipeModel.fromMap(Map<String,dynamic> parsedJson) {
    return RecipeModel(
        parsedJson["url"], parsedJson["source"], parsedJson["image"], parsedJson["label"], parsedJson["calories"].round(),
        parsedJson["totalWeight"].round(), parsedJson["totalTime"].round(),
        parsedJson["totalNutrients"]["SUGAR"]["quantity"].round(),
        parsedJson["totalNutrients"]["FAT"]["quantity"].round(),
        parsedJson["totalNutrients"]["PROCNT"]["quantity"].round(),
        parsedJson["ingredientLines"]

    );
  }

  String getLabel () { return this.label;}
  String getimage () { return this.image;}
  String getSource () { return this.source;}
  String getUrl () { return this.url;}
  int getCalories () { return this.calories;}
  int getTotalWeight () { return this.totalWeight;}
  int getTotalTime()  { return this.totalTime;}
  int getSugar () { return this.sugar;}
  int getFat()  { return this.fat;}
  int getProtein () { return this.protein;}
  List getIngredientsLine  (){ return this.ingredientLines;}


}



class FavoriteRecipeView {


  RecipeModel recipee ;
  FavoriteRecipeView(this.recipee) ;


  static List<RecipeModel> _favoriteRecipes = [];

  static get favoriteRecipes => UnmodifiableListView(_favoriteRecipes);


  static addToFavoriteRecipes(RecipeModel recipee){
    if(!favoriteRecipes.contains(recipee)) {
      _favoriteRecipes.add(recipee);
    }
  }

  static removeFromFavoriteRecipes(RecipeModel recipee){
    if(favoriteRecipes.contains(recipee)) {
      _favoriteRecipes.remove(recipee);
    }
  }



   setChecked(){
    if(favoriteRecipes.contains(recipee)) {
      _favoriteRecipes.remove(recipee);

    } else {
      _favoriteRecipes.add(recipee);

    }
  }








}