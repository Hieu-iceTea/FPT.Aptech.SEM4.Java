package com.example.hibernate_advanced_mappings.entity;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="instructor")
public class Instructor {

	// annotate the class as an entity and map to db table
	
	// define the fields
	
	// annotate the fields with db column names
	
	// ** set up mapping to InstructorDetail entity
	
	// create constructors
	
	// generate getter/setter methods
	
	// generate toString() method

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;

	@Column(name="email")
	private String email;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="instructor_detail_id")
	private InstructorDetail instructorDetail;
	
	@OneToMany(fetch=FetchType.LAZY,
			   mappedBy="instructor",
			   cascade= {CascadeType.PERSIST, CascadeType.MERGE,
						 CascadeType.DETACH, CascadeType.REFRESH})
	private List<Course> courses;
	
	
	public Instructor() {
		
	}

	public Instructor(String firstName, String lastName, String email) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public InstructorDetail getInstructorDetail() {
		return instructorDetail;
	}

	public void setInstructorDetail(InstructorDetail instructorDetail) {
		this.instructorDetail = instructorDetail;
	}

	@Override
	public String toString() {
		return "Instructor [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", instructorDetail=" + instructorDetail + "]";
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
	
	// add convenience methods for bi-directional relationship
	
	public void add(Course tempCourse) {
		
		if (courses == null) {
			courses = new ArrayList<>();
		}
		
		courses.add(tempCourse);
		
		tempCourse.setInstructor(this);
	}

	/**
	 * H??m n??y tr??? v??? c???u tr??c nguy??n th???y c???a entity n??y.
	 *
	 * Vi???t b???i: Hi???u iceTea
	 * Ng??y 23-10-2021
	 * Gi??? 22:22
	 *
	 * @return
	 */
	public HashMap<String, Object> toHashMap() {
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("id", id);

		hashMap.put("firstName", firstName);
		hashMap.put("lastName", lastName);
		hashMap.put("email", email);
		hashMap.put("instructorDetailId", instructorDetail.getId());

		return hashMap;
	}
	
}











