import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradify_flutter/constants.dart';

import 'package:gradify_flutter/pages/gpa_calculation_page.dart';
import 'package:gradify_flutter/pages/BarChartSample2.dart';
import 'package:gradify_flutter/pages/upload_grade.dart';

import '../components/action_card.dart';

class AllActionsPage extends StatelessWidget {
  const AllActionsPage({super.key});
  static final String id = '/actions';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 113.0,
              decoration: BoxDecoration(
                color: kHomePageMainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      "All Actions",
                      style: GoogleFonts.montserrat(
                          textStyle: kOnBoardingHeadingTextStyle.copyWith(
                              fontSize: 24.0, fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: GridView.count(
                    padding: EdgeInsets.all(8),
                    mainAxisSpacing: 30.0,
                    crossAxisSpacing: 40.0,
                    crossAxisCount: 2,
                    children: [
                      MainActionCard(
                        icon: Icons.compare_arrows_sharp,
                        text: 'Compare Student Grades',
                      ),
                      MainActionCard(
                        icon: FontAwesomeIcons.medal,
                        text: 'See Best Performing Subjects',
                      ),
                      MainActionCard(
                        icon: Icons.cloud_upload_outlined,
                        text: 'Upload Subject Grades',
                        onPressed: () =>
                            Navigator.pushNamed(context, UploadGradePage.id),
                      ),
                      MainActionCard(
                        icon: Icons.auto_graph_rounded,
                        text: 'Visualize Your Academic Progress',
                        onPressed: () =>
                            {Navigator.pushNamed(context, BarChartSample2.id)},
                      ),
                      MainActionCard(
                        icon: FontAwesomeIcons.graduationCap,
                        text: 'Calculate GPA',
                        onPressed: () =>
                            Navigator.pushNamed(context, GPACalculationPage.id),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
