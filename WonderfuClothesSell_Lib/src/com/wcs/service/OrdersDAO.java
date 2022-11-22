package com.wcs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;

import com.wcs.entity.Color;
import com.wcs.entity.Order;
import com.wcs.entity.OrderItem;
import com.wcs.entity.Product;
import com.wcs.exception.WCSException;

class OrdersDAO {
	private static final String INSERT_Orders = "INSERT INTO orders\r\n"
			+ "(id, customer_id, created_date, created_time, \r\n"
			+ "	shipping_type, shipping_fee, payment_type, payment_fee,\r\n"
			+ "    recipient_name, recipient_email, recipient_phone, shipping_address)\r\n"
			+ "VALUES(?, ?,?,?, ?,?, ?,?, ?,?,?,?)";
	
	private static final String INSERT_Order_Items = "INSERT INTO order_items\r\n"
			+ "(order_id, product_id, color_name, size_name, price, quantity)\r\n"
			+ "VALUES(?, ?,?,?, ?,?)";
	void insert(Order order)throws WCSException{
		
		try (
				Connection connectrion = MySQLConnection.getConnection(); //1, 2取得連線
				PreparedStatement pstmt1 = connectrion.prepareStatement(INSERT_Orders, Statement.RETURN_GENERATED_KEYS); //3.準備指令1
				PreparedStatement pstmt2 = connectrion.prepareStatement(INSERT_Order_Items); //3.準備指令2
			){
			//先新增訂單主檔
			//3.1 傳入[新增訂單主檔]pstmt1中 ? 的值
			pstmt1.setInt(1, order.getId()); //當order中id<=0，即為自動給號
			pstmt1.setString(2, order.getMember().getId());
			
			LocalDate createdDate = order.getCreatedDate();
			LocalTime createdTime = order.getCreatedTime();
			pstmt1.setString(3, String.valueOf(createdDate!=null?createdDate:LocalDate.now()));
			pstmt1.setString(4, String.valueOf(createdTime!=null?createdTime:LocalTime.now()));
			
			pstmt1.setString(5, order.getShippingType().name());
			pstmt1.setDouble(6, order.getShippingType().getFee());
			
			pstmt1.setString(7, order.getPaymentType().name());
			pstmt1.setDouble(8, order.getPaymentType().getFee());
			
			pstmt1.setString(9, order.getRecipientName());
			pstmt1.setString(10, order.getRecipientEmail());
			pstmt1.setString(11, order.getRecipientPhone());
			pstmt1.setString(12, order.getShippingAddress());
			
			//4.執行[新增訂單主檔]pstmt1
			pstmt1.executeUpdate();
			
			/*** 取得自動給號的訂單代號  ***/
			try(ResultSet rs = pstmt1.getGeneratedKeys()){ 
				while(rs.next()) {
					order.setId(rs.getInt(1));
				}				
			}			
			
			//一筆一筆建立訂單明細
			for(OrderItem orderItem:order.getOrderItemsSet()) {
				//3.1 傳入[新增訂單主檔]pstmt1中 ? 的值
				pstmt2.setInt(1, order.getId());
				
				Product p = orderItem.getProduct();
				pstmt2.setInt(2, p.getId());
				
				String colorName = "";
				Color color = orderItem.getColor();
				if(color!=null) colorName = color.getColorName();
				pstmt2.setString(3, colorName);
				
				pstmt2.setString(4, orderItem.getSizeName());
				pstmt2.setDouble(5, orderItem.getPrice());
				pstmt2.setInt(6, orderItem.getQuantity());
				
				
				//4.執行[新增訂單主檔]pstmt2
				pstmt2.executeUpdate();
			}			
		} catch (SQLException e) {
			throw new WCSException("建立訂單失敗", e);
		}
		
	}
}
