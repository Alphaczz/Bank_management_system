package com.dao;

import com.model.Transaction;
import com.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {

    // Create a new transaction (deposit/withdrawal)
    public boolean createTransaction(int accountId, String transactionType, double amount, Integer performedBy) {
        String query = "INSERT INTO transaction (account_id, transaction_type, amount, transaction_date, performed_by) VALUES (?, ?, ?, NOW(), ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, accountId);
            stmt.setString(2, transactionType);
            stmt.setDouble(3, amount);
            if (performedBy != null) {
                stmt.setInt(4, performedBy);
            } else {
                stmt.setNull(4, Types.INTEGER);
            }
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Retrieve transactions for a specific account
    public List<Transaction> getTransactionsByAccount(int accountId) {
        List<Transaction> transactions = new ArrayList<>();
        String query = "SELECT * FROM transaction WHERE account_id = ? ORDER BY transaction_date DESC";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, accountId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                transactions.add(new Transaction(
                        rs.getInt("transaction_id"),
                        rs.getInt("account_id"),
                        rs.getString("transaction_type"),
                        rs.getDouble("amount"),
                        rs.getTimestamp("transaction_date"),
                        rs.getObject("performed_by", Integer.class)
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }
}
