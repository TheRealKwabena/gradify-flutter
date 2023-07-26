import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import '../constants.dart';

class ComparisonChartPage extends StatelessWidget {
  static final String id = '/comparison_page';
  const ComparisonChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<RadarEntry> radarEntries = [
      RadarEntry(value: 20.0),
      RadarEntry(value: 10.0),
      RadarEntry(value: 100.0),
    ];
    List<RadarDataSet> radarDataSet = [
      RadarDataSet(dataEntries: radarEntries),
      RadarDataSet(dataEntries: radarEntries),
      RadarDataSet(dataEntries: radarEntries),
    ];

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: kHomePageMainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 10.0, right: 10.0, bottom: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                        ),
                        Text(
                          "Radar Chart",
                          style: GoogleFonts.montserrat(
                              textStyle: kOnBoardingHeadingTextStyle.copyWith(
                                  fontSize: 24.0, fontWeight: FontWeight.w500)),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    Expanded(
                        flex: 5,
                        child: Container(
                          child: RadarChart(
                            RadarChartData(
                              dataSets: radarDataSet,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
