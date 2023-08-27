import { Request, Response } from 'express';
import Student from '../models/StudentSchema';
import { StudentRepository } from '../repositories/StudentRepository';
import { IStudentRepository } from '../domain/interfaces/IStudentRepository';
import Constants from '../utilities/constants';


class StudentController{

  //readonly  studentRepository = new StudentRepository();
  //constructor(private readonly studentRepository: IStudentRepository) {}
  readonly STUDENT_EXISTENCE_ERROR_MESSAGE = 'Student does not exist';
  readonly STUDENT_OTHER_ERROR = 'Student could not be saved'; 

  static async addStudent(req:Request, res: Response) {
    try {
      const student = await  Student.create(req.body);
      //const student = await this.studentRepository.createStudent(req.body);
      res.status(201).json(student);
    }
    catch(error) {
      console.log(error);
      res.status(400).json({message :Constants.STUDENT_OTHER_ERROR});
    }
  }

  static async getSpecificStudent(req:Request, res:Response) {
    try {
      const student = await Student.findOne({_id: req.params.studentId});
      
    
      res.status(200).json(student);
    }
    catch(ex) {
      res.status(400).json({message: Constants.STUDENT_EXISTENCE_ERROR_MESSAGE})
    }
  }


}

export default StudentController;