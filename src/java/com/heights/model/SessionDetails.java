/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.heights.model;

/**
 *
 * @author aojinadu
 */
public class SessionDetails {
	private String username;
	private String staff_id;

	public SessionDetails(String username, String staff_id) {
		this.username = username;
		this.staff_id = staff_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getStaff_id() {
		return staff_id;
	}

	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
}
