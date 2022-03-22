import 'package:flutter/material.dart';
import '../Models/CategoryModel.dart';

class SearchIngredients extends StatefulWidget {
  const SearchIngredients({Key? key}) : super(key: key);

  @override
  _SearchIngredientsState createState() => _SearchIngredientsState();
}

class _SearchIngredientsState extends State<SearchIngredients> {
  final List<CategoryModel> _items = generateItems(2,"Milk",['one','two']);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Search by ingredients",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
          ),
        ),
        ExpansionPanelList(
          animationDuration: Duration(milliseconds: 1000),
          children: getExpansionPanels(_items),
          expansionCallback: (panelIndex, isExpanded) {
            _items[panelIndex].isExpanded = !isExpanded;
            setState(() {});
          },
        ),
      ],
    );
  }
}
