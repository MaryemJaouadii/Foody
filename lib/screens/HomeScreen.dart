import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodproject/Widgets/myAppBar.dart';
import 'package:foodproject/screens/Profile.dart';
import 'package:foodproject/screens/favoriteRecipes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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




  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  late String username="";


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
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: SearchIngredients(),
          ),
          SearchRecipeButton()
        ],
      ),
    ),
    const FavoriteRecipes(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  myAppBar(username),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          iconSize: 30.0,
          unselectedItemColor: Colors.black45,
          selectedItemColor: kPrimaryColor,
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
