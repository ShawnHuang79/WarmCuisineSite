package com.wcs.service;

import com.wcs.entity.Order;
import com.wcs.exception.WCSException;

public class OrderService {
	private OrdersDAO dao = new OrdersDAO();
	
	public void checkOut(Order order)throws WCSException{
		if(order==null || order.isEmpty()) 
			throw new IllegalArgumentException("建立訂單時，order物件不得為null且必須有一~多筆訂購明細");
		dao.insert(order);
	}
}
