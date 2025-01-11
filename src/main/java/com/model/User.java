package com.model;

import java.util.Date;

public class User {
	
		int Id;
		String UserName;
		String Name;
		String Email;
		String Password;
		String Contact;
		String Role;
		String Status;
		Date createDate;
		
	
		
		public User(int id, String userName,String name, String email, String password, String contact, String role, String status,
				Date createDate) {
			Id = id;
			UserName = userName;
			Name=name;
			Email = email;
			Password = password;
			Contact = contact;
			Role = role;
			Status = status;
			this.createDate = createDate;
		}
		public String getName() {
			return Name;
		}
		public void setName(String name) {
			Name = name;
		}
		public String getPassword() {
			return Password;
		}
		public void setPassword(String password) {
			Password = password;
		}
		
		public Date getCreateDate() {
			return createDate;
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
			return UserName;
		}
		public void setUserName(String userName) {
			UserName = userName;
		}
		
		public String getEmail() {
			return Email;
		}
		public void setEmail(String email) {
			Email = email;
		}
		
		public String getContact() {
			return Contact;
		}
		public void setContact(String contact) {
			Contact = contact;
		}
		
		public String getRole() {
			return Role;
		}
		public void setRole(String role) {
			Role = role;
		}
		public String isStatus() {
			return Status;
		}
		public void setStatus(String status) {
			Status = status;
		}
		@Override
		public String toString() {
			return "User [Id=" + Id + ", UserName=" + UserName + ",Name  "+ Name +" Email=" + Email + ", Password=" + Password
					+ ", Contact=" + Contact + ", Role=" + Role + ", Status=" + Status + ", createDate=" + createDate
					+ "]";
		}
		
	
		
}
