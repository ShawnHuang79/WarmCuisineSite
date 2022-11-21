package com.wcs.entity;


public class OrderItem {
	private int orderId; //PKEY
	private Product product; //PKEY
	private String sizeName; //PKEY
	private double price; 
	private int quantity;
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}

	public String getSizeName() {
		if(sizeName==null) return "";
		return sizeName;
	}
	public void setSizeName(String sizeName) {
		this.sizeName = sizeName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getProductId() {
		return product.getId();
	}
	public String getProductName() {
		return product.getName();
	}	
	public String getPhotoUrl() {
			return product.getPhotoUrl();
		
	}

	public double getAmount() {
		return this.price * this.quantity;
	}	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + orderId;
		result = prime * result + ((product == null) ? 0 : product.hashCode());
		result = prime * result + ((sizeName == null) ? 0 : sizeName.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		OrderItem other = (OrderItem) obj;
		if (orderId != other.orderId) {
			return false;
		}
		if (product == null) {
			if (other.product != null) {
				return false;
			}
		} else if (!product.equals(other.product)) {
			return false;
		}
		if (sizeName == null) {
			if (other.sizeName != null) {
				return false;
			}
		} else if (!sizeName.equals(other.sizeName)) {
			return false;
		}
		return true;
	}


	@Override
	public String toString() {
		return this.getClass().getSimpleName() + 
				"[訂單編號=" + orderId 
				 + ", 訂購明細[" + getProductId() + "-" + getSizeName()   
				 	+ "],\n 產品名稱:" + getProductName()
				 + ",\n 照片=" + getPhotoUrl() 
				 + ",\n 交易價=" + price + ", 購買數量=" + quantity + ", 小計="+ getAmount() + "]";
	}
}
