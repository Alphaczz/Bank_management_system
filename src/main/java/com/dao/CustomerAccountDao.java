package com.dao;

import java.security.NoSuchAlgorithmException;

import com.model.Account;
import com.model.Customer;

public interface CustomerAccountDao extends BaseDao{
int registerCustomer(Customer customer, Account account);
Customer updateCustomerDetails(int ssnid);
Customer validateCustomer(String email, String password) ;

}