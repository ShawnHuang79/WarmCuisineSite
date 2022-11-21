package com.wcs.entity;

public enum PaymentType {//店面付款、信用卡、ATM轉帳?
	SHOP("店面付款"),//沒給就會是預設0元
	ATM("ATM轉帳"),
	HOME("貨到付款", 50),
	STORE("超商付款", 65),
	CARD("信用卡");
	
	private final String description;
	private final double fee;//必須在建構式中給值
	
	private PaymentType(String description) {
		this(description, 0);
	}

	private PaymentType(String description, double fee) {
		this.description = description;
		this.fee = fee;
	}



	public String getDescription() {
		return description;
	}
	
	public double getFee() {
		return fee;
	}
	@Override
	public String toString() {
		return description + (fee<=0?"":","+fee+"元");
	}
}
