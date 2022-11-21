package com.wcs.entity;

public enum ShippingType {//餐飲的出貨方式?外帶-10元?自備飲料杯?
	SHOP("店面自取"),//沒給就會是預設0元
	HOME("宅配", 100),
	STORE("超商", 65);
	
	private final String description;
	private final double fee;//必須在建構式中給值
	
	private ShippingType(String description) {
		this(description, 0);
	}

	private ShippingType(String description, double fee) {
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
