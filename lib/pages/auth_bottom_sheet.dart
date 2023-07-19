import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradify_flutter/constants.dart';

class AuthBottomSheet extends StatefulWidget {
  const AuthBottomSheet({super.key});

  @override
  State<AuthBottomSheet> createState() => _AuthBottomSheetState();
}

class _AuthBottomSheetState extends State<AuthBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      height: MediaQuery.of(context).size.height * 0.75,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                ),
                Text(
                  "Login or Sign Up",
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.montserrat(textStyle: kAuthScreenTextStyle),
                ),
              ],
            ),
            Divider(
              color: Color.fromRGBO(184, 176, 176, 0.53),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(184, 176, 176, 0.53)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Enter your email',
                        hintStyle: GoogleFonts.montserrat(
                          textStyle: kAuthScreenTextStyle.copyWith(
                              color: Color.fromRGBO(184, 176, 176, 0.53),
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  SizedBox(
                    height: 22.0,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      width: double.infinity,
                      child: Text(
                        'Continue',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          textStyle: kAuthScreenTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  Text(
                    'or',
                    style: GoogleFonts.montserrat(
                        textStyle: kAuthScreenTextStyle.copyWith(
                            color: Colors.black45)),
                  ),

                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                        width: 132,
                        child: Divider(
                          //color: Color.fromRGBO(184, 176, 176, 0.53),
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                        child: Text(
                          'or',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      //Text('or'),
                      SizedBox(
                        height: 10,
                        width: 132,
                        child: Divider(
                          //color: Color.fromRGBO(184, 176, 176, 0.53),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                   */
                  SizedBox(
                    height: 20.0,
                  ),
                  SocialMediaAuthButton(
                    imageLink: "images/apple_icon.jpg",
                    text: 'Continue with Apple',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SocialMediaAuthButton(
                    imageLink: "images/google_icon.jpg",
                    text: 'Continue with Google',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SocialMediaAuthButton(
                    imageLink: "images/facebook_icon.jpg",
                    text: 'Continue with Facebook',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SocialMediaAuthButton extends StatelessWidget {
  final String text;
  final String imageLink;
  final VoidCallback? onPressed;

  SocialMediaAuthButton(
      {required this.text, required this.imageLink, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.black)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imageLink,
              height: 30.0,
              width: 30.0,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                textStyle: kAuthScreenTextStyle.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
