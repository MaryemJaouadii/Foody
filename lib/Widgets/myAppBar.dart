import 'package:flutter/material.dart';

import '../screens/Profile.dart';
import 'image_widget.dart';

class myAppBar extends StatelessWidget implements PreferredSizeWidget {
  var userName;



  myAppBar(this.userName);

  @override
  Widget build(BuildContext context) {


    Profile profile;



    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xFFFCFFFF),
      centerTitle: false,
      elevation: 0,
      toolbarHeight: 100,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: userName=='Maryem Jaouadi'? AssetImage('images/maryem2.jpg'): AssetImage('images/noprofilepic.jpg'),
                ),
                onTap:() {

                } ,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(
                    ModalRoute.of(context)?.settings.name == 'home'
                        ? "Hello "+userName
                        : userName,
                    style: const TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.w600)),
                Text(
                  ModalRoute.of(context)?.settings.name == 'home'
                      ? "What do you want to eat today ?"
                      : "Enjoy your stay!",
                  style: const TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}