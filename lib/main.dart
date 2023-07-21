import 'package:flutter/material.dart';
import 'package:gradify_flutter/pages/actions.dart';
import 'package:gradify_flutter/pages/home_page.dart';
import 'package:gradify_flutter/pages/onboarding.dart';

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
        OnBoarding.id: (context) => OnBoarding(),
        HomePage.id: (context) => HomePage(),
        AllActionsPage.id: (context) => AllActionsPage()
      },
      //home: OnBoarding(),
    );
  }
}
