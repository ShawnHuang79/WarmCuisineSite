package com.wcs.test;

import com.wcs.entity.VIP;

public class TestVIP {

	public static void main(String[] args) {
		VIP v = new VIP();
		v.setId("A123123123");
		v.setName("林梅莉");
		v.setPassword("12345;klj");
		v.setEmail("mary.lin.tw@uuu.com.tw");
		v.setBirthday(2000,10,11);
		v.setGender('F');
		v.setDiscount(15);
		
		System.out.println(v);
//		System.out.println("id: "+ v.getId());
//		System.out.println("name: "+ v.getName());
//		System.out.println("password: "+ v.getPassword());
//		System.out.println("email: "+ v.getEmail());
//		System.out.println("birthday: "+ v.getBirthday());
//		System.out.println("gender: "+ v.getGender());
//		
//		System.out.println("discount: "+ v.getDiscount());
//		System.out.println("中文折扣: "+ v.getDiscountString());
	}

}
