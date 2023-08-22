import { IStudentGradeRepository } from "../domain/interfaces/IStudentGradeRepos";
import { Request, Response } from 'express';

export class StudentGradeController{
    constructor(private readonly studentGradeRepository:IStudentGradeRepository) {}
    readonly STUDENT_EXISTENCE_ERROR_MESSAGE = 'Student does not exist';
    readonly GRADE_OTHER_ERROR = 'Grade could not be saved'; 

    public async addStudentGrade(req:Request, res:Response) {
        try {
            await this.studentGradeRepository.addStudentGrade(req.params.owner, req.body.studentGrade);
            res.status(201).json({message: 'Grade added'});
        }catch(ex) {
            res.status(400).json({message: this.GRADE_OTHER_ERROR});
        }
    }


    public async getAllStudentGradesBySemester(req:Request, res: Response) {

        
        try {
            const grades = await this.studentGradeRepository.getAllStudentGradesBySemester(req.params.owner, req.params.semester);
            res.status(201).json(grades);
        }catch(ex) {
            res.status(400).json({message: this.STUDENT_EXISTENCE_ERROR_MESSAGE});
        }
    }

    public async getAllStudentGradesByAcademicYear(req:Request, res: Response) {
        const academicYear = Number(req.params.academicYear);
        try {
            
            const grades = await this.studentGradeRepository.getAllStudentGradesByAcademicYear(req.params.owner, academicYear);
            res.status(201).json(grades);
        }catch(ex) {
            res.status(400).json({message: this.STUDENT_EXISTENCE_ERROR_MESSAGE});
        }
    }


    public async getAllStudentGradesByAcademicYearAndSemester(req:Request, res: Response) {
        const academicYear = Number(req.params.academicYear);
            
        try {
            const grades = await this.studentGradeRepository.getStudentGradesBySemesterAndAcademicYear(req.params.owner,academicYear, req.params.semester);
            res.status(201).json(grades);
        }catch(ex) {
            res.status(400).json({message: this.STUDENT_EXISTENCE_ERROR_MESSAGE});
        }
    }

}