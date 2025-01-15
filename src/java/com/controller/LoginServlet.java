package com.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userType = request.getParameter("userType"); // "customer" or "employee"
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        
        if (userType.equals("customer")) {
            // Validate customer login
            if (isValidCustomer(userId, password)) {
                session.setAttribute("userType", "customer");
                session.setAttribute("userId", userId);
                response.sendRedirect("customerDashboard.jsp");
            } else {
                request.setAttribute("error", "Invalid Customer Credentials!");
                request.getRequestDispatcher("customerLogin.jsp").forward(request, response);
            }
        } else if (userType.equals("employee")) {
            // Validate employee login
            if (isValidEmployee(userId, password)) {
                session.setAttribute("userType", "employee");
                session.setAttribute("userId", userId);
                response.sendRedirect("employeeDashboard.jsp");
            } else {
                request.setAttribute("error", "Invalid Employee Credentials!");
                request.getRequestDispatcher("employeeLogin.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("landingPage.jsp");
        }
    }

    private boolean isValidCustomer(String userId, String password) {
        // Placeholder for customer validation logic (e.g., database lookup)
        return "customer123".equals(userId) && "password123".equals(password);
    }

    private boolean isValidEmployee(String userId, String password) {
        // Placeholder for employee validation logic (e.g., database lookup)
        return "employee123".equals(userId) && "password123".equals(password);
    }
}
