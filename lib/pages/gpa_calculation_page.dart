import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradify_flutter/constants.dart';

class GPACalculationPage extends StatefulWidget {
  const GPACalculationPage({super.key});
  static String id = '/calculate_gpa';

  @override
  State<GPACalculationPage> createState() => _GPACalculationPageState();
}

class _GPACalculationPageState extends State<GPACalculationPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> semesters = [
      'All Semesters',
      '1st Semester',
      '2nd Semester ',
      '3rd Semester'
    ];
    final List<String> academicYears = ['2023', '2022', '2021', '2020'];

    final generatedYears = List<String>.generate(
        30, (int index) => (DateTime.now().year - index).toString(),
        growable: true);

    String selectedSemester = 'All Semesters';
    String selectedYear = '2023';
    return SafeArea(
      child: Scaffold(
        body: Column(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.20,
                    ),
                    Text(
                      "Calculate GPA",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            for (String year in generatedYears) {
                              print(year);
                            }
                          },
                          icon: Icon(
                            Icons.filter_list,
                            color: Colors.black,
                            size: 30.0,
                          )),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: DropdownButton<String>(
                            // Down Arrow Icon
                            value: selectedSemester,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xFF4E4A4A),
                            ),
                            dropdownColor: Color(0xFFF2F2F2),

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
                          ),
                        ),
                      ),
                      /*

                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: DropdownButton<String>(
                            // Down Arrow Icon
                            value: selectedYear,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xFF4E4A4A),
                            ),
                            dropdownColor: Color(0xFFF2F2F2),

                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: academicYears.map((String year) {
                              return DropdownMenuItem(
                                value: selectedYear,
                                child: Text(
                                  selectedYear,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle()),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                selectedYear = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      */
                    ],
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
