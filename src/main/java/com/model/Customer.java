package com.model;

import java.util.Date;



public class Customer extends User {
	int creditScore;
	String aadhaar;
	String panCard;
	String accountNo;
	String accountType;
	String address;
	double balance;

	public Customer(int id, String userName, String name, String email, String password, String contact, String role,
			String status, Date createDate, int creditScore, String aadhaar, String panCard, String accountNo,
			String accountType, double balance,String Address) {
		super(id, userName, name, email, password, contact, role, status, createDate);
		this.creditScore = creditScore;
		this.aadhaar = aadhaar;
		this.panCard = panCard;
		this.accountNo = accountNo;
		this.accountType = accountType;
		this.balance = balance;
		this.address = Address;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Customer(int id, String userName, String name, String email, String password, String contact, String role,
			String status, Date createDate) {
		super(id, userName, name, email, password, contact, role, status, createDate);
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
	
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public int getCreditScore() {
		return creditScore;
	}
	public void setCreditScore(int creditScore) {
		this.creditScore = creditScore;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	@Override
	public String toString() {
		return "Customer [aadhaar=" + aadhaar + ", panCard=" + panCard + ", accountNo="
				+ accountNo + ", balance=" + balance + "]";
	}
	
}
