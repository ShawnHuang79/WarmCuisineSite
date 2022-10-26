package com.wcs.entity;

public class Outlet extends Product {
	private int discount; //必要

	public Outlet() {
		super();
	}
	public Outlet(int id, String name, double price, int discount) {
		super(id, name, price);
		this.discount = discount;
	}
	public Outlet(int id, String name, double price) {
		super(id, name, price);
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		if(discount>0 && discount<=90) {
			this.discount = discount;
		}else {
			System.err.println("Outlet折扣必需為1%~90% off");
			//TODO 拋出exception
		}
	}
	public String getDiscountString() {
		int discount = 100 - this.discount;
		if(discount%10 == 0) {
			discount = discount/10;
		}
		return discount + "折";
	}
	@Override
	public double getUnitPrice() {
		double price =
				super.getUnitPrice() * (100- this.discount) /100;
		return price;
	}
	public double getListPrice() {
		return super.getUnitPrice();
	}
	@Override
	public String toString() {
		return super.toString() +
				", 折扣" + discount + "%" + ", 售價" + getUnitPrice()
				;
	}
	
}
