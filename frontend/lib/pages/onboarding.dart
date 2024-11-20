import 'package:flutter/material.dart';
import 'package:gradify_flutter/constants.dart';
import '../components/onboarding_page.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  static const String id = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        //backgroundColor: ,
        body: SingleChildScrollView(
          child: OnBoardingPage(
            text: 'Compare students \nin Gradify',
            color: kOnboardingPrimaryColor,
            imageLink: 'images/radar_chart.jpg',
          ),
        ),
      ),
    );
  }
}
