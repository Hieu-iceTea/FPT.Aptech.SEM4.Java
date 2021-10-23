package com.example.hibernate_advanced_mappings.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.HashMap;

@Entity
@Table(name="review")
public class Review {

	// define fields
	
	// define constructors
	
	// define getter/setters
	
	// define tostring
	
	// annotate fields
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="comment")
	private String comment;
	
	public Review() {
		
	}

	public Review(String comment) {
		this.comment = comment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "Review [id=" + id + ", comment=" + comment + "]";
	}


	/**
	 * Hàm này trả về cấu trúc nguyên thủy của entity này.
	 *
	 * Viết bởi: Hiếu iceTea
	 * Ngày 23-10-2021
	 * Giờ 22:22
	 *
	 * @return
	 */
	public HashMap<String, Object> toHashMap() {
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("id", id);
		hashMap.put("comment", comment);
		hashMap.put("courseId", "__?__");

		return hashMap;
	}
}





