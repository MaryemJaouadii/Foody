import 'package:flutter/material.dart';

import 'LoginTab.dart';
import 'RegisterTab.dart';


class Join extends StatefulWidget {
  static const String id='join';
  const Join({Key? key}) : super(key: key);

  @override
  _JoinState createState() => _JoinState();
}

class _JoinState extends State<Join> {



  @override
  Widget build(BuildContext context) {


    int _selectedIndex=0;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          backgroundColor: Colors.white,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12),
            )) ,
          title: Center(
            child: Image(
              height: 200,
              width: 200,
              image: AssetImage('images/logonoir.png'),
            ),
          ),


          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            labelStyle: TextStyle(fontSize: 15),


            padding: EdgeInsets.all( 5.0),
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;

              });
            },

            tabs: <Widget>[
              Tab(
                text: "Log-in",
              ),
              Tab(
                text: "Sign-up",
              ),

            ],
          ),

        ),


          body: TabBarView(



            children: <Widget>[

              LoginTab(),
              RegisterTab(),


            ],
          ),


      ),
    );
  }
}