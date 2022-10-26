package com.wcs.service;

import com.wcs.entity.Customer;
import com.wcs.exception.WCSException;

public class CustomerService {
	private CustomersDAO dao = new CustomersDAO();
	
	public Customer login(String idOrEmail, String pwd) throws WCSException{
		if(idOrEmail==null || pwd==null) {
			throw new IllegalArgumentException("會員登入，帳號密碼不得為null");
		}

		Customer c = dao.selectCustomer(idOrEmail);
		if(c!=null && pwd!=null && pwd.equals(c.getPassword())) {
			return c;
		}
		throw new WCSException("登入失敗，帳號或密碼不正確！");//有錯誤的時候拋出給使用者，如果在這裡處理掉，使用者會得不到回應。
	}
	public void register(Customer c) throws WCSException{
		if(c==null)throw new IllegalArgumentException(
				"會員註冊，Customer物件c度不得為null");
		
		dao.insert(c);
	}
	
}
