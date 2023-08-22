import { IStudent } from "../domain/interfaces/IStudent";
import { IStudentRepository } from "../domain/interfaces/IStudentRepository";
import { Student } from "../domain/interfaces/Student";
import { StudentGrade } from "../domain/interfaces/StudentGrade";
import { Request, Response } from 'express';
import StudentSchema from "../models/StudentSchema";
export class StudentRepository implements IStudentRepository{
    public async createStudent(student: Student): Promise<void> {
        
        await StudentSchema.create(student);
    }
    public async getStudent(studentId: string): Promise<Student | null>  {
        const student = await StudentSchema.findOne({_id: studentId});
        return student;
    }
    public async editStudent(studentId: string, newStudent: Student): Promise<Student | null> {
        
        const oldStudent = await StudentSchema.findById(studentId);
        
        return await StudentSchema.findOneAndUpdate({_id:studentId}, {name: newStudent.name, grades: newStudent.grades, gpa: newStudent.gpa, cumulativeScore: newStudent.cumulativeScore }, {
            new: true
        });

    }
    public async getAllStudentGrades(studentId: string): Promise<StudentGrade[] > {
        var studentGrades: Array<any> = [];
        const student = await StudentSchema.findOne({_id: studentId});
        if(student !== null) {
            studentGrades = student.grades;
        }
        return studentGrades;
       

    }
    
}
