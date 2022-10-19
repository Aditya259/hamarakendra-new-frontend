package com.hamara.kendra.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AddAdminSubMenu {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	private String serviceSubName;

	private int adminMenuId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getServiceSubName() {
		return serviceSubName;
	}

	public void setServiceSubName(String serviceSubName) {
		this.serviceSubName = serviceSubName;
	}

	public int getAdminMenuId() {
		return adminMenuId;
	}

	public void setAdminMenuId(int adminMenuId) {
		this.adminMenuId = adminMenuId;
	}

}
