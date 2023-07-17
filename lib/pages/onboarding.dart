import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradify_flutter/constants.dart';

import '../components/auth_button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: ,
        body: OnBoardingPage(
          text: 'Compare students \nin Gradify',
          color: kOnboardingPrimaryColor,
          imageLink: 'images/radar_chart.jpg',
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final Color color;
  final String text;
  final String imageLink;

  OnBoardingPage(
      {required this.color, required this.text, required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 80.0, left: 20.0, right: 20.0, bottom: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              text,
              style: GoogleFonts.montserrat(
                  textStyle: kOnBoardingHeadingTextStyle),
            ),
            SizedBox(
              height: 200.0,
            ),
            Container(
              height: 223.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      imageLink,
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AuthenticationButton(
                  buttonColor: Colors.black,
                  text: 'Login',
                  textColor: Colors.white,
                ),
                AuthenticationButton(
                  buttonColor: Colors.white,
                  text: 'Sign Up',
                  textColor: Colors.black,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
