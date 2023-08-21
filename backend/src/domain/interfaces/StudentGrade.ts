import { IStudentGrade } from "./IStudentGrade";

export class StudentGrade implements IStudentGrade {
    name : string;
    academicYear: Number;
    semester: string;
    grade: Number;

    constructor(name: string, academicYear: Number, semester: string, grade: Number) {
        this.name = name;
        this.academicYear = academicYear;
        this.semester = semester;
        this.grade = grade
    }

    
}