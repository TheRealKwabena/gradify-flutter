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
  var seen = Set<String>();

  String selectedSemester = 'All Semesters';
  String selectedYear = '2023';
  @override
  Widget build(BuildContext context) {
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
                              fontSize: 15.0,
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
                      SizedBox(
                        width: 20.0,
                      ),
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
                              fontSize: 15.0,
                              color: Color(0xFF4E4A4A),
                            ),
                            dropdownColor: Color(0xFFF2F2F2),

                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: generatedYears.map((year) {
                              return DropdownMenuItem(
                                child: Text(year),
                                value: year,
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
                      SizedBox(
                        width: 5.0,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 15.0),
                          decoration: BoxDecoration(
                              color: kHomePageMainColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          child: Text(
                            'APPLY',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
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
            SizedBox(
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
                        color: Color(0xFF2032A6),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0,4)
                          )
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Computed GPA',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Text(
                            "3.97/4.0",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              color: Color(0xFF3BC741),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          Text(
                            "Ranking: top 1%",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white, fontSize: 13.0)),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 270.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF2032A6),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0,4)
                          )
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Cumulative Score',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Text(
                            "96.85/100",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              color: Color(0xFF3BC741),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          Text(
                            "Ranking: top 1%",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
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
