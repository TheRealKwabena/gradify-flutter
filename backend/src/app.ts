import express from 'express';
import bodyParser from 'body-parser';
import mongoose from 'mongoose';
import studentRoutes from './routes/StudentRoutes';
import cors from 'cors';
import studentGradeRoutes from './routes/StudentGradeRoutes';


const app = express();


// Middleware
app.use(cors());
app.use(bodyParser.json());

// Routes
app.use('/api', studentRoutes);
app.use('/api', studentGradeRoutes);

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

mongoose.connect('mongodb+srv://gradify:graDify1259.@cluster0.vzy8upx.mongodb.net/')
.then(() => {
  console.log('Connected to MongoDB');
})
.catch((error) => {
  console.error('Error connecting to MongoDB:', error);
});

//app.use('/api/student/*', studentRoutes);

//app.use('/api/studentGrade/*', studentGradeRoutes);
