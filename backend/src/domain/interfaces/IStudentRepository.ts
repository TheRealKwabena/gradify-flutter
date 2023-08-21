import { Student } from "./Student";

export interface IStudentRepository {
    createStudent(name: string) : void,
    getStudent(): Student
}