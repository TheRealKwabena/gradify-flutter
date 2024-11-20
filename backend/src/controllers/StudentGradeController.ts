import { Request, Response } from 'express';
import StudentSchema from "../models/StudentSchema";
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
            
    
            
            
            return res.status(200).json({message: 'Grade added'});
        }catch(error) {
            console.log(error)
            return res.status(400).json({message: Constants.GRADE_OTHER_ERROR});
        }
    }



    static async getAllStudentGrades(req:Request, res: Response) {
        
        const owner = req.params.owner;
        
        try {
            var studentGrades: Array<any> = [];
            const grades = await Grade.find({owner: owner});
            if(grades !== null) {
                
                studentGrades = grades;
                    
            }
            
            //const grades = studentGrades;
            return res.status(200).json({grades: studentGrades});
        }catch(ex) {
            return res.status(400).json({message: Constants.STUDENT_EXISTENCE_ERROR_MESSAGE});
        }
    }

   

   

}

export default StudentGradeController;