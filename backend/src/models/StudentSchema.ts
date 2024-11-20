import mongoose, {Schema} from "mongoose";
import { Student } from "../domain/interfaces/Student";
import StudentGradeSchema from "./StudentGradeSchema";
const studentSchema : Schema = new Schema({
    name: {type: String},
    grades: [{
        type: Schema.Types.ObjectId,
        ref: 'Grade'
    }],
    gpa: {type: Number},
    cumulativeScore: {type:Number}
})


export default mongoose.model<Student>('Student', studentSchema);