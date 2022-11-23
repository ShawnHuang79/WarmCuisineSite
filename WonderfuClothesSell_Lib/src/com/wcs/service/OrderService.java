package com.wcs.service;

import java.time.LocalDate;
import java.util.List;

import com.wcs.entity.Order;
import com.wcs.exception.WCSException;


public class OrderService {
	private OrdersDAO dao = new OrdersDAO();
	
	public void checkOut(Order order)throws WCSException{
		if(order==null || order.isEmpty()) 
			throw new IllegalArgumentException("建立訂單時，order物件不得為null且必須有一~多筆訂購明細");
		dao.insert(order);
	}
	public List<Order> getOrderHistory (String memberId) throws WCSException{
		if(memberId==null || memberId.length()==0) 
			throw new IllegalArgumentException("查詢歷史訂單時，會員帳號必須有值");
		return dao.selectOrdersHistory(memberId);
	}
	
	public Order getOrderByMemberIdAndOrderId (String memberId, String orderId) throws WCSException{
		if(memberId==null || memberId.length()==0 || orderId==null || orderId.length()==0) 
			throw new IllegalArgumentException("查詢訂單時，會員帳號/訂單編號必須有值");
		Order order = dao.selectOrderByOrderId(memberId, orderId);		
		return order;
	}
	
	public void atmTransfered(String memberId,String orderId, 
			String bank,String last5Code, double amount,
			LocalDate transDate, String transTime) throws WCSException{
		String paymentNote = 
				bank + ",後5碼:" + last5Code + ",金額: "+amount
				+ ",時間:" + transDate + " " + transTime	;
		dao.updateStatusToATMTransfered(memberId, orderId, paymentNote);
	}
}
