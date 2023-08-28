import { IStudentGrade } from "./IStudentGrade";

export class StudentGrade implements IStudentGrade {
    name : string;
    academicYear: Number;
    semester: string;
    grade: Number;
    owner: string;

    constructor(name: string, academicYear: Number, semester: string, grade: Number, owner:string ) {
        this.name = name;
        this.academicYear = academicYear;
        this.semester = semester;
        this.grade = grade
        this.owner = owner;
    }

    
}