import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodproject/Widgets/myAppBar.dart';

import '../Widgets/SearchIngredients.dart';

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
          children: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SearchIngredients(),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Categories",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
            )
          ],
        ),
      ),
    );
  }
}
