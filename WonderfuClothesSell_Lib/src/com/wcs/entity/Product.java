package com.wcs.entity;

import java.time.LocalDate;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class Product {
	private int id;//PKey, AUTO-INCREMENT, 必要
	private String name;//必要
	private double unitPrice; //必要，定價
	private int stock;//必要
	private String photoUrl;
	private String description;
	private LocalDate launchDate ;
	private int status = 1;//0:新產品；1:已上架；-1:已停售
	private String category;
	private int discount;
	private Map<String, Color> colorsMap = new TreeMap<>();
	
	public Map<String, Color> getColorsMap() {
		return new TreeMap(colorsMap);//Collections.u(colorsMap)
	}
	//setter
	public void addColor(Color color) {
		if(color==null) throw new IllegalArgumentException("加入colorsMap時, color物件不得為null");
		colorsMap.put(color.getColorName(), color);
	}
	
	public boolean isColorful() {
		return colorsMap!=null && colorsMap.size()>0;
	}

	public Product() {
	}
	public Product(int id, String name, double price) {
		this.id = id;
		this.name = name;
		this.unitPrice = price;
	}
	public Product(int id, String name, double price, int stock) {
		this(id,name,price);
		this.stock = stock;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getStock() {
		if(colorsMap==null || colorsMap.isEmpty()) {
			return stock;
		}else {
			int totalStock=0;
			
			for(Color color:colorsMap.values()) {
				
			}
			return totalStock;
			//colorsMap.values().getClass()
		}
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public LocalDate getLaunchDate() {
		return launchDate;
	}
	public void setLaunchDate(LocalDate launchDate) {
		this.launchDate = launchDate;
	}
	public void setLaunchDate(String launchDate) {
		this.setLaunchDate(LocalDate.parse(launchDate));
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	@Override
	public String toString() {
		return this.getClass().getSimpleName()
				+": id=" + id + ", 產品名稱=" + name + ", 單價=" + unitPrice + ", 庫存=" + stock + ",\n 圖片網址="
				+ photoUrl + ",\n 說明=" + description + ", 上架日期=" + launchDate + ", status=" + status +
				", category=" + category + ", discount=" + discount;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
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
		Product other = (Product) obj;
		if (id != other.id) {
			return false;
		}
		return true;
	}

	
	
}
