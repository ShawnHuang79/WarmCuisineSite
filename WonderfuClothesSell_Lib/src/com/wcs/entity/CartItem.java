package com.wcs.entity;

import java.time.LocalDateTime;

public class CartItem implements Comparable<CartItem>{
	private Product product;//PKEY
	private Size size;//PKEY
	private LocalDateTime createdTime = LocalDateTime.now();
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Size getSize() {
		return size;
	}
	public void setSize(Size size) {
		this.size = size;
	}
	//配合畫面的getter
	public int getProductId() {
		return product.getId();
	}
	public String getProductName() {
		return product.getName();
	}
	public String getSizeName() {
		if(size!=null){
			return size.getSizeName();
		}else {
			return "";
		}
	}
	public double getListPrice() {
		if(size!=null) {
			return size.getListPrice();
		}else {
			if(product instanceof Outlet) {
				return ((Outlet)product).getListPrice();
			}
		}
		return product.getUnitPrice();
	}
	public String getDiscountString() {//取得"?折"
		if(product instanceof Outlet) {
			return ((Outlet)product).getDiscountString();
		}
		return "";
	
	}
	public double getUnitPrice() {
		if(size!=null) {
			return size.getUnitPrice();
		}
		return product.getUnitPrice();
	}

	@Override
	public String toString() {
		return this.getClass().getSimpleName() + "產品名稱: " + getProductId() + ", 購買Size: " + getSizeName() + ", 定價: "
				+ getListPrice() + ", 折扣: " + getDiscountString() + ", 售價: " + getUnitPrice();
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((product == null) ? 0 : product.hashCode());
		result = prime * result + ((size == null) ? 0 : size.hashCode());
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
		CartItem other = (CartItem) obj;
		if (product == null) {
			if (other.product != null) {
				return false;
			}
		} else if (!product.equals(other.product)) {
			return false;
		}
		if (size == null) {
			if (other.size != null) {
				return false;
			}
		} else if (!size.equals(other.size)) {
			return false;
		}
		return true;
	}
	@Override
	public int compareTo(CartItem o) {
		int firstCompare = this.createdTime.compareTo(o.createdTime);
		if(firstCompare!=0) {
			return firstCompare;
		}else {
			return hashCode()-o.hashCode();
		}
	}
}
