package com.wcs.test;

import java.util.ArrayList;
import java.util.List;

public class TestWrapperClasses {

	public static void main(String[] args) {
		String qtyString = "2";
		double price = 10;
		int qty = Integer.parseInt(qtyString);
		System.out.println(qty * price);
		
		String sizeString = "10.5";
		Double size = Double.parseDouble(sizeString);
		System.out.println("尺寸: " + size);
		
		
		
		List<Integer> intList = new ArrayList<Integer>();
		intList.add(1);
		
		//double answer =
		
	}

}
