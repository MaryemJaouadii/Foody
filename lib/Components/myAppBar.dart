import 'package:flutter/material.dart';

class myAppBar extends StatelessWidget implements PreferredSizeWidget{
  const myAppBar({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          Text("Hello User,",
              style: TextStyle(
                  color: Colors.black45, fontWeight: FontWeight.w600)),
          Text(
            "What do you want to eat today ?",
            style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}