import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';


class HomeScreen extends StatefulWidget {
  static const String id='home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var myList = ['ABC', 'CDE', 'EFG','HIJ'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  color: Colors.grey, //remove this when you add image.
                ),
              ),
            )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.query_stats),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.monitor_heart),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),

        ],
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
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                hintText: "Have a dish in mind?",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          )
        ],
      ),
      
    );
  }
}
