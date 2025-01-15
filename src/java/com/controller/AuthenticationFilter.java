//package com.controller;
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.*;
//import java.io.IOException;
//
//@WebFilter("/*")
//public class AuthenticationFilter implements Filter {
//    
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//        
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpServletResponse httpResponse = (HttpServletResponse) response;
//        HttpSession session = httpRequest.getSession(false);
//        
//        String loginURI = httpRequest.getContextPath() + "/login";
//        boolean isLoginRequest = httpRequest.getRequestURI().equals(loginURI);
//        boolean isLoginPage = httpRequest.getRequestURI().endsWith("login.jsp");
//        boolean isResourceRequest = httpRequest.getRequestURI().startsWith(httpRequest.getContextPath() + "/resources/");
//        
//        if (isLoginRequest || isLoginPage || isResourceRequest || (session != null && session.getAttribute("user") != null)) {
//            chain.doFilter(request, response);
//        } else {
//            httpResponse.sendRedirect(loginURI);
//        }
//    }
//    
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {}
//    
//    @Override
//    public void destroy() {}
//}