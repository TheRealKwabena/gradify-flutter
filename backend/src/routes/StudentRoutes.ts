import express from 'express';
import StudentController  from '../controllers/StudentController';
import { StudentRepository } from '../repositories/StudentRepository';


const router = express.Router();


router.get('/student/:studentId', StudentController.getSpecificStudent);

router.post('/student', StudentController.addStudent);

export default router;