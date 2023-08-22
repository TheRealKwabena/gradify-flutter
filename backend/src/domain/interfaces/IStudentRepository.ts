import { Student } from "./Student";
import { StudentGrade } from "./StudentGrade";
import { IStudent } from "./IStudent";
export interface IStudentRepository {
    createStudent(student: Student) : Promise<void>,
    getStudent(studentId: string): Promise<Student | null>,
    editStudent(studentId: string, student: Student): Promise<Student |null>
    getAllStudentGrades(studentId: string): Promise<StudentGrade[]>,
   
    


}