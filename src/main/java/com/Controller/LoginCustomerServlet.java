package com.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Utils.JWTUtil;
import com.Utils.SessionCookieUtil;
import com.dao.CustomerAccountDao;
import com.daoImpl.CustomerAccountDaoImpl;
import com.model.Customer;
/**
 * Servlet implementation class LoginCustomerServlet
 */
@WebServlet("/LoginCustomer")
public class LoginCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**    private CustomerDao customerDao = new CustomerDaoImpl();

     * @see HttpServlet#HttpServlet()
     */
	private CustomerAccountDao customerDao;

     

    public LoginCustomerServlet() {
        super();
        customerDao = new CustomerAccountDaoImpl();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   String email = request.getParameter("email");
	        String password = request.getParameter("password");
		Customer customer = customerDao.validateCustomer(email, password);
		if (customer != null) {
		    // Generate JWT token
		    String token = JWTUtil.generateToken(customer.getEmail(), customer.getName());
		     SessionCookieUtil.setSessionAttribute(request, "email", email);
	         SessionCookieUtil.setSessionAttribute(request, "role", "user");
	         SessionCookieUtil.setSessionAttribute(request, "token", token);
		    // Send token as response
		    response.setContentType("application/json");
		    response.setStatus(HttpServletResponse.SC_OK);
		    //response.getWriter().write("{\"token\": \"" + token + "\"}");
		} else {
		    // Invalid credentials
		    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		    response.getWriter().write("{\"message\": \"Invalid credentials\"}");
		}
		doGet(request, response);
	}

}
