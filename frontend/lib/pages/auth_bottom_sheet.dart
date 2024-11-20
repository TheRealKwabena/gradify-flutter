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
      color: const Color(0xFF757575),
      height: MediaQuery.of(context).size.height * 0.75,
      child: Container(
        decoration: const BoxDecoration(
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
                  icon: const Icon(Icons.close),
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
            const Divider(
              color: Color.fromRGBO(184, 176, 176, 0.53),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(184, 176, 176, 0.53)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Enter your email',
                        hintStyle: GoogleFonts.montserrat(
                          textStyle: kAuthScreenTextStyle.copyWith(
                              color: const Color.fromRGBO(184, 176, 176, 0.53),
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22.0,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        'Continue',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          textStyle: kAuthScreenTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SocialMediaAuthButton(
                    imageLink: "images/apple_icon.jpg",
                    text: 'Continue with Apple',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SocialMediaAuthButton(
                    imageLink: "images/google_icon.jpg",
                    text: 'Continue with Google',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SocialMediaAuthButton(
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

  const SocialMediaAuthButton(
      {super.key, required this.text, required this.imageLink, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.black)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
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
      ),
    );
  }
}
