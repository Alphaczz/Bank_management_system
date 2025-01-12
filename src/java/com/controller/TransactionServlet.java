package com.controller;

import com.dao.TransactionDAO;
import com.model.Transaction;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

public class TransactionServlet extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("jsp/accountHolder/login.jsp");
            return;
        }

        int accountId = Integer.parseInt(request.getParameter("accountId"));
        String transactionType = request.getParameter("transactionType");
        double amount = Double.parseDouble(request.getParameter("amount"));
        Integer performedBy = (Integer) session.getAttribute("employeeId"); // Nullable for self-service

        TransactionDAO transactionDAO = new TransactionDAO();
        boolean isSuccess = transactionDAO.createTransaction(accountId, transactionType, amount, performedBy);

        if (isSuccess) {
            request.setAttribute("message", "Transaction successful!");
        } else {
            request.setAttribute("error", "Transaction failed. Please try again.");
        }
        request.getRequestDispatcher("jsp/accountHolder/transaction.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("jsp/accountHolder/login.jsp");
            return;
        }

        int accountId = Integer.parseInt((String) session.getAttribute("accountId"));
        TransactionDAO transactionDAO = new TransactionDAO();
        List<Transaction> transactions = transactionDAO.getTransactionsByAccount(accountId);

        request.setAttribute("transactions", transactions);
        request.getRequestDispatcher("jsp/accountHolder/viewTransactions.jsp").forward(request, response);
    }
}
