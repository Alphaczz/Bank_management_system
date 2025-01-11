package com.daoImpl;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.Utils.PasswordUtil;
import com.dao.CustomerDao;
import com.main.DBConnection;
import com.model.Customer;

public class CustomerDaoImpl implements CustomerDao {


@Override
public Connection getConnection() {

	return DBConnection.getConnection();
}

@Override
public int registerCustomer(Customer customer) {
    int check = 0;
    
    // SQL queries for each step: Insert into Users, Customer, and Account
    String insertUserSQL = "INSERT INTO Users(username, email, password, mobile, role, status) VALUES(?, ?, ?, ?, 'CUSTOMER', 'ACTIVE')";
    String insertCustomerSQL = "INSERT INTO Customer(user_id, credit_score, address, pan_number, aadhaar_number) VALUES(?, ?, ?, ?, ?)";
    String insertAccountSQL = "INSERT INTO Account(customer_id, account_type, balance, account_status) VALUES(?, ?, ?, 'ACTIVE')";

    try (Connection con = getConnection()) {
        // Begin transaction
        con.setAutoCommit(false);
       String hashedPassword =PasswordUtil.hashPassword(customer.getPassword());
        // Insert into Users table
        try (PreparedStatement pst = con.prepareStatement(insertUserSQL, Statement.RETURN_GENERATED_KEYS)) {
            pst.setString(1, customer.getUserName());
            pst.setString(2, customer.getEmail());
            pst.setString(3,hashedPassword ); // Assuming password is already hashed
            pst.setString(4, customer.getContact());
            pst.executeUpdate();

            // Get generated user_id from Users table
            ResultSet rs = pst.getGeneratedKeys();
            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt(1);
            }

            // Insert into Customer table
            try (PreparedStatement pstCustomer = con.prepareStatement(insertCustomerSQL, Statement.RETURN_GENERATED_KEYS)) {
                pstCustomer.setInt(1, userId);
                pstCustomer.setInt(2, customer.getCreditScore());
                pstCustomer.setString(3, customer.getAddress());
                pstCustomer.setString(4, customer.getPanCard());
                pstCustomer.setString(5, customer.getAadhaar());
                pstCustomer.executeUpdate();

                // Get the generated customer_id
                ResultSet rsCustomer = pstCustomer.getGeneratedKeys();
                int customerId = 0;
                if (rsCustomer.next()) {
                    customerId = rsCustomer.getInt(1);
                }

                // Insert into Account table using customer_id
                try (PreparedStatement pstAccount = con.prepareStatement(insertAccountSQL)) {
                    pstAccount.setInt(1, customerId); // Use customer_id instead of userId
                    pstAccount.setString(2, customer.getAccountType());
                    pstAccount.setDouble(3, customer.getBalance());
                    pstAccount.executeUpdate();
                }
            }

            // Insert into Account table
 

            // Commit transaction if all insertions are successful
            con.commit();
            check = 1;  // Customer registered successfully

        } catch (Exception e) {
            // If any exception occurs, rollback the transaction
            con.rollback();
            e.printStackTrace();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return check;
}
@Override
public Customer validateCustomer(String email, String password)  {
    String query = "SELECT * FROM Users WHERE email = ?";
    try (Connection con = getConnection();
         PreparedStatement pst = con.prepareStatement(query)) {

        // Set email parameter in the query
        pst.setString(1, email);

        try (ResultSet rs = pst.executeQuery()) {
            if (rs.next()) {
                // Retrieve the stored hashed password from the database
                String storedPassword = rs.getString("password");

                // Verify if the entered password matches the stored hash
                boolean isPasswordValid = PasswordUtil.verifyPassword(password, storedPassword);

                if (isPasswordValid) {
                    // If password matches, create and return the Customer object
                    Customer cus = new Customer(
                            rs.getInt("user_id"),
                            rs.getString("username"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("mobile"),
                            rs.getString("role"),
                            rs.getString("status"),
                            null
                    );
                    return cus;
                }
            }
        } catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    } catch (SQLException e) {
        e.printStackTrace();
    }

    // Return null if the customer is not found or invalid credentials
    return null;
}


@Override
public Customer updateCustomerDetails(int ssnid) {
	
	return null;
}
}

