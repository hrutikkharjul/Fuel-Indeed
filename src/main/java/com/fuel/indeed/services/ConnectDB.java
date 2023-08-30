package com.fuel.indeed.services;
import java.sql.*;
public class ConnectDB {
	public static Connection con;
	public static void connect() {
		if(con==null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuelDB","root","");
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
