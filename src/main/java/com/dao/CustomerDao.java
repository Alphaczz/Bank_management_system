package com.dao;

import java.security.NoSuchAlgorithmException;

import com.model.Customer;

public interface CustomerDao extends BaseDao{
int registerCustomer(Customer customer);
Customer updateCustomerDetails(int ssnid);
Customer validateCustomer(String email, String password) ;

}