import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodproject/screens/totalRecipes.dart';
import 'package:http/http.dart' as http;

import '../Models/Ingredient.dart';
import '../Models/recipe.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SearchRecipeButton extends StatefulWidget {
  @override
  State<SearchRecipeButton> createState() => _SearchRecipeButtonState();
}

class _SearchRecipeButtonState extends State<SearchRecipeButton> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  late String disease = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentUser();
    getUsers();
  }

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

  void getUsers() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc["email"] == loggedInUser.email) {
          disease = doc["disease"];
          print('recipe button ' + doc["disease"]);
        }
      });
    });
  }

  bool loading = false;
  List<RecipeModel> recipies = new List<RecipeModel>.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20.0)),
      child: OutlinedButton(
        onPressed: () async {
          print("entered in button");
          String tot = '';

          if (IngredientView.selectedIngredients.isNotEmpty) {
            setState(() {
              loading = true;
            });
            tot = IngredientView.selectedIngredientsNames.join(' ');
            print("**********************");
            print(tot);
            recipies = new List<RecipeModel>.empty(growable: true);
            String url = disease == 'Diabetes'
                ? "https://api.edamam.com/search?q=${tot}&app_id=227f981e&app_key=bc3ecb377a931c694b6b49412d31e012&health=alcohol-free&pork-free&sugar-free"
                : disease == 'Celiac Disease (Gluten intolerance)'
                    ? "https://api.edamam.com/search?q=${tot}&app_id=227f981e&app_key=bc3ecb377a931c694b6b49412d31e012&health=alcohol-free&pork-free&Gluten-Free"
                    : disease == 'Lactose Intolerance'
                        ? "https://api.edamam.com/search?q=${tot}&app_id=227f981e&app_key=bc3ecb377a931c694b6b49412d31e012&health=alcohol-free&Dairy-Free&pork-free&foodCategory-is-not-equal-to-Dairy"
                        : disease == 'Tyramine Intolerance'
                            ? "https://api.edamam.com/search?q=${tot}&app_id=227f981e&app_key=bc3ecb377a931c694b6b49412d31e012&health=alcohol-free&pork-free&foodCategory-is-not-equal-to-Cheese"
                            : disease == 'Histamine Intolerance'
                                ? "https://api.edamam.com/search?q=${tot}&app_id=227f981e&app_key=bc3ecb377a931c694b6b49412d31e012&health=alcohol-free&pork-free&food-is-not-equal-to-tomatoes"
                                : "https://api.edamam.com/search?q=${tot}&app_id=227f981e&app_key=bc3ecb377a931c694b6b49412d31e012&health=alcohol-free&pork-free";

            var response = await http.get(Uri.parse(url));
            print(" $response this is response");
            Map<String, dynamic> jsonData = jsonDecode(response.body);
            print("this is json Data $jsonData");
            jsonData["hits"]?.forEach((element) {
              print(element.toString());
              RecipeModel recipeModel =
                  new RecipeModel('', '', '', '', 0, 0, 0, 0, 0, 0, []);
              recipeModel = RecipeModel.fromMap(element['recipe']);
              recipies.add(recipeModel);
              print(recipeModel.url);
            });
            setState(() {
              loading = false;
            });

            print("doing it");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TotalRecipes(recipies)));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.grey.withOpacity(0.7),
              content: const Text(
                'Please enter at least one ingredient !',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ));
            print("not doing it");
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text('Go on!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              )),
        ),
      ),
    );
  }
}
