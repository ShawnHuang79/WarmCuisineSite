package com.wcs.test;

import com.wcs.entity.Customer;

public class TestPolymorphism {

	public static void main(String[] args) {
		Object o = new Object();
		
		System.out.println(o.toString());
		
		String s = "Hello"; 
		Object obj = s; //obj is a polymorphic variable
		
		System.out.println(s.toString());
		System.out.println(obj.toString());
		
		System.out.println(s.length());
		System.out.println(((String)obj).length());
		
		System.out.println(obj == s);
		obj = new Customer("A123123123", "張三豐", "12d345;lkj");
	}

}
