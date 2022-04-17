import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodproject/screens/recipe_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../Models/recipe.dart';
import '../Widgets/roundedButton.dart';
import '../constants.dart';

class MoreInfo extends StatefulWidget {

  final RecipeModel recipe;



  // final String title, desc, imgUrl, url;
  // final int calories, totalWeight, totalTime, sugar, fat, protein;
  // final List ingredientLines;

  MoreInfo(
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
      this.recipe

      );

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  late List<FoodData> _sugarData;
  late List<FoodData> _fatData;
  late List<FoodData> _proteinData;
  late List<FoodData> _allData;

  @override
  void initState() {
    _sugarData = getChartData('sugar')!;
    _fatData = getChartData('fat')!;
    _proteinData = getChartData('protein')!;
    _allData = getChartData('all')!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                widget.recipe.image,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.60,
            //maxChildSize: 0.7,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[

                      ListView(
                        padding: const EdgeInsets.all(20),
                        controller: scrollController,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width -50,
                                child: Text(
                                  widget.recipe.label,

                                  style: kFoodHealthDetailsStyle.copyWith(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '1 Bowl (' +
                                    widget.recipe.totalWeight.toString() +
                                    ' g)',
                                style: kFoodHealthDetailsStyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.3),
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text('sugar', style: kFoodHealthDetailsStyle),
                                  Container(
                                    height: 90, // height of the Container widget
                                    width: 80, // width of the Container widget
                                    child: SfCircularChart(
                                      palette: <Color>[
                                        Color(0xFF2fb668),
                                        Color(0xFFb8efd0)
                                      ],
                                      // legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.scroll),
                                      series: <CircularSeries>[
                                        DoughnutSeries<FoodData, String>(
                                          dataSource: _sugarData,
                                          xValueMapper: (FoodData data, _) =>
                                              data.content,
                                          yValueMapper: (FoodData data, _) =>
                                              data.quantity,
                                          //dataLabelSettings: DataLabelSettings(isVisible: true)
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(_sugarData[0].quantity.toString() + ' g',
                                      style: kFoodHealthDetailsStyle),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('fat', style: kFoodHealthDetailsStyle),
                                  Container(
                                    height: 90, // height of the Container widget
                                    width: 80, // width of the Container widget
                                    child: SfCircularChart(
                                      palette: <Color>[
                                        Color(0xFFf84f49),
                                        Color(0xFFf3cfcc)
                                      ],
                                      // legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.scroll),
                                      series: <CircularSeries>[
                                        DoughnutSeries<FoodData, String>(
                                          dataSource: _fatData,
                                          xValueMapper: (FoodData data, _) =>
                                              data.content,
                                          yValueMapper: (FoodData data, _) =>
                                              data.quantity,
                                          //dataLabelSettings: DataLabelSettings(isVisible: true)
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(_fatData[0].quantity.toString() + ' g',
                                      style: kFoodHealthDetailsStyle),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('protein', style: kFoodHealthDetailsStyle),
                                  Container(
                                    height: 90, // height of the Container widget
                                    width: 80, // width of the Container widget
                                    child: SfCircularChart(
                                      palette: <Color>[
                                        Color(0xFFfd9c26),
                                        Color(0xFFffe9b1)
                                      ],
                                      // legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.scroll),
                                      series: <CircularSeries>[
                                        DoughnutSeries<FoodData, String>(
                                          dataSource: _proteinData,
                                          xValueMapper: (FoodData data, _) =>
                                              data.content,
                                          yValueMapper: (FoodData data, _) =>
                                              data.quantity,
                                          //dataLabelSettings: DataLabelSettings(isVisible: true)
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(_proteinData[0].quantity.toString() + ' g',
                                      style: kFoodHealthDetailsStyle),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('calories',
                                      style: kFoodHealthDetailsStyle),
                                  Container(
                                    height: 90, // height of the Container widget
                                    width: 80, // width of the Container widget
                                    child: SfCircularChart(
                                      palette: <Color>[
                                        Color(0xFF2fb668),
                                        Color(0xFFf84f49),
                                        Color(0xFFfd9c26)
                                      ],
                                      // legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.scroll),
                                      series: <CircularSeries>[
                                        DoughnutSeries<FoodData, String>(
                                          dataSource: _allData,
                                          xValueMapper: (FoodData data, _) =>
                                              data.content,
                                          yValueMapper: (FoodData data, _) =>
                                              data.quantity,
                                          //dataLabelSettings: DataLabelSettings(isVisible: true)
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(widget.recipe.calories.toString() + ' Kkl',
                                      style: kFoodHealthDetailsStyle),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'What will you need:',
                                style: kFoodHealthDetailsStyle.copyWith(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              for (var i in widget.recipe.ingredientLines)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    i,
                                    style: kFoodHealthDetailsStyle.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                            ],
                          ),
                          RoundedButton(
                            'See Full Recipe',
                              () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RecipeView(widget.recipe.url)),
                                );


                              }
                          ),
                        ],
                      ),

                      Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor:  FavoriteRecipeView.favoriteRecipes
                              .contains(widget.recipe)?  kPrimaryColor :  Colors.black.withOpacity(0.3),
                          child: IconButton(
                            icon: Icon(Iconsax.heart, color: Colors.white,size: 20),
                            onPressed: () {

                              setState(() {

                              });

                              if(FavoriteRecipeView.favoriteRecipes.contains(widget.recipe)) {
                                FavoriteRecipeView.removeFromFavoriteRecipes(widget.recipe);

                              } else {
                                FavoriteRecipeView.addToFavoriteRecipes(widget.recipe);

                              }
                              setState(() {});
                            },
                          ),
                        ),
                      ),


                    ],
                  ));
            },
          ),
        ],
      ),
    );
  }

  List<FoodData>? getChartData(String axe) {
    final List<FoodData> sugarData = [
      FoodData('sugar', ((widget.recipe.sugar / widget.recipe.totalWeight) * 100).round()),
      FoodData(
          'none', 100 - ((widget.recipe.sugar / widget.recipe.totalWeight) * 100).round()),
    ];
    final List<FoodData> fatData = [
      FoodData('fat', ((widget.recipe.fat / widget.recipe.totalWeight) * 100).round()),
      FoodData('none', 100 - ((widget.recipe.fat / widget.recipe.totalWeight) * 100).round()),
    ];
    final List<FoodData> proteinData = [
      FoodData(
          'Protein', ((widget.recipe.protein / widget.recipe.totalWeight) * 100).round()),
      FoodData(
          'none', 100 - ((widget.recipe.protein / widget.recipe.totalWeight) * 100).round()),
    ];

    final List<FoodData> allData = [
      FoodData('sugar', widget.recipe.sugar),
      FoodData('fat', widget.recipe.fat),
      FoodData('Protein', widget.recipe.protein),
    ];
    return axe == 'sugar'
        ? sugarData
        : axe == 'fat'
            ? fatData
            : axe == 'protein'
                ? proteinData
                : allData;
  }
}

class FoodData {
  FoodData(this.content, this.quantity);
  final String content;
  final int quantity;
}
