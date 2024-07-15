import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class ProfileCard extends StatelessWidget {
  final double text;
  final String description;
  const ProfileCard({super.key, required this.text, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: const Color(0xFF4052C8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              text.toString(),
              style: GoogleFonts.montserrat(
                  textStyle: kOnBoardingHeadingTextStyle.copyWith(
                      fontSize: 15.0, fontWeight: FontWeight.w700)),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              description,
              style: GoogleFonts.montserrat(
                  textStyle: kOnBoardingHeadingTextStyle.copyWith(
                      fontSize: 10.0, fontWeight: FontWeight.normal)),
            )
          ],
        ),
      ),
    );
  }
}
