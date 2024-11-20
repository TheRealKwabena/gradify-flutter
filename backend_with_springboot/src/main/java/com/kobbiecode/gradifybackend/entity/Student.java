package com.kobbiecode.gradifybackend.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;


@Entity(name = "Student")
@Table(
        name = "student"

)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Student {
    @Column(
            name = "student_uuid",
            updatable = false,
            nullable = false
    )

    @Id
    @GeneratedValue(
            strategy = GenerationType.UUID
    )
    private UUID id;
    @Column(
            name = "first_name",
            nullable = false

    )

    /*
    @JoinTable(
            name = "enrollment",
            joinColumns = @JoinColumn(name = "student_id"),
            inverseJoinColumns = @JoinColumn(name = "course_id")
    )

     */

    private String firstName;
    @Column(
            name = "last_name",
            nullable = false

    )
    private String lastName;
    @Column(
            name = "registered_at",
            nullable = false,
            updatable = false


    )
    private final static LocalDateTime registeredAt = LocalDateTime.now();
    @Column(
            name = "dob",
            nullable = false

    )
    private LocalDate dob;


    @ManyToMany
    @JoinTable(
            name = "course_registration",
            joinColumns = @JoinColumn(name = "student_uuid"),
            inverseJoinColumns =  @JoinColumn(name = "course_uuid")
    )

    private Set<Course> courses = new HashSet<>();

    public Student(String firstName, String lastName, LocalDate dob) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.dob = dob;
    }
}
