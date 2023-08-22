import express from 'express';
import { StudentGradeController } from "../controllers/StudentGradeController";
import { StudentGradeRepository } from "../repositories/StudentGradeRepository";

const router = express.Router();

const studentGradeRepository = new StudentGradeRepository();

const studentGradeController = new StudentGradeController(studentGradeRepository);



router.post('/studentGrade/:owner/grades',studentGradeController.addStudentGrade);

router.get('/studentGrade/:owner/grades/:semester', studentGradeController.getAllStudentGradesBySemester);

router.get('/studentGrade/:owner/grades/:academicYear', studentGradeController.getAllStudentGradesByAcademicYear);


export default router;