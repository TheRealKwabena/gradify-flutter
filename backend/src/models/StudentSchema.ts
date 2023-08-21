import mongoose, {Schema} from "mongoose";
import { IStudent } from "../domain/interfaces/IStudent";

const studentSchema : Schema = new Schema({
    name: {type: String},
    studentGrades: [{
        type: Schema.Types.ObjectId,
        ref: 'Grade'
    }]
})


export default mongoose.model<IStudent>('Student', studentSchema);