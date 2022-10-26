package com.wcs.test;

import java.io.FileReader;

import com.wcs.entity.Product;

public class TestProductPassByValue {

	public static void main(String[] args) {
		int i = 1;
		int j = 1;
		i = i+1;
		System.out.println(i);
		System.out.println(j);
		
		Product p = new Product(1, "最新Java", 680);
		
		PassByValueDemoModel model = new PassByValueDemoModel();
		
		double price = p.getUnitPrice();
		model.addPrice(price);
		
		model.addPrice(p);
		
		
		
	}
}

class PassByValueDemoModel{
	public void addPrice(double price) {
		price = price + 100;
	}
	public void addPrice(Product p) {
		p.setUnitPrice(p.getUnitPrice()+100);
	}
}