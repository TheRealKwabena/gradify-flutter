import 'package:http/http.dart' as http;
import 'dart:convert';

class GradifyBrain {
  static final String HOST = '10.0.2.2:3000';
  static var id = "64eb366e3f263279320e97d5";
  static final String STUDENT_API_URL = '/api/students/${id}';
  static final String GRADE_API_URL = '/api/studentGrade/${id}/grades';
  //static List<>
  List<dynamic> grades = [];
  Map<String, double> gpaInformation = {'gpa': 0.0, 'cumulative_score': 0.0};

  GradifyBrain();

  Future<dynamic> getAllGrades() async {
    var url = Uri.http(HOST, GRADE_API_URL);
    print(url);
    var response = await http.get(url);
    var data;
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
    } else {
      data = "Error";
    }
    return data;
  }

  void calculateCumulativeScore() async {
    var grades = await getAllGrades();
    var gradeList = grades["grades"];
    double totalGradeSum = 0.0;
    for (int i = 0; i < gradeList.length; i++) {
      totalGradeSum += gradeList[i]["grade"];
    }
    double average = totalGradeSum / gradeList.length;

    gpaInformation["cumulative_score"] = average.truncateToDouble();
  }

  double deduceGradePoint(double grade) {
    double gradePoint = 0.0;
    if (grade >= 80 && grade <= 100) {
      gradePoint = 4.0;
    }
    if (grade >= 70 && grade <= 79) {
      gradePoint = 3.5;
    }
    if (grade >= 60 && grade <= 69) {
      gradePoint = 3.0;
    }
    if (grade >= 55 && grade <= 59) {
      gradePoint = 2.5;
    }
    if (grade >= 50 && grade <= 54) {
      gradePoint = 2.0;
    } else {
      gradePoint = 0.0;
    }

    return gradePoint;
  }

  void calculateGPA() async {
    var grades = await getAllGrades();
    var gradeList = grades["grades"];
    double gradePoint = 0.0;
    double gradePointSum = 0.0;
    //List<double> gradePoints = [];
    for (dynamic grade in gradeList) {
      gradePoint = deduceGradePoint(grade["grade"]);
      gradePointSum += gradePoint;
    }
    double result = gradePointSum / gradeList.length;
    gpaInformation["gpa"] = result.truncateToDouble();
  }
}
