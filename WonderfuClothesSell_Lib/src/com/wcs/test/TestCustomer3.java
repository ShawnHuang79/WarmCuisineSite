package com.wcs.test;

import java.time.LocalDate;

import com.wcs.entity.Customer;

public class TestCustomer3 {

	public static void main(String[] args) {
		Customer member = new Customer();
		member.setId("A123456789");
		member.setEmail("test@gmail.com");
		member.setName("張三豐");
		member.setPassword("123hjfk4");
		member.setBirthday(2001,2,3);
		member.setGender('M');
		
		member.setAddress("台北市");
		member.setPhone("02-25149191");
		System.out.println(member);
		
		Customer m2 = new Customer();
		m2.setId("A123123123");
		m2.setEmail("test@gmail.com");
		m2.setName("張四豐");
		m2.setPassword("12345;lkj");
		m2.setBirthday(2001,2,3);
		m2.setGender('M');
		
		m2.setAddress("台北市");
		m2.setPhone("02-25149191");
		System.out.println(m2);

	}

}
