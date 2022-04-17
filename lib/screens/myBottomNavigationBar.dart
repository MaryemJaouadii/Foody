import 'package:flutter/material.dart';

import '../constants.dart';

class myBottomNavigationBar extends StatefulWidget {
  const myBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _myBottomNavigationBarState createState() => _myBottomNavigationBarState();
}

class _myBottomNavigationBarState extends State<myBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      iconSize: 30.0,
      unselectedItemColor: Colors.black45,
      selectedItemColor: kSecondColor,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.house), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
