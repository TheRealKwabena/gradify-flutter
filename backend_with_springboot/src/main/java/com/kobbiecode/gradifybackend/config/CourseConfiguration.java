
package com.kobbiecode.gradifybackend.config;

import com.kobbiecode.gradifybackend.entity.Course;
import com.kobbiecode.gradifybackend.repository.CourseRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration

public class CourseConfiguration {
    private static final Logger log = LoggerFactory.getLogger(CourseConfiguration.class);

    Course course1 = new Course("Physics", "PHY101", 2024);
    Course course2 = new Course("English", "ENG121", 2022);

    Course course3 = new Course("College Algebra I", "MATH101", 2023);
    Course[] courses = {course1, course2, course3   };
    @Bean

    CommandLineRunner studentCommandLineRunner(CourseRepository courseRepository) {
        return  args -> {

            for (Course course : courses) {
                log.info("Loading " + courseRepository.save(course));
            }

        };



    }



}


