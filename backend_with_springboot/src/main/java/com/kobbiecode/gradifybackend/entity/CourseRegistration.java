package com.kobbiecode.gradifybackend.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@AllArgsConstructor
@Getter
@Setter

public class CourseRegistration {
    @Id
    @Column(
            name = "registration_id",
            updatable = false,
            nullable = false
    )

    private Long id;

    @ManyToOne
    @JoinColumn(name = "student_uuid")
    private Student student;

    @ManyToOne
    @JoinColumn(name = "course_uuid")

    private Course course;
    @Column(
            name = "registered_at",
            nullable = false,
            updatable = false


    )

    private static final LocalDateTime registeredAt = LocalDateTime.now();
    @Column(
            name = "grade"
    )

    private Integer grade;

    

}
