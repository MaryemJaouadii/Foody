import 'package:flutter/material.dart';

class IngredientModel {
  int id;
  bool isExpanded;
  String headerName;
  String description;

  IngredientModel({
    this.id = 0,
    this.isExpanded = false,
    this.headerName = "",
    this.description = "",
  });
}

List<IngredientModel> generateItems(int numberOfItems) {
  return List<IngredientModel>.generate(numberOfItems, (int index) {
    return IngredientModel(
      id: index,
      headerName: 'Expansion Panel $index',
      description: 'This is body of item number $index',
    );
  });
}

List<ExpansionPanel> getExpansionPanels(List<IngredientModel> _items) {
  return _items.map<ExpansionPanel>((IngredientModel item) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(item.headerName),
        );
      },
      body: ListTile(
        title: Text(item.description),
      ),
      isExpanded: item.isExpanded,
    );
  }).toList();
}
