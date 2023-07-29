import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import '../constants.dart';

class ComparisonChartPage extends StatefulWidget {
  static final String id = '/comparison_page';
  const ComparisonChartPage({super.key});

  @override
  State<ComparisonChartPage> createState() => _ComparisonChartPageState();
}

class _ComparisonChartPageState extends State<ComparisonChartPage> {
  @override
  Widget build(BuildContext context) {
    List<RadarEntry> radarEntries = [
      RadarEntry(value: 20.0),
      RadarEntry(value: 10.0),
      RadarEntry(value: 100.0),
      RadarEntry(value: 100.0),
      RadarEntry(value: 70.0),
      RadarEntry(value: 10.0),
      RadarEntry(value: 80.0),
      RadarEntry(value: 100.0),
    ];
    List<RadarEntry> secondRadarEntries = [
      RadarEntry(value: 90.0),
      RadarEntry(value: 50.0),
      RadarEntry(value: 60.0),
      RadarEntry(value: 60.0),
      RadarEntry(value: 90.0),
      RadarEntry(value: 55.0),
      RadarEntry(value: 60.0),
      RadarEntry(value: 90.0),
    ];
    List<RadarDataSet> radarDataSet = [
      RadarDataSet(
          dataEntries: radarEntries,
          fillColor: Colors.transparent,
          borderColor: Colors.red),

      RadarDataSet(
          dataEntries: secondRadarEntries,
          fillColor: Colors.transparent,
          borderColor: Colors.orange),
      //RadarDataSet(dataEntries: radarEntries),
    ];
    double angleValue = 0;
    bool relativeAngleMode = true;
    List<String> subjects = ["Physics", "Biology", "Chemistry", "Psychology"];
    RadarChartTitle deduceRadarTitle(int index, double angle) {
      return RadarChartTitle(text: '', angle: 20.0);
    }

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
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                        flex: 5,
                        child: Container(
                          child: RadarChart(
                            RadarChartData(
                              //gridBorderData: BorderSide(color: Colors.blue),
                              radarBorderData:
                                  BorderSide(color: Colors.transparent),
                              borderData: FlBorderData(show: false),
                              tickBorderData:
                                  const BorderSide(color: Colors.transparent),
                              gridBorderData: BorderSide(
                                color: kHomePageMainColor,
                                width: 2,
                              ),
                              titleTextStyle: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500)),
                              getTitle: (index, angle) {
                                final usedAngle = relativeAngleMode
                                    ? angle + angleValue
                                    : angleValue;
                                switch (index) {
                                  case 0:
                                    return RadarChartTitle(
                                      text: 'Mobile or Tablet',
                                      angle: usedAngle,
                                    );
                                  case 2:
                                    return RadarChartTitle(
                                      text: 'Desktop',
                                      angle: usedAngle,
                                    );
                                  case 1:
                                    return RadarChartTitle(
                                        text: 'TV', angle: usedAngle);
                                  default:
                                    return const RadarChartTitle(text: '');
                                }
                              },

                              dataSets: radarDataSet,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
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
