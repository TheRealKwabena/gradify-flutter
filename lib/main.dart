import 'package:flutter/material.dart';
import 'package:gradify_flutter/pages/onboarding.dart';

void main() {
  runApp(const GradifyApp());
}

class GradifyApp extends StatelessWidget {
  const GradifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}
