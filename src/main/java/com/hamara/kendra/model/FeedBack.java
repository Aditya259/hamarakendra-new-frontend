package com.hamara.kendra.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class FeedBack {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	private String rating;
	
	private String employeeBehavior;
	
	private String timeTakenToProvideService;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getEmployeeBehavior() {
		return employeeBehavior;
	}

	public void setEmployeeBehavior(String employeeBehavior) {
		this.employeeBehavior = employeeBehavior;
	}

	public String getTimeTakenToProvideService() {
		return timeTakenToProvideService;
	}

	public void setTimeTakenToProvideService(String timeTakenToProvideService) {
		this.timeTakenToProvideService = timeTakenToProvideService;
	}
	
	

}
