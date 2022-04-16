import 'package:flutter/material.dart';
import 'package:foodproject/Models/recipe_model.dart';
import 'package:iconsax/iconsax.dart';

import '../Widgets/myAppBar.dart';
import '../Widgets/recipe_tile.dart';

class FavoriteRecipes extends StatefulWidget {
  static const String id = 'favorite';
  const FavoriteRecipes({Key? key}) : super(key: key);

  @override
  State<FavoriteRecipes> createState() => _FavoriteRecipesState();
}

class _FavoriteRecipesState extends State<FavoriteRecipes> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
                child: Align(child: Text("My Favorite Recipes " , style: TextStyle(fontSize: 18.0,fontFamily: 'Poppins',),), alignment: Alignment.centerLeft,),
              ),


                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child:

                  GridView(
                       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                           mainAxisSpacing: 30.0, maxCrossAxisExtent: 200.0),
                       shrinkWrap: true,
                       scrollDirection: Axis.vertical,
                       physics: ClampingScrollPhysics(),
                       children: List.generate(FavoriteRecipeView.favoriteRecipes.length, (index) {
                         return GridTile(
                             child: Stack(
                               children: [
                                 RecipieTile(
                                   FavoriteRecipeView.favoriteRecipes[index]

                                 ),





                                 Align(
                                   alignment: Alignment.topRight,
                                   child: Padding(
                                     padding: const EdgeInsets.all(15.0),
                                     child: CircleAvatar(
                                       radius: 14,
                                       backgroundColor:  FavoriteRecipeView.favoriteRecipes
                                           .contains(FavoriteRecipeView.favoriteRecipes[index])?  Color(0xFFfb3b60) :  Colors.black.withOpacity(0.3),
                                       child: IconButton(
                                         icon: Icon(Iconsax.heart, color: Colors.white,size: 14),
                                         onPressed: () {
                                           FavoriteRecipeView.removeFromFavoriteRecipes(FavoriteRecipeView.favoriteRecipes[index]);
                                           setState(() {
                                           });
                                         },
                                       ),
                                     ),
                                   ),
                                 ),



                               ],
                             ),




                         );
                       })),
                ),



            ],
          ),
        ),
      ),
    );
  }
}
