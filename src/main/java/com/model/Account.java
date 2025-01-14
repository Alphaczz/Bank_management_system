package com.model;


import java.util.Date;

public class Account {
    private String accountId; 
    private String accountType;
    private double balance;
    private Date creationDate;
    private int customerId; 


	public Account(String accountNo, String accountType, double balance, int id, Date date) {
		// TODO Auto-generated constructor stub
		this.accountId = accountNo;
		this.accountType = accountType;
		this.balance = balance;
		this.customerId = id;
		this.creationDate = date;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	@Override
	public String toString() {
		return "Account [accountId=" + accountId + ", accountType=" + accountType
				+ ", balance=" + balance + ", creationDate=" + creationDate + ", customerId=" + customerId + "]";
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
    
}
