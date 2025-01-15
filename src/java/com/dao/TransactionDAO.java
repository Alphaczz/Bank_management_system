package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.model.Transaction;
import com.util.DatabaseConnection;

public class TransactionDAO {
    private Connection connection;

    public TransactionDAO() {
        this.connection = DatabaseConnection.getConnection();
    }

    public boolean createTransaction(Transaction transaction) throws SQLException {
        String sql = "INSERT INTO transactions (account_id, transaction_type, amount, " +
                    "balance, description, status) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, transaction.getAccountId());
            stmt.setString(2, transaction.getTransactionType());
            stmt.setDouble(3, transaction.getAmount());
            stmt.setDouble(4, transaction.getBalance());
            stmt.setString(5, transaction.getDescription());
            stmt.setString(6, transaction.getStatus());
            
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean transferAmount(String fromAccount, String toAccount, double amount) {
        try {
			connection.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try {
            // Check if sender has sufficient balance
            String balanceQuery = "SELECT balance FROM accounts WHERE account_id = ?";
            PreparedStatement balanceStmt = connection.prepareStatement(balanceQuery);
            balanceStmt.setString(1, fromAccount);
            ResultSet rs = balanceStmt.executeQuery();
            
            if (rs.next()) {
                double currentBalance = rs.getDouble("balance");
                if (currentBalance < amount) {
                    connection.rollback();
                    return false;
                }
            }

            // Debit from sender
            String debitSql = "UPDATE accounts SET balance = balance - ? WHERE account_id = ?";
            PreparedStatement debitStmt = connection.prepareStatement(debitSql);
            debitStmt.setDouble(1, amount);
            debitStmt.setString(2, fromAccount);
            debitStmt.executeUpdate();

            // Credit to receiver
            String creditSql = "UPDATE accounts SET balance = balance + ? WHERE account_id = ?";
            PreparedStatement creditStmt = connection.prepareStatement(creditSql);
            creditStmt.setDouble(1, amount);
            creditStmt.setString(2, toAccount);
            creditStmt.executeUpdate();

            // Create transaction records
            createTransaction(new Transaction(0, fromAccount, "DEBIT", amount, 
                           getCurrentBalance(fromAccount), new Timestamp(System.currentTimeMillis()), 
                           "Transfer to " + toAccount, "SUCCESS"));
            
            createTransaction(new Transaction(0, toAccount, "CREDIT", amount, 
                           getCurrentBalance(toAccount), new Timestamp(System.currentTimeMillis()), 
                           "Transfer from " + fromAccount, "SUCCESS"));

            connection.commit();
            return true;
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return false;
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<Transaction> getTransactionHistory(String accountId) throws SQLException {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT * FROM transactions WHERE account_id = ? ORDER BY transaction_date DESC";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, accountId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                transactions.add(new Transaction(
                    rs.getLong("transaction_id"),
                    rs.getString("account_id"),
                    rs.getString("transaction_type"),
                    rs.getDouble("amount"),
                    rs.getDouble("balance"),
                    rs.getTimestamp("transaction_date"),
                    rs.getString("description"),
                    rs.getString("status")
                ));
            }
        }
        return transactions;
    }

    private double getCurrentBalance(String accountId) throws SQLException {
        String sql = "SELECT balance FROM accounts WHERE account_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, accountId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getDouble("balance");
            }
        }
        return 0.0;
    }
}
