package com.wcs.test;

import java.time.LocalDate;

import com.wcs.entity.Customer;

public class TestCustomer2 {

	public static void main(String[] args) {
		Customer member = new Customer();
		member.setId("A123456789");
		member.setEmail("test@gmail.com");
		member.setName("張三豐");
		member.setPassword("12345;lkj");
		member.setBirthday(2001,2,3);
		member.setGender('M');
		
		member.setAddress("台北市");
		member.setPhone("02-25149191");
		
		System.out.println(member.getId());
		System.out.println(member.getEmail());
		System.out.println(member.getName());
		System.out.println(member.getPassword());
		System.out.println(member.getBirthday());
		System.out.println(member.getGender());
		
		System.out.println(member.getAddress());
		System.out.println(member.getPhone());
		System.out.println(member.isSubscribed());
	}

}
