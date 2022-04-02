import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class MoreInfo extends StatefulWidget {
  static const String id = 'moreinfo';
  const MoreInfo({Key? key}) : super(key: key);

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
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
                      ],
                    ),
                  ],
                ));
          },
        ),
      ],
    );
  }
}
