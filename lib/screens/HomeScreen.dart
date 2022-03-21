import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class HomeScreen extends StatefulWidget {
  static const String id='home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var myList = ['ABC', 'CDE', 'EFG','HIJ'];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCFFFF),
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 100,
            ),
            Text("Hello Peter,", style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w600 )),
            Text("What do you want to eat today ?", style: TextStyle(color: Colors.black45,
                fontWeight: FontWeight.w500,
                fontSize: 14),),
            SizedBox(
              height: 100,
            ),
          ],
        ),
          /*
          * %%%%%%%%%%%%%%%%%%%%%%%%%%%%
          * Profile Picture
          * %%%%%%%%%%%%%%%%%%%%%%%%%%%%
          */
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue, //remove this when you add image.
                ),
              ),
            )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0,
        unselectedItemColor: Colors.black45,
        selectedItemColor: const Color(0xff44cb7f),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.house,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.query_stats),label: "Stats"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
            child: SearchField(
              suggestions: myList.map(
                  (e) => SearchFieldListItem(e),
                     ).toList(),
              searchInputDecoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF5F7FB),
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                hintText: "Have a dish in mind?",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(style: BorderStyle.none, width: 0.0)
                ),
              ),
            ),
          )
        ],
      ),
      
    );
  }
}
