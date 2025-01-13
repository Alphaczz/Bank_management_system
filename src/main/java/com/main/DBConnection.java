package com.main;
import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnection {
	public static Connection getConnection() {
        // Database details
		Connection connection=null;
        String url = "jdbc:mysql://localhost:3306/bank_management_sys";
        String username = "root"; // Default XAMPP username
        String password = "Abhiraj@123"; // Default XAMPP password is empty

        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Connected to the database!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}
