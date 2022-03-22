import 'package:flutter/material.dart';

List ingredientCategories = ['Oeufs et produits latiers' , 'Légumes' , 'Épices, herbes et graines', 'Sucre et chocolats' , 'Fruits' , 'Farines et levures' , 'Huiles et graisses'];

class CategoryModel {
  int id;
  bool isExpanded;
  String categoryName;
  List<String> ingredients;

  CategoryModel({
    this.id = 0,
    this.isExpanded = false,
    this.categoryName = "",
    required this.ingredients ,
  });
}

List<CategoryModel> generateItems(int numberOfItems, String itemHeader, List<String> itemContent) {
  return List<CategoryModel>.generate(numberOfItems, (int index) {
    return CategoryModel(
      id: index,
      categoryName: itemHeader,
      ingredients: itemContent,
    );
  });
}

List<ExpansionPanel> getExpansionPanels(List<CategoryModel> _items) {
  return _items.map<ExpansionPanel>((CategoryModel item) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(item.categoryName),
        );
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            for (var i in item.ingredients ) Chip(label: Text(i),),
          ],
        ),
      ),
      isExpanded: item.isExpanded,
    );
  }).toList();
}
