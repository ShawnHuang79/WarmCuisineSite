package com.wcs.entity;

import java.util.Objects;

public class Color {
	private String colorName;
	private int stock;
	private String photoUrl;
	private String iconUrl;
	
	public String getColorName() {
		return colorName;
	}
	public void setColorName(String colorName) {
		this.colorName = colorName;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getPhotoUrl() {
		return photoUrl;
	}
	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	@Override
	public String toString() {
		return this.getClass().getName() 
				+ "顏色名稱: " + colorName 
				+ "庫存: " + stock 
				+ "產品圖片: "	+ photoUrl;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((colorName == null) ? 0 : colorName.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Color other = (Color) obj;
		if (colorName == null) {
			if (other.colorName != null)
				return false;
		} else if (!colorName.equals(other.colorName))
			return false;
		return true;
	}

}
