import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class MainActionCard extends StatelessWidget {
  final String imageLink;
  final String text;
  final VoidCallback? onPressed;

  MainActionCard({required this.imageLink, required this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 145.0,
        width: 160.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: kHomePageMainColor,
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
                height: 5.0,
              ),
              Text(
                text,
                style: GoogleFonts.montserrat(
                    textStyle: kOnBoardingHeadingTextStyle.copyWith(
                        fontWeight: FontWeight.normal, fontSize: 12.0)),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: kHomePageMainColor,
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
