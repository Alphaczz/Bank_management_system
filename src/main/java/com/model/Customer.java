package com.model;

import java.util.Date;



public class Customer extends User {
	int id;
	int creditScore;
	String aadhaar;
	String panCard;
	String marital_status;
	String occupationType;
	String employer;
	String employer_address;
	String address;
	
	public Customer(String userName, String name, String email, String password, String mobile, String role,
            String status, Date createDate, int creditScore, String aadhaar, String panCard, String marital_status,
            String occupation, String employer, String employerAddress,
            String address) {
		super(userName, name, email, password, mobile, role, status, createDate);
		this.creditScore = creditScore;
		this.aadhaar = aadhaar;
		this.panCard = panCard;
		this.marital_status = marital_status;
		this.occupationType = occupation;
		this.employer = employer;
		this.employer_address = employerAddress;
		this.address = address;
	}
	
	public int getId() {
		return id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getAadhaar() {
		return aadhaar;
	}
	public void setAadhaar(String aadhaar) {
		this.aadhaar = aadhaar;
	}
	public String getPanCard() {
		return panCard;
	}
	public void setPanCard(String panCard) {
		this.panCard = panCard;
	}
	
}
	public int getCreditScore() {
		return creditScore;
	}
	public void setCreditScore(int creditScore) {
		this.creditScore = creditScore;
	}

	@Override
	public String toString() {
		return "Customer [aadhaar=" + aadhaar + ", panCard=" + panCard + "+ ]";
	}
	
}
