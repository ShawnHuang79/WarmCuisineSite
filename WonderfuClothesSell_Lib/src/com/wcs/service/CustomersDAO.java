package com.wcs.service;

import java.sql.*;

import com.wcs.entity.Customer;
import com.wcs.entity.VIP;
import com.wcs.exception.WCSDuplicateEntryException;
import com.wcs.exception.WCSException;

class CustomersDAO {
	
	private static final String SELECT_Customer_BY_id = "SELECT id, email, name, password, birthday,"
			+ "gender, address, phone, subscribed FROM customers"
			+ "	WHERE id=? OR email=?";//這裡欄位錯的錯誤訊息是field
	Customer selectCustomer(String idOrEmail) throws WCSException{
		Customer c = null;
		
		try (
				//1.2取得連線
				Connection connection = MySQLConnection.getConnection();
				//3.準備指令
				PreparedStatement pstmt = connection.prepareStatement(SELECT_Customer_BY_id);
		){
			pstmt.setString(1, idOrEmail);
			pstmt.setString(2, idOrEmail);//3.1傳入?值
			try(
				ResultSet rs = pstmt.executeQuery();//4.執行指令
			){
				while(rs.next()) {//5.處理rs
					/*int discount = rs.getInt("discount");//上課範例用，沒有
					if(discount>0) {
						c = new VIP();
						((VIP)c).setDiscount(discount);
					}else {
						c= new Customer();
					}*/
					c = new Customer();
					
					c.setId(rs.getString("id"));
					c.setEmail(rs.getString("email"));
					c.setName(rs.getString("name"));//這裡欄位打錯是出現column
					c.setPassword(rs.getString("password"));
					c.setBirthday(rs.getString("birthday"));
					c.setGender(rs.getString("gender").charAt(0));
					c.setAddress(rs.getString("address"));
					c.setPhone(rs.getString("phone"));
					c.setSubscribed(rs.getBoolean("subscribed"));

				}
			}
		
		}catch(SQLException e) {
			throw new WCSException("查詢客戶失敗", e);
		}
		return c;
	}
	
	private static final String INSERT_CUSTOMER= "INSERT INTO customers "
			+ "(id, email, name, password, birthday, gender, address, "
			+ "phone, subscribed) "
			+ "VALUES(?,?,?,?,?,?, ?,?,?)";
	public void insert(Customer c) throws WCSException{
		
		try (
			Connection connection = MySQLConnection.getConnection();//1,2 取得連線
			PreparedStatement pstmt = connection.prepareStatement(INSERT_CUSTOMER);//3.準備指令
			){
			//3.1傳入?值
			pstmt.setString(1, c.getId());
			pstmt.setString(2, c.getEmail());
			pstmt.setString(3, c.getName());
			pstmt.setString(4, c.getPassword());
			pstmt.setString(5, String.valueOf(c.getBirthday()));//寫.toString()也可以
			pstmt.setString(6, String.valueOf(c.getGender()));
			pstmt.setString(7, c.getAddress());
			pstmt.setString(8, c.getPhone());
			pstmt.setBoolean(9, c.isSubscribed());
			//4.執行指令
			pstmt.executeUpdate();
			
			
		}catch(SQLIntegrityConstraintViolationException e) {
			if(e.getMessage().indexOf("customers.PRIMARY")>-1) {
				throw new WCSDuplicateEntryException("帳號", e);
			}else if(e.getMessage().indexOf("customers.email_UNIQUE")>-1) {
				throw new WCSDuplicateEntryException("email", e);
			}else {
				throw new WCSException("新增客戶失敗", e);
			}
		} catch (SQLException e) {
			throw new WCSException("新增客戶失敗", e);
		}
	}
}