import { Request, Response } from 'express';
import Student from '../models/StudentSchema';
import { StudentRepository } from '../repositories/StudentRepository';
import { IStudentRepository } from '../domain/interfaces/IStudentRepository';



export class StudentController{

  constructor(private readonly studentRepository: IStudentRepository) {}
  readonly STUDENT_EXISTENCE_ERROR_MESSAGE = 'Student does not exist';
  readonly STUDENT_OTHER_ERROR = 'Student could not be saved'; 

  public async addStudent(req:Request, res: Response) {
    try {
      const student = await this.studentRepository.createStudent(req.body);
      res.status(201).json(student);
    }
    catch(ex) {
      res.status(400).json({message :this.STUDENT_OTHER_ERROR});
    }
  }

  public async getSpecificStudent(req:Request, res:Response) {
    try {
      const student = await this.studentRepository.getStudent(req.params.studentId);
      res.status(200).json(student);
    }
    catch(ex) {
      res.status(400).json({message: this.STUDENT_EXISTENCE_ERROR_MESSAGE})
    }
  }


}

