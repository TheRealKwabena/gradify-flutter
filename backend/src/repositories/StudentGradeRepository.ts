import { IStudentGrade } from "../domain/interfaces/IStudentGrade";
import { IStudentGradeRepository } from "../domain/interfaces/IStudentGradeRepos";
import { StudentGrade } from "../domain/interfaces/StudentGrade";
import Grade from '../models/StudentGradeSchema';
import StudentSchema from "../models/StudentSchema";
export class StudentGradeRepository implements IStudentGradeRepository{
    public async addStudentGrade(owner: string, studentGrade: IStudentGrade): Promise<void> {
        const actualStudentGrade = new StudentGrade(studentGrade.name, studentGrade.academicYear, studentGrade.semester, studentGrade.grade, owner);
        var student = await StudentSchema.findOne({_id: owner});
        student?.grades.push(actualStudentGrade);
        await student?.save();
    
        if(student !== null) {
            await Grade.create(actualStudentGrade);
        }
        
    }
    public async getAllStudentGradesBySemester(owner: string, semester: any): Promise<StudentGrade[]> {
        var studentGrades: Array<any> = [];
        const student = await StudentSchema.findOne({_id: owner});
        if(student !== null) {
            for(let i = 0; i < student.grades.length; i++) {
                if(student.grades[i].semester === semester) {
                    studentGrades.push(student.grades[i]);
                }
            }
        }
        return studentGrades;
    }
    public async deleteStudentGrade(owner: string,studentGrade: IStudentGrade): Promise<void> {
        throw new Error("Method not implemented.");
    }
    public async getAllStudentGradesByAcademicYear(studentId: string, academicYear: Number): Promise<StudentGrade[]> {
        var studentGrades: Array<any> = [];
        const student = await StudentSchema.findOne({_id: studentId, academicYear: academicYear });
        if(student !== null) {
            for(let i = 0; i < student.grades.length; i++) {
                if(student.grades[i].academicYear === academicYear) {
                    studentGrades.push(student.grades[i]);
                }
            }
        }
        return studentGrades;
    }
    public async getStudentGradesBySemesterAndAcademicYear(studentId: string, academicYear: Number, semester: string): Promise<StudentGrade[]> {
        var studentGrades: Array<any> = [];
        const student = await StudentSchema.findOne({_id: studentId, academicYear: academicYear , semester: semester});
        if(student !== null) {
            for(let i = 0; i < student.grades.length; i++) {
                if(student.grades[i].semester === semester && student.grades[i].academicYear === academicYear) {
                    studentGrades.push(student.grades[i]);
                }
            }
        }
        return studentGrades;
    }
    

}