import mongoose, {Schema} from 'mongoose';
import { IStudentGrade } from '../domain/interfaces/IStudentGrade';

const gradeSchema : Schema = new Schema({
    name: {type: String},
    academicYear: {type: Number},
    semester: {type: String},
    grade: {type: Number},
    owner: {
        type: Schema.Types.ObjectId,
        ref: 'Student'
    }

})

export default mongoose.model<IStudentGrade>('Grade', gradeSchema);