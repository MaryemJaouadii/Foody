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

  RecipeModel( this.url,  this.source,  this.image,  this.label, this.calories, this.totalWeight,this.totalTime,this.sugar, this.fat,this.protein);

  factory RecipeModel.fromMap(Map<String,dynamic> parsedJson) {
    return RecipeModel(
        parsedJson["url"], parsedJson["source"], parsedJson["image"], parsedJson["label"], parsedJson["calories"].round(),
        parsedJson["totalWeight"].round(), parsedJson["totalTime"].round(),
        parsedJson["totalNutrients"]["SUGAR"]["quantity"].round(),
        parsedJson["totalNutrients"]["FAT"]["quantity"].round(),
        parsedJson["totalNutrients"]["PROCNT"]["quantity"].round(),
    );
  }
}