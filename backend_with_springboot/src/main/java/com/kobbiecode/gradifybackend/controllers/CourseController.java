package com.kobbiecode.gradifybackend.controllers;

import com.kobbiecode.gradifybackend.DTO.CourseDTO;
import com.kobbiecode.gradifybackend.entity.Course;
import com.kobbiecode.gradifybackend.service.CourseService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1")
public class CourseController {
    private final CourseService courseService;
    @Autowired
    public CourseController(CourseService courseService) {
        this.courseService = courseService;
    }

    @GetMapping("/courses")
    public ResponseEntity<List<Course>> getAllCourses() {
        return ResponseEntity.ok(courseService.getAllCourses());
    }
    @GetMapping("/coursesWithoutIds")
    public ResponseEntity<List<CourseDTO>> getAllCoursesWithoutIds() {
        return ResponseEntity.ok(courseService.getAllCoursesWithoutIds());
    }

    @GetMapping("/courses/{id}")

    public ResponseEntity getCourseById(@PathVariable(name = "id") String uuid) {
        UUID uuid1 =  UUID.fromString(uuid);
        Course course = null;
        try{
            course = this.courseService.findCourseById(uuid1);
            if (course == null) {
                return new ResponseEntity<>("Course not found", HttpStatus.NOT_FOUND);
                //return ResponseEntity.status(HttpStatus.NOT_FOUND).body()
            }
            return ResponseEntity.ok(course);
        } catch(Exception ex) {

            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }



    }
    @PostMapping("/courses")
    public ResponseEntity createCourse(@RequestBody CourseDTO courseDTO) {
        Course course = null;
        try {
            course = this.courseService.addCourseMain(courseDTO);
            return ResponseEntity.status(HttpStatus.CREATED).body(course);

        } catch(Exception ex) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }

    }

}
