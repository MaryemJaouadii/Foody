import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/IngredientCategory.dart';

class IngredientCategoryView extends StatefulWidget {
  late IngredientCategory category;

  IngredientCategoryView(this.category);


  @override
  _IngredientCategoryViewState createState() => _IngredientCategoryViewState();
}

class _IngredientCategoryViewState extends State<IngredientCategoryView> {
bool selected = false;
  @override
  Widget build(BuildContext context) {

    return ExpansionTile(
      title: Text(widget.category.catName,style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(widget.category.catImg),
    ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Row(

            children: [
              for (var i in widget.category.getIngredientsView())
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 3.0),
                    decoration: BoxDecoration(
                      color: i.isChecked ? Colors.red : Colors.blue,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 5.0),
                      child: Text(i.ingredient.ingrName, style: TextStyle(fontSize: 14.0)),
                    ),
                  ),
                    onTap: (){
                      print(i.isChecked.toString());

                      print(i.isChecked.toString());
                    setState(() {

                    });
                    },
                ),
            ],
          ),
        )

      ],


    );
  }
}
