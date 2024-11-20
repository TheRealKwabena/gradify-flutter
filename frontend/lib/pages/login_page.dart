import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradify_flutter/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  bool isVisible = false;
  String loginPassword = "";

  void changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: Color(0xFF353333),
                      iconSize: 25,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    Text(
                      "Login",
                      style: GoogleFonts.montserrat(
                          fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Login to continue using the app",
                        style: GoogleFonts.montserrat(
                            color: Colors.grey, fontSize: 15)),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.montserrat(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: kTextFieldColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: TextField(
                          style: kAuthScreenTextStyle.copyWith(
                              fontSize: 15.0, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (String value) {
                            setState(() {
                              email = value;
                            });
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your email",
                              hintStyle: /*TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                            */
                                  GoogleFonts.montserrat(
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.montserrat(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: kTextFieldColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: TextField(
                          obscureText: isVisible,
                          style: GoogleFonts.openSans(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          onChanged: (String password) =>
                              {loginPassword = password},
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () => {
                                changeVisibility(),
                              },
                              child: isVisible ==
                                      true // ternary operator to render password visibility icon
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                            hintText: "Enter your password",
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot password?",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Color(0xFF2E2B2B),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        height: 50,
                        decoration: BoxDecoration(
                            color: kOnboardingPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFF131111D5),
                                  spreadRadius: 5,
                                  offset: Offset(1.0, 0.0),
                                  blurRadius: 10)
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "or",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (email.isEmpty || loginPassword.isEmpty) {
                              print("Fill in all the blanks");
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              child: Icon(
                                FontAwesomeIcons.github,
                                color: Colors.blue,
                              ),
                            ),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              border: Border.all(color: Color(0xFF333131)),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF131111D5),
                                    spreadRadius: 5,
                                    offset: Offset(1.0, 0.0),
                                    blurRadius: 10)
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                child: Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.blue,
                                )),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              border: Border.all(
                                color: Color(0xFF333131),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF131111D5),
                                    spreadRadius: 5,
                                    offset: Offset(1.0, 0.0),
                                    blurRadius: 10)
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              child: Icon(
                                FontAwesomeIcons.facebook,
                                color: Colors.blue,
                              ),
                            ),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(color: Color(0xFF333131)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFF131111D5),
                                      spreadRadius: 5,
                                      offset: Offset(1.0, 0.0),
                                      blurRadius: 10)
                                ]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
