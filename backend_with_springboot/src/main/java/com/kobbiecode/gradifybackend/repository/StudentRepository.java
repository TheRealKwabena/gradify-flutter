package com.kobbiecode.gradifybackend.repository;

import com.kobbiecode.gradifybackend.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface StudentRepository extends JpaRepository<Student, UUID> {
    @Override
    List<Student> findAll();

    Student findStudentById(UUID id);

    @Override
    void deleteById(UUID uuid);
}
