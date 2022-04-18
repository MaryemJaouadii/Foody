import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodproject/Models/Ingredient.dart';
import 'package:foodproject/Models/recipe.dart';
import 'package:foodproject/constants.dart';
import 'package:iconsax/iconsax.dart';

import '../Widgets/myAppBar.dart';
import '../Widgets/recipe_tile.dart';

class TotalRecipes extends StatefulWidget {
  List<RecipeModel> recipies = new List<RecipeModel>.empty(growable: true);

  TotalRecipes(this.recipies);

  @override
  State<TotalRecipes> createState() => _TotalRecipesState();
}

class _TotalRecipesState extends State<TotalRecipes> {
  //List<RecipeModel> favoriteRecipes = new List<RecipeModel>.empty(growable: true);

  @override
  void initState() {
    setState(() {});
    super.initState();
    getCurrentUser();
    getUsers();
  }
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  late String username='';





  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        //print('home screeeeeeeeeen'+loggedInUser.email.toString());
        //username= await _firestore.collection('Users').snapshots();
      }
    } catch (e) {
      print(e);
    }
  }

  void getUsers()async{
    await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {

        if (doc["email"]==loggedInUser.email){
          username=doc["username"];
          print(doc["username"]);
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:myAppBar(username),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 10, bottom: 8.0),
                child: Align(
                  child: Text(
                    "Best recipes with " +
                        IngredientView.getTotalIngredientsMessage() +
                        ':',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: GridView(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 30.0, maxCrossAxisExtent: 200.0),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    children: List.generate(widget.recipies.length, (index) {
                      return GridTile(
                          child: Stack(
                        children: [
                          RecipieTile(widget.recipies[index]),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: FavoriteRecipeView
                                        .favoriteRecipes
                                        .contains(widget.recipies[index])
                                    ? kPrimaryColor
                                    : Colors.black.withOpacity(0.3),
                                child: IconButton(
                                  icon: Icon(Iconsax.heart,
                                      color: Colors.white, size: 14),
                                  onPressed: () {
                                    setState(() {});

                                    if (FavoriteRecipeView.favoriteRecipes
                                        .contains(widget.recipies[index])) {
                                      FavoriteRecipeView
                                          .removeFromFavoriteRecipes(
                                              widget.recipies[index]);
                                    } else {
                                      FavoriteRecipeView.addToFavoriteRecipes(
                                          widget.recipies[index]);
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ));
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
