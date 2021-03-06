import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../Models/recipe.dart';
import '../screens/moreInfo.dart';
import '../screens/recipe_view.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipieTile extends StatefulWidget {

  final RecipeModel recipe;

  // final String title, desc, imgUrl, url;
  // final int calories, totalWeight, totalTime, sugar, fat, protein;
  // final List ingredientLines;

  RecipieTile(

      this.recipe

      // this.title,
      // this.desc,
      // this.imgUrl,
      // this.url,
      // this.calories,
      // this.totalWeight,
      // this.totalTime,
      // this.sugar,
      // this.fat,
      // this.protein,
      // this.ingredientLines

      );

  @override
  _RecipieTileState createState() => _RecipieTileState();
}

class _RecipieTileState extends State<RecipieTile> {


  _launchURL(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (kIsWeb) {
              _launchURL(widget.recipe.url);
            } else {
              print(widget.recipe.url + " this is what we are going to see");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MoreInfo(
                          widget.recipe)));
            }
          },
          child: Container(
            margin: EdgeInsets.all(8),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.recipe.image,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                     /* gradient: LinearGradient(
                          colors: [Colors.white30, Colors.white],
                          begin: FractionalOffset.centerRight,
                          end: FractionalOffset.centerLeft)*/
                    
                    color: Colors.black.withOpacity(0.4)
                  
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.recipe.label,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        Text(
                          '1 Bowl ('+widget.recipe.totalWeight.toString()+' g)',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
