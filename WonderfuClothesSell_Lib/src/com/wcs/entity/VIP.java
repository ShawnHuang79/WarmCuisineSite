package com.wcs.entity;

public class VIP extends Customer {
 
	private int discount = 5; //5% off
	
	

	public VIP() {
		super();
	}
	public VIP(String id, String name, String password, String email) {
		super(id, name, password, email);
	}
	public VIP(String id, String name, String password) {
		super(id, name, password);
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		if(discount>0 && discount<=90) {
			this.discount = discount;
		}else {
			System.err.println("客戶折扣必需為1%~90% off");
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
	public String toString() {
		return super.toString() + ", 折扣= " + discount + "%";
	}
	
	 
}
 
