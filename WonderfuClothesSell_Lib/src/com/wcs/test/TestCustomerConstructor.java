package com.wcs.test;

import com.wcs.entity.Customer;

public class TestCustomerConstructor {

	public static void main(String[] args) {
		Customer c = new Customer("A123456789", "張三豐", "15254786f");
		System.out.println(c.toString());
		
		/*System.out.println(c.getId());
		System.out.println(c.getName());
		System.out.println(c.getPassword());
		System.out.println(c.getEmail());*/
	}

}
