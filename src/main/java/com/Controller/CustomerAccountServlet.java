package com.Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CustomerDao;
import com.daoImpl.CustomerDaoImpl;
import com.model.Customer;

/**
 * Servlet implementation class CustomerServlet
 */
@WebServlet("/registerCustomer")
public class RegisterCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    CustomerDao customerDao;

    public void init() {
        customerDao = new CustomerDaoImpl();
    }

    public RegisterCustomerServlet() {
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
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        int creditScore = Integer.parseInt(request.getParameter("creditscore")) ;
        String aadhaar = request.getParameter("aadhaar");
        String panCard = request.getParameter("panCard");
        String accountNo = request.getParameter("accountNo");
        String accountType = request.getParameter("accountType");
        double balance = Double.parseDouble(request.getParameter("balance"));
       
        // Creating customer object
        Customer customer = new Customer(1,username, name, email, password, contact, "Customer","ACTIVE",null,creditScore,
        		aadhaar,panCard,accountNo,accountType,balance,address);
       
        // Registering the customer
        int result = customerDao.registerCustomer(customer);
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
