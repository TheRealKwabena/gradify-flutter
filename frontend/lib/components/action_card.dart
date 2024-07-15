import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class MainActionCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  const MainActionCard({super.key, required this.icon, required this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 145.0,
        width: 160.0,
        decoration: BoxDecoration(
            color: kHomePageMainColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, 4),
                  blurRadius: 4.0)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                size: 30.0,
                color: Colors.amberAccent,
              ),
              const SizedBox(
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
      ),
    );
  }
}
