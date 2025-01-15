package com.controller;

import com.util.*;
import com.model.*;
import java.sql.*;

public class AuthenticationService {
    
    public User authenticate(String username, String password) throws Exception {
        User user = null;
        String query = "SELECT * FROM USERS WHERE USERNAME = ? AND PASSWORD = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setString(1, username);
            pstmt.setString(2, password); // In production, use password hashing
            
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("USER_ID"));
                user.setUsername(rs.getString("USERNAME"));
                user.setRole(rs.getString("ROLE"));
                user.setActive(rs.getBoolean("IS_ACTIVE"));
            }
        }
        
        return user;
    }
}