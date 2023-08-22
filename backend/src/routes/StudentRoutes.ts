import express from 'express';
import { StudentController } from '../controllers/StudentController';
import { StudentRepository } from '../repositories/StudentRepository';


const router = express.Router();
const studentRepository = new StudentRepository();
const studentController = new StudentController(studentRepository);

router.get('/student/:studentId', studentController.getSpecificStudent);

router.post('/student', studentController.addStudent);

export default router;