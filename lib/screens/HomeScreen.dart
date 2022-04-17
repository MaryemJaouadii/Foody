import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodproject/Widgets/myAppBar.dart';
import 'package:foodproject/screens/Profile.dart';
import 'package:foodproject/screens/favoriteRecipes.dart';

import '../Models/Ingredient.dart';
import '../Widgets/SearchIngredients.dart';
import '../Widgets/SearchRecipeButton.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String applicationId = "227f981e";
  String applicationKey = "bc3ecb377a931c694b6b49412d31e012";
  String totalIngredients = IngredientView.getTotalIngredients();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _children = [
    SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: SearchIngredients(),
          ),
          SearchRecipeButton()
        ],
      ),
    ),
    FavoriteRecipes(),
    Profile(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const myAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          iconSize: 30.0,
          unselectedItemColor: Colors.black45,
          selectedItemColor: kSecondColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.house), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorites"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: _children[_selectedIndex]);
  }
}
