package com.wcs.test;

import java.time.LocalDate;

import com.wcs.entity.Outlet;
import com.wcs.entity.Product;

public class TestProduct {

	public static void main(String[] args) {
		Product p = new Product();
		Product p2 = new Product();
		Outlet o = new Outlet();
		p.setId(12);
		p.setName("最新Java");
		p.setUnitPrice(680);
		p.setStock(12);
		p.setPhotoUrl("https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/091/85/0010918576.jpg&v=62204450k&w=348&h=348");
		p.setLaunchDate(LocalDate.now());
		
		p2.setId(12);
		
		System.out.println(p);
		System.out.println(p.equals(o));
		System.out.println(p.equals(p2));
		
		/*System.out.println(p.getId());
		System.out.println(p.getName());
		System.out.println(p.getUnitPrice());
		System.out.println(p.getStock());
		System.out.println(p.getPhotoUrl());
		System.out.println(p.getDescription());
		System.out.println(p.getLaunchDate());*/
	}

}
