import 'package:flutter/material.dart';
import 'package:foodproject/myData/CategoriesData.dart';
import 'package:foodproject/myData/IngredientsData.dart';
import 'package:foodproject/screens/cameraDetection.dart';
import 'package:searchfield/searchfield.dart';

import '../Models/Ingredient.dart';
import '../Widgets/CategoryView.dart';
import '../screens/useVoice.dart';

class SearchIngredients extends StatefulWidget {
  const SearchIngredients({Key? key}) : super(key: key);

  @override
  _SearchIngredientsState createState() => _SearchIngredientsState();
}

class _SearchIngredientsState extends State<SearchIngredients> {
  var myList = getAllIngredientsName();
  late TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
          child: SearchField(
            onSubmit: (e) {
              if (myList.contains(e)) {
                setState(() {
                  IngredientView.addToSelectedIngredientsByName(e);
                  searchController.clear();
                });
              }
            },
            controller: searchController,
            onSuggestionTap: (e) {
              setState(() {
                IngredientView.addToSelectedIngredientsByName(
                    e.item.toString());
                searchController.clear();
              });
            },
            suggestions: myList
                .map(
                  (e) => SearchFieldListItem<String>(e, item: e),
                )
                .toList(),
            searchInputDecoration: InputDecoration(
              // focusColor: kSecondColor,
              // focusedBorder: const OutlineInputBorder(
              //     borderSide: BorderSide(color: kSecondColor)),
              filled: true,
              fillColor: Color(0xFFF5F7FB),
              hintText: "Search...",
              prefixIcon: Icon(Icons.search),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => useVoice()));
                      },
                      icon: Icon(Icons.mic)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CameraDetection()));
                      },
                      icon: Icon(Icons.camera_alt))
                ],
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(style: BorderStyle.none, width: 0.1)),
            ),
          ),
        ),
        for (var i in categoriesData) CategoryView(i),
      ],
    );
  }
}
