package com.wcs.test;

import java.time.LocalDate;

import com.wcs.entity.Customer;

public class TestCystomerBirthdayAge {

	public static void main(String[] args) {
		Customer member = new Customer();
		member.setId("A123123123");
		System.out.println(member.getId());
		member.setEmail("test@gmail.com");
		member.setName("張三豐");
		member.setPassword("5;48ulkj");
		//member.birthday = LocalDate.of(2001,2,3);
		member.setBirthday(2001,02,02);
		member.setGender('M');
		System.out.println(member.getAge());
		member.getAge();
		member.setBirthday(2001,2,3);
		System.out.println(member.getBirthday());
		member.setPhone("0972126587");
		System.out.println(member.getPhone());
	}
		


}
