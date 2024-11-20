import 'package:flutter/material.dart';
import 'package:gradify_flutter/pages/actions.dart';
import 'package:gradify_flutter/pages/gpa_calculation_page.dart';
import 'package:gradify_flutter/pages/BarChartSample2.dart';
import 'package:gradify_flutter/pages/home_page.dart';
import 'package:gradify_flutter/pages/login_page.dart';
import 'package:gradify_flutter/pages/onboarding.dart';
import 'package:gradify_flutter/pages/radar_chart.dart';
import 'package:gradify_flutter/pages/upload_grade.dart';

void main() {
  runApp(const GradifyApp());
}

class GradifyApp extends StatelessWidget {
  const GradifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnBoarding.id,
      routes: {
        OnBoarding.id: (context) => const OnBoarding(),
        HomePage.id: (context) => const HomePage(),
        LoginPage.id: (context) => const LoginPage(),
        AllActionsPage.id: (context) => const AllActionsPage(),
        UploadGradePage.id: (context) => const UploadGradePage(),
        ComparisonChartPage.id: (context) => const ComparisonChartPage(),
        GPACalculationPage.id: (context) => const GPACalculationPage(),
        BarChartSample2.id: (context) => BarChartSample2()
      },
      //home: OnBoarding(),
    );
  }
}
