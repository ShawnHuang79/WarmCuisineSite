package com.wcs.test;

import java.time.LocalDate;

import com.wcs.entity.Outlet;

public class TestOutlet {

	public static void main(String[] args) {
		Outlet outlet = new Outlet();
		outlet.setId(1);
		outlet.setName("最新Java");
		outlet.setUnitPrice(680);
		outlet.setStock(12);
		outlet.setPhotoUrl("https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/091/85/0010918576.jpg&v=62204450k&w=348&h=348");
		outlet.setLaunchDate(LocalDate.now());
		outlet.setDiscount(21);
		System.out.println(outlet);
		
//		System.out.println("產品編號: " + outlet.getId());
//		System.out.println("產品名稱: " + outlet.getName());
//		System.out.println("產品定價: " + outlet.getListPrice());
//		System.out.println("產品庫存: " + outlet.getStock());
//		System.out.println("產品網址: " + outlet.getPhotoUrl());
//		System.out.println("產品說明: " + outlet.getDescription());
//		System.out.println("產品: " + outlet.getLaunchDate());
//		System.out.println("產品折扣: " + outlet.getDiscount());
//		System.out.println("產品中文折扣: " + outlet.getDiscountString());
//		System.out.println("產品售價: " + outlet.getUnitPrice());
	}

}
