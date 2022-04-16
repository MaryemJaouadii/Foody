import 'package:flutter/material.dart';
import 'package:foodproject/screens/favoriteRecipes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:path/path.dart';

class myAppBar extends StatelessWidget implements PreferredSizeWidget {
  const myAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false ,
      backgroundColor: Color(0xFFFCFFFF),
      centerTitle: false,
      elevation: 0,
      toolbarHeight: 100,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/6.jpg'),
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
                        ? "Hello Shayma,"
                        : "Shayma Trad",
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
      /*
          * %%%%%%%%%%%%%%%%%%%%%%%%%%%%
          * Profile Picture
          * %%%%%%%%%%%%%%%%%%%%%%%%%%%%
          */
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: IconButton(
            icon: Icon(
              Iconsax.heart,
             color: ModalRoute.of(context)?.settings.name == 'favorite'? Color(0xFFfb3b60): Colors.black45,
            ),
            onPressed: () {
              ModalRoute.of(context)?.settings.name != 'favorite'? Navigator.pushNamed(context, FavoriteRecipes.id): null;
            },
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}
