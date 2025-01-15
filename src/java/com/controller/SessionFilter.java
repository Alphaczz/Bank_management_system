package com.controller;


import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class SessionFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);
        String userType = (session != null) ? (String) session.getAttribute("userType") : null;
        String requestURI = httpRequest.getRequestURI();

        // Allow access to login and landing pages
        if (requestURI.contains("landingPage.jsp") || requestURI.contains("LoginServlet")) {
            chain.doFilter(request, response);
            return;
        }

        // Restrict access to employee or customer pages based on session
        if (userType == null || 
            (requestURI.contains("customer") && !userType.equals("customer")) || 
            (requestURI.contains("employee") && !userType.equals("employee"))) {
            httpResponse.sendRedirect("landingPage.jsp");
            return;
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {}
}
