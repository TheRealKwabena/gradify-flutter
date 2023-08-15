import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradify_flutter/constants.dart';
import 'package:gradify_flutter/pages/gpa_calculation_page.dart';

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
                        imageLink: 'images/radar_chart.jpg',
                        text: 'Compare Student Grades',
                      ),
                      MainActionCard(
                        imageLink: 'images/gold-medal-removebg-preview.jpg',
                        text: 'See Best Performing Subjects',
                      ),
                      MainActionCard(
                        imageLink: 'images/uploadicon.jpg',
                        text: 'Upload Subject Grades',
                      ),
                      MainActionCard(
                        imageLink: 'images/bar-chart.jpg',
                        text: 'Visualize Your Academic Progress',
                      ),
                      MainActionCard(
                        imageLink: 'images/graduation-cap.jpg',
                        text: 'Calculate GPA',
                        onPressed: () => Navigator.pushNamed(context, GPACalculationPage.id),
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
