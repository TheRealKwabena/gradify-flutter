import { IStudentGradeRepository } from "../domain/interfaces/IStudentGradeRepos";
import { Request, Response } from 'express';
import StudentSchema from "../models/StudentSchema";
import { StudentGrade } from "../domain/interfaces/StudentGrade";
import Grade from "../models/StudentGradeSchema";
import Constants from "../utilities/constants";
class StudentGradeController{
    
    static async addStudentGrade(req:Request, res:Response) {
        const studentGrade = req.body;
        const owner = req.params.owner;
        console.log(studentGrade)
        try {
            console.log(owner);
            
            //const actualStudentGrade = new StudentGrade(studentGrade.name, studentGrade.academicYear, studentGrade.semester, studentGrade.grade, owner);
            const actualStudentGrade = {
                name: studentGrade.name,
                academicYear: studentGrade.academicYear,
                semester: studentGrade.semester,
                grade: studentGrade.grade,
                owner: owner
            }
            var student = await StudentSchema.findOne({_id: owner});
            if(student !== null) {
                const grade = await Grade.create(actualStudentGrade);
                console.log(student.grades)
                student.grades.push(grade._id);
                console.log(student.grades)
                const updated =  await student.save();
                console.log(updated);
            }
            
    
            
            
            res.status(200).json({message: 'Grade added'});
        }catch(error) {
            console.log(error)
            res.status(400).json({message: Constants.GRADE_OTHER_ERROR});
        }
    }
    static async getAllStudentGrades(owner: string) {
        var studentGrades: Array<any> = [];

        try {
            var grades = await Grade.find({owner: owner});
            studentGrades = grades;
            return studentGrades;
        }
        catch(error) {
            console.log(error);
        }
    }


    static async getAllStudentGradesBySemester(req:Request, res: Response) {
        const semester = req.params.semester
        const owner = req.params.owner;
        
        try {
            var studentGrades: Array<any> = [];
            const grades = await Grade.find({owner: owner});
            if(grades !== null) {
                for(let i = 0; i < grades?.length; i++) {
                    if(grades[i].semester === semester) {
                        studentGrades.push(grades[i]);
                    }
                }
            }
            //const grades = studentGrades;
            res.status(200).json(grades);
        }catch(ex) {
            res.status(400).json({message: Constants.STUDENT_EXISTENCE_ERROR_MESSAGE});
        }
    }

    static async getAllStudentGradesByAcademicYear(req:Request, res: Response) {
        const academicYear = Number(req.params.academicYear);
        const studentId = req.params.owner;
        try {
            var studentGrades: Array<any> = [];
            //const student = await StudentSchema.findOne({_id: studentId, academicYear: academicYear });
            const grades = await Grade.find({owner: studentId});
            if(grades !== null) {
                for(let i = 0; i < grades.length; i++) {
                    if(grades[i].academicYear === academicYear) {
                        studentGrades.push(grades[i]);
                    }
                }
            }
            //const grades = studentGrades;
            res.status(200).json(grades);
        }catch(ex) {
            res.status(400).json({message: Constants.STUDENT_EXISTENCE_ERROR_MESSAGE});
        }
    }


    static async getAllStudentGradesByAcademicYearAndSemester(req:Request, res: Response) {
        const academicYear = Number(req.params.academicYear);
        const studentId = req.params.owner;
        const semester = req.params.semester;
            
        try {
            var studentGrades: Array<any> = [];
            const student = await StudentSchema.findOne({_id: studentId, academicYear: academicYear , semester: semester});
            if(student !== null) {
                for(let i = 0; i < student.grades.length; i++) {
                    if(student.grades[i].semester === semester && student.grades[i].academicYear === academicYear) {
                        studentGrades.push(student.grades[i]);
                    }
                }
            }
            const grades = studentGrades;
            res.status(201).json(grades);
        }catch(ex) {
            res.status(400).json({message: Constants.STUDENT_EXISTENCE_ERROR_MESSAGE});
        }
    }

}

export default StudentGradeController;