import {IStudent} from './IStudent';
import { IStudentGrade } from './IStudentGrade';
export class Student implements IStudent {
    name: string;

    grades: Array<IStudentGrade>;

    constructor(name: string, grades: Array<IStudentGrade>) {
        this.name = name;
        this.grades = grades
    }


}