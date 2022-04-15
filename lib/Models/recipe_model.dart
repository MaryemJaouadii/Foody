class RecipeModel {
  String label ;
  String image;
  String source;
  String url;
  String calories;
  String totalWeight;
  String totalTime;
  Object energy;
  Object fat;
  Object protein;

  RecipeModel( this.url,  this.source,  this.image,  this.label, this.calories, this.totalWeight,this.totalTime,this.energy, this.fat,this.protein);

  factory RecipeModel.fromMap(Map<String,dynamic> parsedJson) {
    return RecipeModel(
        parsedJson["url"], parsedJson["source"], parsedJson["image"], parsedJson["label"], parsedJson["calories"].round().toString(),
        parsedJson["totalWeight"].round().toString(), parsedJson["totalTime"].round().toString(),
        parsedJson["totalNutrients"]["ENERC_KCAL"],
        parsedJson["totalNutrients"]["FAT"],
        parsedJson["totalNutrients"]["PROCNT"],
    );
  }
}