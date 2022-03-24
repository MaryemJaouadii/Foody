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

  List<Ingredient> getIngredients(){
    List<Ingredient> result = [];
    for (var element in ingredients) {
      if(element.catId == catId) {
        result.add(element);
      }
      }
    return result;
  }

}

class IngredientCategoryView {
  IngredientCategory category;
  bool isExpanded;

  IngredientCategoryView(this.category,
  {this.isExpanded = false});
  
}

List<IngredientCategoryView> generateItems() {
  List<IngredientCategoryView> myList = [];
    for (var element in categories) {
      myList.add(IngredientCategoryView(element));
    }
  return myList;
}

List<ExpansionPanel> getExpansionPanels(List<IngredientCategoryView> _items) {
  return _items.map<ExpansionPanel>((IngredientCategoryView item) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(item.category.catImg)),
            title: Text(item.category.catName,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          ),
        );
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            for (var i in item.category.getIngredients())
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ActionChip(label: Text(i.ingrName,
                  style: TextStyle(fontSize: 16.0),),
                  onPressed: () {  },),
              ),
          ],
        ),
      ),
      isExpanded: item.isExpanded,
    );
  }).toList();
}
