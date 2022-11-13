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
	private Map<String, Size> sizesMap = new TreeMap<>();
	
	//Map, Set, List, []型態屬性的getter:
	public Map<String, Size> getSizesMap() {
		return sizesMap;//Collections.u(colorsMap)
	}
	//Map, Set, List, []型態屬性的setter要改成add(update, delete)
	public void addSize(Size size) {
		if(size==null) throw new IllegalArgumentException("加入sizesMap時, size物件不得為null");
		sizesMap.put(size.getName(), size);
	}
	//判斷是否有不同size
	public boolean isMultiSize() {
		return sizesMap!=null && sizesMap.size()>0;
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
	//不同size有不同的價格，應該是從資料讀取放進product物件那邊去改放進來的價格才對
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
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
