import express from 'express';
import StudentController  from '../controllers/StudentController';
import { StudentRepository } from '../repositories/StudentRepository';


const router = express.Router();


router.get('/students/:studentId', StudentController.getSpecificStudent);

router.get('/students', StudentController.getAllStudents);

router.post('/students', StudentController.addStudent);

export default router;