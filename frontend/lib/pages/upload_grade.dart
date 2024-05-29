import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../business_logic/GradifyBrain.dart';
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
  String selectedGrade = '100';
  String subjectName = '';
  String academicYear = '';
  String selectedAcademicYear = DateTime.now().year.toString();
  final gradeList =
      List<String>.generate(100, (int index) => (100 - index).toString());
  final academicYearList = List<String>.generate(
      20, (int index) => (DateTime.now().year - index).toString());
  double grade = 0.0;
  String gradeVersion = '';
  GradifyBrain gradifyBrain = GradifyBrain();
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
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.symmetric(
                                vertical: BorderSide(
                                  color: Colors.black,
                                ),
                                horizontal: BorderSide(color: Colors.black)),
                            color: kTextFieldColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              style: kAuthScreenTextStyle.copyWith(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                              onChanged: (String value) {
                                setState(() {
                                  subjectName = value;
                                });
                              },
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
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
                        DropdownButton<String>(
                          // Down Arrow Icon
                          value: selectedAcademicYear,
                          elevation: 1,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: academicYearList.map((String academicYear) {
                            return DropdownMenuItem(
                              value: academicYear,
                              child: Text(
                                academicYear,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle()),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedAcademicYear = value!;
                            });
                          },
                        ),
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
                          elevation: 1,
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
                        DropdownButton<String>(
                          // Down Arrow Icon
                          value: selectedGrade,
                          elevation: 1,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: gradeList.map((String grade) {
                            return DropdownMenuItem(
                              value: grade,
                              child: Text(
                                grade,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle()),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedGrade = value!;
                              grade = double.parse(value!);
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    TextButton(
                      onPressed: () {
                        if (selectedSemester.isEmpty &&
                            academicYear.isEmpty &&
                            subjectName.isEmpty) {
                          print("Fill all fields");
                        } else {
                          //double grade = double.tryParse(selectedGrade) ?? 0.0;
                          gradifyBrain.addGrade(selectedSemester, subjectName,
                              selectedAcademicYear, grade);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [BoxShadow(color: Colors.black)]),
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
