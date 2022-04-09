import 'package:flutter/material.dart';
import '../Widgets/CategoryView.dart';
import 'package:foodproject/myData/CategoriesData.dart';
import 'package:searchfield/searchfield.dart';

class SearchIngredients extends StatefulWidget {
  const SearchIngredients({Key? key}) : super(key: key);

  @override
  _SearchIngredientsState createState() => _SearchIngredientsState();
}

class _SearchIngredientsState extends State<SearchIngredients> {
 // final List<IngredientCategoryView> _items = generateItems();
  var myList = ['ABC', 'CDE', 'EFG', 'HIJ'];


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
        Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
          child: SearchField(
            suggestions: myList
                .map(
                  (e) => SearchFieldListItem(e),
            )
                .toList(),
            searchInputDecoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF5F7FB),
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              hintText: "Search by recipe, ingredient, dish...",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                  BorderSide(style: BorderStyle.none, width: 0.0)),
            ),
          ),
        ),
        for(var i in categoriesData)
        CategoryView(i),
      ],
    );
  }
}
