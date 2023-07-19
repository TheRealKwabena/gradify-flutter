import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradify_flutter/constants.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import '../components/auth_button.dart';
import '../components/onboarding_page.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  static final String id = '/onboarding';

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
