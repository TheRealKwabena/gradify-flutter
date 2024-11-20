package com.kobbiecode.gradifybackend.repository;

import com.kobbiecode.gradifybackend.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface CourseRepository extends JpaRepository<Course, UUID> {
    List<Course> findCoursesByAcademicYear(int academicYear);
    Course findCourseById(UUID uuid);

}
