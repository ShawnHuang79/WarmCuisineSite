package com.wcs.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.wcs.exception.WCSException;
import com.wcs.service.MySQLConnection;

public class TestMySQLConnection {

	public static void main(String[] args) {
		try (Connection connection = MySQLConnection.getConnection()
			){
			System.out.println(connection.getCatalog());
		}catch (SQLException e) {
			Logger.getLogger("測試資料庫連線").log(Level.SEVERE, "建立連線失敗", e);
			
		}catch (WCSException e) {
			Logger.getLogger("測試資料庫連線").log(Level.SEVERE, "系統錯誤", e);
		}
		
		System.out.println("The End");
	}

}
