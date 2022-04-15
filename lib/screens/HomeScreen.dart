import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodproject/Widgets/myAppBar.dart';
import 'package:foodproject/screens/totalRecipes.dart';

import '../Models/recipe_model.dart';
import '../Widgets/SearchIngredients.dart';
import 'package:http/http.dart' as http;
import '../Models/Ingredient.dart';
import 'dart:convert';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  static const String id = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<RecipeModel> recipies = new List<RecipeModel>.empty(growable: true);
  bool _loading = false;
  String applicationId = "227f981e";
  String applicationKey = "bc3ecb377a931c694b6b49412d31e012";


  String totalIngredients =IngredientView.getTotalIngredients();



  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const myAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0,
        unselectedItemColor: Colors.black45,
        selectedItemColor: const Color(0xff44cb7f),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.house,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.query_stats), label: "Stats"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SearchIngredients(),
            ),

            Container(
                decoration: BoxDecoration(
                    color: Color(0xFFEA676A),
                    borderRadius: BorderRadius.circular(15.0)),
                child: OutlinedButton(
                    onPressed: () async {

                      String tot='';
                      for (var i in IngredientView.selectedIngredients)
                        tot+=i.ingrName+ ' ';
                      print(tot);

                      if (IngredientView.selectedIngredients.isNotEmpty) {
                        setState(() {
                          _loading = true;
                        });
                        recipies = new List<RecipeModel>.empty(growable: true);
                        String url =
                            "https://api.edamam.com/search?q=${tot}&app_id=227f981e&app_key=bc3ecb377a931c694b6b49412d31e012";
                        var response = await http.get(Uri.parse(url)
                        );
                        print(" $response this is response");
                        Map<String, dynamic> jsonData = jsonDecode(response.body) ;
                        print("this is json Data $jsonData");
                        jsonData["hits"]?.forEach((element) {
                          print(element.toString());
                          RecipeModel recipeModel = new RecipeModel('','','','','','','',{},{},{});
                          recipeModel =
                              RecipeModel.fromMap(element['recipe']);
                          recipies.add(recipeModel);
                          print(recipeModel.url);
                        });
                        setState(() {
                          _loading = false;
                        });

                        print("doing it");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TotalRecipes(recipies)));
                      } else {
                        print("not doing it");
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: const Text('Go on!',
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0,
                          )),
                    )))
          ],
        ),
      ),
    );
  }
}
