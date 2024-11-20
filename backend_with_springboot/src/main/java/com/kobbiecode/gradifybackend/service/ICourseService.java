package com.kobbiecode.gradifybackend.service;

import com.kobbiecode.gradifybackend.DTO.CourseDTO;
import com.kobbiecode.gradifybackend.entity.Course;

import java.util.List;
import java.util.UUID;

public interface ICourseService {
    Course findCourseById(UUID uuid);

    void deleteCourse();

    Course updateCourseName();

    List<Course> getAllCourses();

    List<Course> getAllByAcademicYear(int academicYear);

    void addCourse(CourseDTO courseDTO);

    Course addCourseMain(CourseDTO courseDTO);


}


