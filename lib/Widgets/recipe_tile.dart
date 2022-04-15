import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../screens/moreInfo.dart';
import '../screens/recipe_view.dart';
import 'package:url_launcher/url_launcher.dart';


class RecipieTile extends StatefulWidget {
  final String title, desc, imgUrl, url, calories , totalWeight, totalTime ;
  final Object energy, fat,protein;

  RecipieTile(this.title, this.desc, this.imgUrl, this.url, this.calories, this.totalWeight,this.totalTime,this.energy, this.fat,this.protein);

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
              _launchURL(widget.url);
            } else {
              print(widget.url + " this is what we are going to see");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MoreInfo(
                          widget.title, widget.desc, widget.imgUrl, widget.url, widget.calories, widget.totalWeight,widget.totalTime,widget.energy, widget.fat,widget.protein
                      )));
            }
          },
          child: Container(
            margin: EdgeInsets.all(8),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: <Widget>[
                Image.network(
                  widget.imgUrl,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 200,
                  //alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white30, Colors.white],
                          begin: FractionalOffset.centerRight,
                          end: FractionalOffset.centerLeft)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),


                        Text(
                          widget.desc,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black54,
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