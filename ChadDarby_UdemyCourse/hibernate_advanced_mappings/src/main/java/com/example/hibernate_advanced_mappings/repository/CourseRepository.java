package com.example.hibernate_advanced_mappings.repository;


import com.example.hibernate_advanced_mappings.entity.Course;

import java.util.List;

public interface CourseRepository extends BaseRepository<Course, Integer>{
    List<Course> findAllByInstructorId(int instructor_id);
}
