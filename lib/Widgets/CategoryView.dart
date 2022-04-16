import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodproject/myData/IngredientsData.dart';
import '../Models/Ingredient.dart';
import '../Models/Category.dart';

class CategoryView extends StatefulWidget {
  late Category category;

  CategoryView(this.category);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    List<IngredientView> ingredients =
        widget.category.getIngredients().map((e) => IngredientView(e)).toList();

    return SingleChildScrollView(
      child: ExpansionTile(
        title: Text(widget.category.catName,
            style:
                const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(widget.category.catImg),
        ),
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: Wrap(children: [
              for (var i in ingredients)
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 3.0),
                    decoration: BoxDecoration(
                        color: IngredientView.selectedIngredients
                                .contains(i.ingredient)
                            ? Color(0xFFfb3b60)
                            : Colors.white,
                        border: Border.all(
                            color: IngredientView.selectedIngredients
                                .contains(i.ingredient)
                                ? Colors.white
                                : Color(0xFFfb3b60) ,
                        ),
                        borderRadius: BorderRadius.all( Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                      child: Text(i.ingredient.ingrName,
                          style: TextStyle(fontSize: 14.0,
                              color:IngredientView.selectedIngredients
                                  .contains(i.ingredient)
                                  ? Colors.white
                                  : Color(0xFFfb3b60) )),
                    ),
                  ),
                  onTap: () {
                    i.setChecked();
                    setState(() {});
                  },
                )
            ]),
          ),
        ],
      ),
    );
  }
}
