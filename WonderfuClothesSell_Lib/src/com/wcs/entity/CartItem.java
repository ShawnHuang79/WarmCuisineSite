package com.wcs.entity;

import java.time.LocalDateTime;

public class CartItem {
	private Product product;//PKEY
	private Color color;//PKEY
	private Size size;//PKEY
	private LocalDateTime createdTime = LocalDateTime.now();
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Color getColor() {
		return color;
	}
	public void setColor(Color color) {
		this.color = color;
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
	public String getColorName() {
		if(color!=null){
			return color.getColorName();
		}else {
			return "";
		}
	}
	public String getSizeName() {
		if(size!=null){
			return color.getSizeName();
		}else {
			return "";
		}
	}
	public String getProductPhotoUrl() {
		if(color!=null) {
			return color.getPhotoUrl();
		}else {
			return product.getPhotoUrl();
		}
	}
	public int getStock() {
		if(size!=null) {
			return size.getStock();
		}else if(color!=null){
			return color.getStock();
		}else {
			return product.getStock();
		}
	}
	public double getListPrice() {
		if(size!=null) {
			return size.getlistPrice();
		}else {
			if(product instanceof Outlet) {
				return ((Outlet)product.getListPrice();
			}
		}
		return Product.getUnitPrice();
	}
	public String getDiscountString() {
		if(product instanceof Outlet) {
			return ((Outlet)product).getDiscountString();
		}
		return "";
	
	}
	getUnitPrice(){
	
	
	@Override
	public String toString() {
		return this.getClass().getName() + "產品: " + product + ", 顏色: " + color + ", 尺寸: " + size;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((color == null) ? 0 : color.hashCode());
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
		if (color == null) {
			if (other.color != null) {
				return false;
			}
		} else if (!color.equals(other.color)) {
			return false;
		}
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
	
	
}
