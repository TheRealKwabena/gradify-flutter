import { IStudentGrade } from "./IStudentGrade";

export interface IStudent {
    name: string,
    grades: Array<IStudentGrade>,
    gpa: Number,
    cumulativeScore: Number

}

