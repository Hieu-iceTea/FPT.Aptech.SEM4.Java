package com.example.hibernate_advanced_mappings.rest;

import com.example.hibernate_advanced_mappings.entity.Course;
import com.example.hibernate_advanced_mappings.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/v1/courses")
public class CourseRestController {

    // autowire the CourseService
    @Autowired
    private CourseRepository courseRepository;

    // add mapping for GET /course
    @GetMapping("/")
    public List<Course> getCourses() {

        return courseRepository.findAll();

    }

    // add mapping for GET /course/{courseId}

    @GetMapping("/{courseId}")
    public Course getCourse(@PathVariable int courseId) {

        Course theCourse = courseRepository.findById(courseId).orElse(null);


        return theCourse;
    }

    // add mapping for POST /course  - add new course

    @PostMapping("/")
    public Course addCourse(@RequestBody Course theCourse) {

        // also just in case the pass an id in JSON ... set id to 0
        // this is force a save of new item ... instead of update

        theCourse.setId(0);

        courseRepository.save(theCourse);

        return theCourse;
    }

    // add mapping for PUT /course - update existing course

    @PutMapping("/")
    public Course updateCourse(@RequestBody Course theCourse) {

        courseRepository.save(theCourse);

        return theCourse;

    }

    // add mapping for DELETE /course/{courseId} - delete course

    @DeleteMapping("/{courseId}")
    public String deleteCourse(@PathVariable int courseId) {

        Course tempCourse = courseRepository.findById(courseId).orElse(null);

        // throw exception if null


        courseRepository.deleteById(courseId);

        return "Deleted course id - " + courseId;
    }

}


















