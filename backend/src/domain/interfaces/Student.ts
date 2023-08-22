import {IStudent} from './IStudent';
import { IStudentGrade } from './IStudentGrade';
export class Student implements IStudent {
    name: string;

    grades: Array<IStudentGrade>;

    gpa: Number;
    cumulativeScore: Number;
    
    constructor(name: string) {
        this.name = name;
        this.grades = [];
        this.gpa = 0.0;
        this.cumulativeScore = 0.0;
    }
  


}