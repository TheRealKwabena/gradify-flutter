import { IStudentGrade } from "./IStudentGrade";
import { StudentGrade } from "./StudentGrade";

export interface IStudentGradeRepository {
    addStudentGrade(owner: string, studentGrade: IStudentGrade) : Promise<void>
    getAllStudentGradesBySemester(owner: string,semester: string): Promise<StudentGrade[]>
    

    deleteStudentGrade(owner: string,studentGrade: IStudentGrade): Promise<void>
    //getAllStudentGradeByAcademicYear(academicYear: Number): Promise<StudentGrade[]>
    getAllStudentGradesByAcademicYear(studentId: string, academicYear: Number): Promise<StudentGrade[]>,
    getStudentGradesBySemesterAndAcademicYear(studentId: string, academicYear: Number, semester: string): Promise<StudentGrade[]>
    

}