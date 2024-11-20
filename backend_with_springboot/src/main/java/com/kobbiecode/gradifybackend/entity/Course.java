package com.kobbiecode.gradifybackend.entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Entity(name = "Course")
@Table(
        name = "course",
        uniqueConstraints = {
                @UniqueConstraint(
                        name = "unique_code_constraint",
                        columnNames = "courseCode"


                )
        }

)

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Course {



    @Column(
            name = "course_uuid",
            updatable = false,
            nullable = false
    )

    @Id
    @GeneratedValue(
            strategy = GenerationType.UUID
    )
    private UUID id;

    @Column(
            name = "name",
            nullable = false
    )
    private String courseName;
    @Column(
            name = "courseCode",
            nullable = false
    )

    private String courseCode;
    @Column(
            name = "academicYear",
            nullable = false,
            unique = true
    )


    private Integer academicYear;

    @ManyToMany(mappedBy = "courses")
    private Set<Student> students = new HashSet<>();

    public Course( String courseName, String courseCode, Integer academicYear) {

        this.courseName = courseName;
        this.courseCode = courseCode;
        this.academicYear = academicYear;
    }
}
