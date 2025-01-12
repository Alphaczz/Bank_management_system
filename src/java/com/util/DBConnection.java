package com.util;

import java.sql.*;

public class DBConnection {

	
	public static Connection getConnection()
	{
		Connection con=null;
		try {
			Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
			con=DriverManager.getConnection("jdbc:derby:C:\\\\Users\\\\2289557\\\\MyDB;create=true");
		
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
		

}
