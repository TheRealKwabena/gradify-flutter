import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradify_flutter/business_logic/GradifyBrain.dart';
import 'package:gradify_flutter/constants.dart';

class GPACalculationPage extends StatefulWidget {
  const GPACalculationPage({super.key});
  static String id = '/calculate_gpa';

  @override
  State<GPACalculationPage> createState() => _GPACalculationPageState();
}

class _GPACalculationPageState extends State<GPACalculationPage> {
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
  var seen = <String>{};

  String selectedSemester = 'All Semesters';
  String selectedYear = '2023';
  double cumulativeScore = 0.0;
  double gpa = 0.0;
  GradifyBrain gradifyBrain = GradifyBrain();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 113.0,
              decoration: const BoxDecoration(
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
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.20,
                    ),
                    Text(
                      "Calculate GPA",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
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
                  const SizedBox(
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
                          icon: const Icon(
                            Icons.filter_list,
                            color: Colors.black,
                            size: 30.0,
                          )),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: DropdownButton<String>(
                            // Down Arrow Icon
                            value: selectedSemester,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFF4E4A4A),
                            ),
                            dropdownColor: const Color(0xFFF2F2F2),

                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: semesters.map((String semester) {
                              return DropdownMenuItem(
                                value: semester,
                                child: Text(
                                  semester,
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle()),
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
                      const SizedBox(
                        width: 20.0,
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: DropdownButton<String>(
                            // Down Arrow Icon
                            value: selectedYear,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFF4E4A4A),
                            ),
                            dropdownColor: const Color(0xFFF2F2F2),

                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: generatedYears.map((year) {
                              return DropdownMenuItem(
                                value: year,
                                child: Text(year),
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
                      const SizedBox(
                        width: 5.0,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            gradifyBrain.calculateCumulativeScore();
                            gradifyBrain.calculateGPA();
                            cumulativeScore = gradifyBrain
                                .gpaInformation["cumulative_score"]!;
                            gpa = gradifyBrain.gpaInformation["gpa"]!;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 15.0),
                          decoration: const BoxDecoration(
                              color: kHomePageMainColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          child: Text(
                            'APPLY',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                              color: Colors.white,
                            )),
                          ),
                        ),
                      )

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
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 270.0,
                      decoration: BoxDecoration(
                          color: const Color(0xFF2032A6),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: Offset(0, 4))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Computed GPA',
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Text(
                            "$gpa/4.0",
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                              color: Color(0xFF3BC741),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          Text(
                            "Ranking: top 1%",
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 13.0)),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 270.0,
                      decoration: BoxDecoration(
                          color: const Color(0xFF2032A6),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: Offset(0, 4))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Cumulative Score',
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Text(
                            "$cumulativeScore/100",
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                              color: Color(0xFF3BC741),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          Text(
                            "Ranking: top 1%",
                            style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 13.0)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
