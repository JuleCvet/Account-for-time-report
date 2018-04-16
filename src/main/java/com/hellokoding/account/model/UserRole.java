package com.hellokoding.account.model;

import javax.persistence.Column;
import javax.persistence.Table;


//@Table(name="user_role")
public class UserRole {

	//@Column(name="user_id")
	private Long userID;
	
	//@Column(name="role_id")
	private Long roleID;

	public UserRole(Long userID, Long roleID) {
		super();
		this.userID = userID;
		this.roleID = roleID;
	}

	public Long getUserID() {
		return userID;
	}

	public void setUserID(Long userID) {
		this.userID = userID;
	}

	public Long getRoleID() {
		return roleID;
	}

	public void setRoleID(Long roleID) {
		this.roleID = roleID;
	}

	@Override
	public String toString() {
		return "UserRoll [userID=" + userID + ", roleID=" + roleID + "]";
	}
}
