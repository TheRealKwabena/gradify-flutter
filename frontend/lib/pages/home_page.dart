import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradify_flutter/constants.dart';

import 'package:gradify_flutter/pages/actions.dart';
import 'package:gradify_flutter/pages/radar_chart.dart';
import 'package:gradify_flutter/pages/upload_grade.dart';

import '../components/action_card.dart';
import '../components/profile_card.dart';

class HomePage extends StatefulWidget {
  static const String id = '/homepage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double gpa_value = 3.95;
  double averageScore = 85.95;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 400.0, //MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                color: kHomePageMainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 53.0, left: 26.0, right: 26.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
                      ],
                    ),
                    Center(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('images/neymar.jpg'),
                            backgroundColor: kHomePageMainColor,
                            radius: 50.0,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'James Harrison',
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24.0)),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Student',
                            style: GoogleFonts.montserrat(
                                fontSize: 14.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileCard(
                            text: gpa_value,
                            description: 'average gpa',
                          ),
                          ProfileCard(
                            text: averageScore,
                            description: 'average score',
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Actions',
                        style: GoogleFonts.montserrat(
                            textStyle: kAuthScreenTextStyle.copyWith(
                                fontSize: 14.0, fontWeight: FontWeight.w400)),
                      ),
                      Row(
                        children: [
                          Text(
                            "See All",
                            style: GoogleFonts.montserrat(
                                textStyle: kAuthScreenTextStyle.copyWith(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.normal)),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AllActionsPage.id);
                              },
                              icon: const Icon(Icons.arrow_forward_ios))
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainActionCard(
                          icon: Icons.compare_arrows_sharp,
                          text: 'Compare Student Grades',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ComparisonChartPage.id);
                          },
                        ),
                        const MainActionCard(
                          icon: FontAwesomeIcons.medal,
                          text: 'See Best Performing Subjects',
                        ),
                        //MainActionCard(imageLink:'images/gold-medal-removebg-preview.jpg', text: 'Compare Student Grades',),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainActionCard(
                        icon: Icons.cloud_upload_outlined,
                        text: 'Upload Subject Grades',
                        onPressed: () {
                          Navigator.pushNamed(context, UploadGradePage.id);
                        },
                      ),
                      const MainActionCard(
                        icon: Icons.auto_graph_rounded,
                        text: 'Visualize Your Academic Progress',
                      ),
                      //MainActionCard(imageLink:'images/gold-medal-removebg-preview.jpg', text: 'Compare Student Grades',),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
