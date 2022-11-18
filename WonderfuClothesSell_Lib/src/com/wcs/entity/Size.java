package com.wcs.entity;

public class Size {
	//沒有colorName、stock
	private int productId;//PKEY
	private String sizeName;//PKEY
	private double listPrice;
	private double unitPrice;
	private int ordinal;
	

	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getSizeName() {
		return sizeName;
	}
	public void setSizeName(String sizeName) {
		this.sizeName = sizeName;
	}
	public double getListPrice() {
		return listPrice;
	}
	public void setListPrice(double listPrice) {
		this.listPrice = listPrice;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getOrdinal() {
		return ordinal;
	}
	public void setOrdinal(int ordinal) {
		this.ordinal = ordinal;
	}

	@Override
	public String toString() {
		return this.getClass().getName() + "productId: " + productId + ", Size大小: " + sizeName + 
				", 定價: " + listPrice + ", 售價: " + unitPrice + ", ordinal: " + ordinal;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + productId;
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
		Size other = (Size) obj;
		if (productId != other.productId) {
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
}
