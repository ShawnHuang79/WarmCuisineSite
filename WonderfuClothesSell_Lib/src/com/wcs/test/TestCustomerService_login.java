package com.wcs.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import com.wcs.entity.Customer;
import com.wcs.exception.WCSException;
import com.wcs.service.CustomerService;

public class TestCustomerService_login {

	public static void main(String[] args) {
		CustomerService service = new CustomerService();
		try {
			Customer c = service.login("A158841858", "8eeUgtYN");
			System.out.println(c);
		}catch (WCSException e) {
			Logger.getLogger("測試會員登入功能").log(
					Level.SEVERE, e.getMessage(), e);
		}catch(Exception e) {
			Logger.getLogger("測試會員登入功能").log(
					Level.SEVERE, "發生錯誤", e);
		}
		
	}

}
