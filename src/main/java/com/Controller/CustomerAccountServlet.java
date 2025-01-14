package com.Controller;

import java.util.Random;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CustomerAccountDao;
import com.daoImpl.CustomerAccountDaoImpl;
import com.model.Account;
import com.model.Customer;
import com.model.*;

/**
 * Servlet implementation class CustomerServlet
 */
@WebServlet("/customerAccount")
public class CustomerAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    CustomerAccountDao customerDao;

    public void init() {
        customerDao = new CustomerAccountDaoImpl();
    }

    public CustomerAccountServlet() {
        super();
    }

    // Method to handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       

        
            try {
                insertCustomerData(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().append("Error: ").append(e.getMessage());
            }
        
    }

    // Method to handle POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    // Method to insert customer data into the database
    private void insertCustomerData(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        // Collecting data from the request parameters
        String username = request.getParameter("name");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String mobile = request.getParameter("mobile");
        int creditScore = 0;
        String aadhaar = request.getParameter("aadhaar");
        String panCard = request.getParameter("pan_number");
        String marital_status = request.getParameter("marital_status");
        String occupation = request.getParameter("occupation");
        String employer = request.getParameter("employer");
        String employerAddress = request.getParameter("employerAddress");
        
        
        Random random = new Random();
        String accountNo = String.valueOf(100000000 + random.nextInt(900000000));
        String accountType = request.getParameter("accountType");
        double balance = Double.parseDouble(request.getParameter("balance"));
        
        String password = panCard.substring(0, 4) + aadhaar.substring(aadhaar.length() - 4);
       
        // Creating customer object
        Customer customer = new Customer(username, name, email, password, mobile, "Customer","ACTIVE", null,creditScore,
        		aadhaar,panCard,marital_status, occupation, employer, employerAddress,address);
        
        Account account = new Account(accountNo, accountType, balance, customer.getId(), new Date());
       
        // Registering the customer
        int result = customerDao.registerCustomer(customer, account);
        if (result == 1) {
            response.getWriter().append("Customer Registered Successfully");
        } else {
            response.getWriter().append("Error: Could not register customer");
        }
    }

    // Method to retrieve customer data from the database
    private void retrieveCustomerData(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
//        int customerId = Integer.parseInt(request.getParameter("customerId"));
//
//        // Fetch customer details
//        Customer customer = customerDao.getCustomerById(customerId);
//        if (customer != null) {
//            response.getWriter().append("Customer Details: " + customer.toString());
//        } else {
//            response.getWriter().append("Error: Customer not found");
//        }
    }
}
