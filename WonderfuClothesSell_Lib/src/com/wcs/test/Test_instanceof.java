package com.wcs.test;


import com.wcs.entity.Customer;
import com.wcs.entity.VIP;

public class Test_instanceof {

	public static void main(String[] args) {
		Object o = new Object();
		Customer c = new Customer();
		VIP v = new VIP();
		String s = "";
		
		System.out.println(o instanceof Object);//true
		System.out.println(c instanceof Object);//true
		System.out.println(v instanceof Object);//true
		System.out.println(s instanceof Object);//true

		System.out.println(o instanceof Customer);//false
		System.out.println(c instanceof Customer);//true
		System.out.println(v instanceof Customer);//true
		//System.out.println(s instanceof Customer);//無法編譯
		
		System.out.println(o instanceof VIP);//false
		System.out.println(c instanceof VIP);//false
		System.out.println(v instanceof VIP);//true
		//System.out.println(s instanceof VIP);//無法編譯
		
		System.out.println(o instanceof String);//false
		//System.out.println(c instanceof String);//無法編譯
		//System.out.println(v instanceof String);//無法編譯
		System.out.println(s instanceof String);//true
		
		System.out.println(o.getClass() == Object.class);//true
		//System.out.println(c.getClass() == Object.class);//無法編譯
		//System.out.println(v.getClass() == Object.class);//無法編譯
		//System.out.println(s.getClass() == Object.class);//無法編譯
		
		System.out.println(o.getClass() == Customer.class);//false
		System.out.println(c.getClass() == Customer.class);//true
		//System.out.println(v.getClass() == Customer.class);//無法編譯
		//System.out.println(s.getClass() == Customer.class);//無法編譯
		
		System.out.println(o.getClass() == VIP.class);//false
		System.out.println(c.getClass() == VIP.class);//false
		System.out.println(v.getClass() == VIP.class);//true
		//System.out.println(s.getClass() == VIP.class);//無法編譯
		
		System.out.println(o.getClass() == String.class);//false
		//System.out.println(c.getClass() == String.class);//無法編譯
		//System.out.println(v.getClass() == String.class);//無法編譯
		System.out.println(s.getClass() == String.class);//true

		Object o1 = null;
		Customer c1 = null;
		VIP v1 = null;
		String s1 = null;
		
		System.out.println(o1 instanceof Object);//false
		System.out.println(c1 instanceof Object);//false
		System.out.println(v1 instanceof Object);//false
		System.out.println(s1 instanceof Object);//false
		
		System.out.println(o1 instanceof Customer);//false
		System.out.println(c1 instanceof Customer);//false
		System.out.println(v1 instanceof Customer);//false
		//System.out.println(s instanceof Customer);//無法編譯
		
		System.out.println(o1 instanceof VIP);//false
		System.out.println(c1 instanceof VIP);//false
		System.out.println(v1 instanceof VIP);//false
		//System.out.println(s instanceof VIP);//無法編譯
		
		System.out.println(o1!=null && o1.getClass() == Object.class);
		
	}
}
