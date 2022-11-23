package com.wcs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import com.wcs.entity.Color;
import com.wcs.entity.Order;
import com.wcs.entity.OrderItem;
import com.wcs.entity.PaymentType;
import com.wcs.entity.Product;
import com.wcs.entity.ShippingType;
import com.wcs.exception.WCSException;


class OrdersDAO {
	private static final String INSERT_Orders = "INSERT INTO orders\r\n"
			+ "(id, customer_id, created_date, created_time, \r\n"
			+ "	shipping_type, shipping_fee, payment_type, payment_fee,\r\n"
			+ "    recipient_name, recipient_email, recipient_phone, shipping_address)\r\n"
			+ "VALUES(?, ?,?,?, ?,?, ?,?, ?,?,?,?)";
	
	private static final String INSERT_Order_Items = "INSERT INTO order_items\r\n"
			+ "(order_id, product_id, size_name, price, quantity)\r\n"
			+ "VALUES(?, ?,?, ?,?)";
	
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

				pstmt2.setString(3, orderItem.getSizeName());
				pstmt2.setDouble(4, orderItem.getPrice());
				pstmt2.setInt(5, orderItem.getQuantity());
				/*String colorName = "";
				Color color = orderItem.getColor();
				if(color!=null) colorName = color.getColorName();
				pstmt2.setString(3, colorName);*/
				
				
				//4.執行[新增訂單主檔]pstmt2
				pstmt2.executeUpdate();
			}			
		} catch (SQLException e) {
			throw new WCSException("建立訂單失敗", e);
		}
		
	}
	
	private static final String SELECT_ORDERS_HISTORY="SELECT id, customer_id, created_date, created_time, "
			+ "SUM(price * quantity) AS total_amount, status, "
			+ "	shipping_type, shipping_fee, shipping_note, payment_type, payment_fee, payment_note "
			+ " FROM orders  "
			+ "	INNER JOIN order_items ON orders.id=order_items.order_id "
			+ " WHERE orders.customer_id=?  "
			+ " GROUP BY orders.id "
			+ " ORDER BY created_date DESC, created_time DESC";	
	
	
	List<Order> selectOrdersHistory(String memberId) throws WCSException {
		List<Order> list = new ArrayList<>();
		try (
				Connection connection = MySQLConnection.getConnection(); //1, 2取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDERS_HISTORY); //3.準備指令
		){
			//3.1 傳入?的值
			pstmt.setString(1, memberId);
			
			
			try(ResultSet rs = pstmt.executeQuery() //4.執行指令
					){
				//5.處理rs
				while(rs.next()) {
					Order order = new Order();
					order.setId(rs.getInt("id"));
					order.setCreatedDate(LocalDate.parse(rs.getString("created_date")));
					order.setCreatedTime(LocalTime.parse(rs.getString("created_time")));					
					order.setTotalAmount(rs.getDouble("total_amount"));
					//System.out.println(rs.getDouble("total_amount"));
					System.out.println(order.getOrderItemsSet());
					order.setStatus(rs.getInt("status"));
					
					order.setShippingType(ShippingType.valueOf(rs.getString("shipping_type")));
					order.setShippingFee(rs.getDouble("shipping_fee"));
					
					order.setPaymentType(PaymentType.valueOf(rs.getString("payment_type")));
					order.setPaymentFee(rs.getDouble("payment_fee"));					
					
					list.add(order);
					System.out.println(list.get(0).getTotalAmount());
				}
			}
		} catch (SQLException e) {
			throw new WCSException("查詢歷史訂單失敗", e);
		
		}
		return list;
	}
	
	
	private static final String SELECT_Order_By_OrderId=
			"SELECT  id, customer_id, created_date, created_time, shipping_type, shipping_fee, shipping_note, payment_type, payment_fee, "
			+ "payment_note, status, recipient_name, recipient_email, recipient_phone, shipping_address, "
			+ " order_id, product_id, size_name, price, quantity, amount, "
			+ " product_name, photo_url "
			+ " FROM wcs.order_view"
			+ " WHERE customer_id=? AND id=?"; // 從wcs.order_view查
	Order selectOrderByOrderId (String memberId, String orderId) throws WCSException{
		Order order = null;
		
		try (
				Connection connection = MySQLConnection.getConnection(); //1, 2取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_Order_By_OrderId); //3.準備指令
		){
			//3.1 傳入?的值
			pstmt.setString(1, memberId);
			pstmt.setString(2, orderId);
			
			
			try(ResultSet rs = pstmt.executeQuery() //4.執行指令
					){
				//5.處理rs
				while(rs.next()) {
					if(order==null){//為什麼要寫這行?上面才宣告null這裡不是一定null?
						order = new Order();
						order.setId(rs.getInt("id"));
						order.setCreatedDate(LocalDate.parse(rs.getString("created_date")));
						order.setCreatedTime(LocalTime.parse(rs.getString("created_time")));
						order.setStatus(rs.getInt("status"));
						
						order.setShippingType(ShippingType.valueOf(rs.getString("shipping_type")));
						order.setShippingFee(rs.getDouble("shipping_fee"));
						order.setShippingNote(rs.getString("shipping_note"));
						
						order.setPaymentType(PaymentType.valueOf(rs.getString("payment_type")));
						order.setPaymentFee(rs.getDouble("payment_fee"));
						order.setPaymentNote(rs.getString("payment_note"));
						
						order.setRecipientName(rs.getString("recipient_name"));
						order.setRecipientEmail(rs.getString("recipient_email"));
						order.setRecipientPhone(rs.getString("recipient_phone"));
						order.setShippingAddress(rs.getString("shipping_address"));						
					}
					
					OrderItem orderItem = new OrderItem();
					orderItem.setOrderId(rs.getInt("order_id"));
					
					Product p = new Product();
					p.setId(rs.getInt("product_id"));
					p.setName(rs.getString("product_name"));
					p.setPhotoUrl(rs.getString("photo_url"));
					orderItem.setProduct(p);
					
					orderItem.setSizeName(rs.getString("size_name"));
					orderItem.setPrice(rs.getDouble("price"));
					orderItem.setQuantity(rs.getInt("quantity"));				
					order.add(orderItem);
					
					/*String colorName = rs.getString("color_name");
					if(colorName!=null && colorName.length()>0) {
						Color color = new Color();
						color.setColorName(colorName);
						color.setPhotoUrl(rs.getString("color_photo"));
						orderItem.setColor(color);
					}*/
				}
			}
		} catch (SQLException e) {
			throw new WCSException("查詢訂單明細失敗", e);		
		}
		return order;
	}
	//TODO 還沒改
	private static final String UPDATE_orders_status_To_ATMtransfered="UPDATE orders"
			+ "	SET payment_note=?, status=" + Order.Status.TRANSFERED.ordinal()
			+ "    WHERE customer_id=? AND id=? "
			+ "		AND payment_type='"+PaymentType.ATM.name()+"' AND status=" + Order.Status.NEW.ordinal();
	void updateStatusToATMTransfered(String memberId, String orderId, 
											String paymentNote) throws WCSException{
		try (
				Connection connection = MySQLConnection.getConnection(); //1, 2取得連線
				PreparedStatement pstmt = connection.prepareStatement(UPDATE_orders_status_To_ATMtransfered); //3.準備指令
		){
			//3.1 傳入?的值
			pstmt.setString(1, paymentNote);
			pstmt.setString(2, memberId);
			pstmt.setString(3, orderId);
			//4.執行指令
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new WCSException("[通知轉帳]失敗", e);		
		}
		
	}

}
