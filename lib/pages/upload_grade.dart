import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class UploadGradePage extends StatefulWidget {
  const UploadGradePage({super.key});
  static final String id = '/upload-grade';

  @override
  State<UploadGradePage> createState() => _UploadGradePageState();
}

class _UploadGradePageState extends State<UploadGradePage> {
  final List<String> semesters = ['1st', '2nd ', '3rd '];
  String selectedSemester = '1st';
  String subjectName = '';
  String academicYear = '';
  double grade = 0.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 113.0,
                decoration: BoxDecoration(
                  color: kHomePageMainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Add Grade',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          textStyle: kAuthScreenTextStyle.copyWith(
                              fontSize: 32.0, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Subject Name',
                          style: GoogleFonts.montserrat(
                            textStyle: kAuthScreenTextStyle.copyWith(
                                fontSize: 15.0, fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          width: 195.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: kTextFieldColor,
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                subjectName = value;
                              });
                            },
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Academic Year',
                          style: GoogleFonts.montserrat(
                              textStyle: kAuthScreenTextStyle.copyWith(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal)),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          width: 195.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: kTextFieldColor,
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                academicYear = value;
                              });
                            },
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Semester',
                          style: GoogleFonts.montserrat(
                              textStyle: kAuthScreenTextStyle.copyWith(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal)),
                        ),
                        SizedBox(
                          width: 60.0,
                        ),
                        DropdownButton<String>(
                          // Down Arrow Icon
                          value: selectedSemester,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: semesters.map((String semester) {
                            return DropdownMenuItem(
                              value: semester,
                              child: Text(
                                semester,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle()),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedSemester = value!;
                            });
                          },
                        )
                        /*Container(
                            width: 195.0,
                            height: 36.0,
                            decoration: BoxDecoration(
                              color: kTextFieldColor,
                            ),
                            child: DropdownButton<String>(
                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: semesters.map((String semester) {
                                return DropdownMenuItem(
                                  value: semester,
                                  child: Text(semester),
                                );
                              }).toList(),
                              onChanged: (Object? value) {},
                            ))

                         */
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Grade',
                          style: GoogleFonts.montserrat(
                              textStyle: kAuthScreenTextStyle.copyWith(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal)),
                        ),
                        SizedBox(
                          width: 86.0,
                        ),
                        Container(
                          width: 195.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: kTextFieldColor,
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                grade = double.parse(value);
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusColor: kHomePageMainColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          'Save',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            textStyle: kAuthScreenTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
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
