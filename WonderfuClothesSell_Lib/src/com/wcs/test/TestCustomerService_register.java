package com.wcs.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import com.wcs.entity.Customer;
import com.wcs.exception.WCSException;
import com.wcs.exception.WCSInvalidDataException;
import com.wcs.service.CustomerService;

public class TestCustomerService_register {

	public static void main(String[] args) {
		Customer c = new Customer();
		try {
			c.setId("F153264687");
			c.setEmail("trenton1025@gmail.com");
			c.setName("吳傑巖");
			c.setPassword("V4wL74a9");
			c.setBirthday("1979-02-06");
			c.setGender('M');
			c.setAddress("臺北市大安區金華街58號11樓之14");
			c.setPhone("0918743903");
			c.setSubscribed(false);
			CustomerService service = new CustomerService();
			service.register(c);
			
			c = service.login("F153264687", "V4wL74a9");
			System.out.println(c);
		//WCSDuplicateEntryException處理
		}catch(WCSInvalidDataException e) {
			Logger.getLogger("測試E02-會員註冊").log(
				Level.SEVERE, e.getMessage(), e);
		}catch(WCSException e) {
			Logger.getLogger("測試E02-會員註冊").log(
				Level.SEVERE, e.getMessage(), e);
		}catch(Exception e) {
			Logger.getLogger("測試E02-會員註冊").log(
					Level.SEVERE, "發生非預期錯誤", e);
		}
		
	}

}
