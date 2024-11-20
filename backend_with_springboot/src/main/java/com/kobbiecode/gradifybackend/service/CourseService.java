package com.kobbiecode.gradifybackend.service;

import com.kobbiecode.gradifybackend.DTO.CourseDTO;
import com.kobbiecode.gradifybackend.entity.Course;
import com.kobbiecode.gradifybackend.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class CourseService implements ICourseService{

    private final CourseRepository courseRepository;
    @Autowired
    public CourseService(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    public Course findCourseById(UUID uuid) {

        return courseRepository.findCourseById(uuid);
    }

    public CourseDTO findByUUID(UUID uuid) {
        Course course = courseRepository.findCourseById(uuid);
        return convertToDTO(course);

    }

    public Course convertToEntity(CourseDTO courseDTO) {
        return new Course(courseDTO.getCourseName(), courseDTO.getCourseCode(), courseDTO.getAcademicYear());

    }

    public CourseDTO convertToDTO(Course course) {
        return new CourseDTO(course.getCourseName(), course.getCourseCode(), course.getAcademicYear());
    }

    @Override
    public void deleteCourse() {

    }

    @Override
    public Course updateCourseName() {
        return null;
    }

    @Override
    public void addCourse(CourseDTO courseDTO) {
        courseRepository.save(convertToEntity(courseDTO));
    }

    @Override
    public Course addCourseMain(CourseDTO courseDTO) {
        Course course = convertToEntity(courseDTO);
        courseRepository.save(course);
        return course;
    }

    @Override
    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }
    public List<CourseDTO> getAllCoursesWithoutIds() {
        List<Course> courses = courseRepository.findAll();
        List<CourseDTO> courseDTOList = new ArrayList<>();
        for (Course course: courses) {
            courseDTOList.add(convertToDTO(course));
        }
        return courseDTOList;
    }

    @Override
    public List<Course> getAllByAcademicYear(int academicYear) {
        return courseRepository.findCoursesByAcademicYear(academicYear);
    }
}
