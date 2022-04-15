import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class MoreInfo extends StatefulWidget {

  final String title, desc, imgUrl, url, calories , totalWeight, totalTime ;
  final Object energy, fat,protein;

  MoreInfo(this.title, this.desc, this.imgUrl, this.url, this.calories, this.totalWeight,this.totalTime,this.energy, this.fat,this.protein);


  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  late List<FoodData> _carbsData;
  late List<FoodData> _fatData;
  late List<FoodData> _proteinData;
  late List<FoodData> _allData;

  @override
  void initState() {
    _carbsData=getChartData('carbs')!;
    _fatData=getChartData('fat')!;
    _proteinData=getChartData('protein')!;
    _allData=getChartData('all')!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Image.asset("images/saladmix.jpg")]),
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
                        Text(
                          'Salad Mix',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          '1 Bowl (300 g)',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              decoration: TextDecoration.none),
                        ),

                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text('Carbs', style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    decoration: TextDecoration.none)),
                                Container(
                                  height: 90, // height of the Container widget
                                  width: 80,  // width of the Container widget
                                  child: SfCircularChart(
                                    palette: <Color>[Color(0xFF2fb668),Color(0xFFb8efd0) ],
                                    // legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.scroll),
                                    series: <CircularSeries>[
                                      DoughnutSeries<FoodData,String>(
                                        dataSource: _carbsData,
                                        xValueMapper: (FoodData data,_)=> data.content,
                                        yValueMapper: (FoodData data,_)=> data.quantity,
                                        //dataLabelSettings: DataLabelSettings(isVisible: true)
                                      )
                                    ],

                                  ),
                                ),
                                Text(_carbsData[0].quantity.toString()+' g', style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    decoration: TextDecoration.none)),
                              ],
                            ),

                            Column(
                              children: [
                                Text('Fat', style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    decoration: TextDecoration.none)),
                                Container(
                                  height: 90, // height of the Container widget
                                  width: 80,  // width of the Container widget
                                  child: SfCircularChart(
                                    palette: <Color>[Color(0xFFf84f49),Color(0xFFf3cfcc) ],
                                    // legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.scroll),
                                    series: <CircularSeries>[
                                      DoughnutSeries<FoodData,String>(
                                        dataSource: _fatData,
                                        xValueMapper: (FoodData data,_)=> data.content,
                                        yValueMapper: (FoodData data,_)=> data.quantity,
                                        //dataLabelSettings: DataLabelSettings(isVisible: true)
                                      )
                                    ],

                                  ),
                                ),
                                Text(_fatData[0].quantity.toString()+' g', style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    decoration: TextDecoration.none)),
                              ],
                            ),

                            Column(
                              children: [
                                Text('Protein', style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    decoration: TextDecoration.none)),
                                Container(
                                  height: 90, // height of the Container widget
                                  width: 80,  // width of the Container widget
                                  child: SfCircularChart(
                                    palette: <Color>[Color(0xFFfd9c26),Color(0xFFffe9b1) ],
                                    // legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.scroll),
                                    series: <CircularSeries>[
                                      DoughnutSeries<FoodData,String>(
                                        dataSource: _proteinData,
                                        xValueMapper: (FoodData data,_)=> data.content,
                                        yValueMapper: (FoodData data,_)=> data.quantity,
                                        //dataLabelSettings: DataLabelSettings(isVisible: true)
                                      )
                                    ],

                                  ),
                                ),
                                Text(_proteinData[0].quantity.toString()+' g', style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    decoration: TextDecoration.none)),
                              ],
                            ),

                            Column(
                              children: [
                                Text('Calories', style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    decoration: TextDecoration.none)),
                                Container(
                                  height: 90, // height of the Container widget
                                  width: 80,  // width of the Container widget
                                  child: SfCircularChart(
                                    palette: <Color>[Color(0xFF2fb668),Color(0xFFf84f49), Color(0xFFfd9c26) ],
                                    // legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.scroll),
                                    series: <CircularSeries>[
                                      DoughnutSeries<FoodData,String>(
                                        dataSource: _allData,
                                        xValueMapper: (FoodData data,_)=> data.content,
                                        yValueMapper: (FoodData data,_)=> data.quantity,
                                        //dataLabelSettings: DataLabelSettings(isVisible: true)
                                      )
                                    ],

                                  ),
                                ),
                                Text('320 '+' Kkl', style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    decoration: TextDecoration.none)),
                              ],
                            ),


                          ],
                        ),

                      ],
                    ),
                  ],
                ));
          },
        ),
      ],
    );
  }


  List<FoodData>? getChartData(String axe) {
    final List<FoodData> carbsData= [
      FoodData('Carbs', 37),
      FoodData('none', 63),
    ];
    final List<FoodData> fatData= [
      FoodData('Fat', 26),
      FoodData('none', 74),
    ];
    final List<FoodData> proteinData= [
      FoodData('Protein', 45),
      FoodData('none', 55),
    ];

    final List<FoodData> allData= [
      FoodData('Carbs', 37),
      FoodData('Fat', 26),
      FoodData('Protein', 45),
    ];
    return
      axe=='carbs'? carbsData :
      axe=='fat'?  fatData :
      axe== 'protein'? proteinData :allData;
  }

}


class FoodData {
  FoodData(this.content, this.quantity);
  final String content;
  final int quantity;
}