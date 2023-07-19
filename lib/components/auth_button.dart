import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationButton extends StatelessWidget {
  final Color buttonColor;

  final String text;
  final Color textColor;
  VoidCallback? onPressed;

  AuthenticationButton(
      {required this.buttonColor,
      required this.text,
      required this.textColor,
      this.onPressed});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              textStyle:
                  TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
