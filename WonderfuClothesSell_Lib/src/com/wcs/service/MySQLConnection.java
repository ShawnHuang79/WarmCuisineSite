package com.wcs.service;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.wcs.exception.WCSException;
public class MySQLConnection {
	private static final String driver; //= "com.mysql.cj.jdbc.Driver";
	private static final String url; //= "jdbc:mysql://localhost:3306/wcs";
	private static final String user; //= "root";
	private static final String password; //= "1234";
	
	static {
		driver = System.getProperty("driver","com.mysql.cj.jdbc.Driver");
		url = System.getProperty("url","jdbc:mysql://localhost:3306/wcs");
		user = System.getProperty("user","root");
		password = System.getProperty("password","1234");
	}
	
	public static Connection getConnection() throws WCSException{
		try {
			//載入drive的類別定義
			Class.forName(driver);
			//建立連線
			try {
				Connection connection = DriverManager.getConnection(url, user, password);
				System.out.println(connection.getClass().getName());
				return connection;
			} catch (SQLException e) {
				//System.out.println("建立連線失敗");
				//Logger.getLogger("測試資料庫連線").log(Level.SEVERE, "建立連線失敗", e);
				throw new WCSException("建立連線失敗", e);
			}
		} catch (ClassNotFoundException e) {
			//System.out.println("無法載入JDBC driver: " + driver);
			//Logger.getLogger("建立資料庫連線測試").log(Level.SEVERE, "無法載入JDBC Driver: ", driver);
			throw new WCSException("無法載入JDBC Driver: " + driver);
		}
	}

}
