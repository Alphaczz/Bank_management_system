package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TransactionDAO;

/**
 * Servlet implementation class TransactionServlet
 */
@WebServlet("/transaction")
public class TransactionServlet extends HttpServlet {
    private TransactionDAO transactionDAO;

    @Override
    public void init() {
        transactionDAO = new TransactionDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        String message = "";
        boolean success = false;

        try {
            switch (action) {
                case "transfer":
                    String fromAccount = request.getParameter("fromAccount");
                    String toAccount = request.getParameter("toAccount");
                    double amount = Double.parseDouble(request.getParameter("amount"));
                    
                    success = transactionDAO.transferAmount(fromAccount, toAccount, amount);
                    message = success ? "Transfer successful" : "Transfer failed. Insufficient balance or invalid account.";
                    break;
            }
        } catch (Exception e) {
            message = "An error occurred: " + e.getMessage();
            success = false;
        }

        request.setAttribute("message", message);
        request.setAttribute("success", success);
        request.getRequestDispatcher(success ? "transactionSuccess.jsp" : "transactionError.jsp")
               .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String accountId = request.getParameter("accountId");
        try {
            request.setAttribute("transactions", transactionDAO.getTransactionHistory(accountId));
            request.getRequestDispatcher("transactionHistory.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Failed to fetch transaction history: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
