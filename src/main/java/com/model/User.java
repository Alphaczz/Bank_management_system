package com.model;

import java.util.Date;

public class User {
	
		int Id;
		String username;
		String name;
		String email;
		String password;
		String mobile;
		String role;
		String status;
		Date createDate;
		
	
		
		public User(String userName,String name, String email, String password, String contact, String role, String status,
				Date createDate) {
			this.username = userName;
			this.name=name;
			this.email = email;
			this.password = password;
			this.mobile = contact;
			this.role = role;
			this.status = status;
			this.createDate = createDate;
		}
		public String getName() {
			return this.name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getPassword() {
			return this.password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		
		public Date getCreateDate() {
			return this.createDate;
		}
		public void setCreateDate(Date createDate) {
			this.createDate = createDate;
		}
		
		public int getId() {
			return Id;
		}
		public void setId(int id) {
			Id = id;
		}
		public String getUserName() {
			return this.username;
		}
		public void setUserName(String userName) {
			this.username = userName;
		}
		
		public String getEmail() {
			return this.email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		
		public String getContact() {
			return this.mobile;
		}
		public void setContact(String contact) {
			this.mobile = contact;
		}
		
		public String getRole() {
			return this.role;
		}
		public void setRole(String role) {
			this.role = role;
		}
		public String isStatus() {
			return this.status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		@Override
		public String toString() {
			return "User [Id=" + Id + ", username=" + username + ", name=" + name + ", email=" + email + ", password="
					+ password + ", mobile=" + mobile + ", role=" + role + ", status=" + status + ", createDate="
					+ createDate + "]";
		}

	
		
}
