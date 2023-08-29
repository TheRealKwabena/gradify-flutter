import express from 'express';
import StudentGradeController  from "../controllers/StudentGradeController";
import { StudentGradeRepository } from "../repositories/StudentGradeRepository";

const router = express.Router();



router.post('/studentGrade/:owner/grades',StudentGradeController.addStudentGrade);

router.get('/studentGrade/:owner/grades', StudentGradeController.getAllStudentGrades);



export default router;