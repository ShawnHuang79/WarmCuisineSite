package com.wcs.entity;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ShoppingCart {
	private Customer member;
	private Map<CartItem, Integer> cartMap = new HashMap<>();
	public Customer getMember() {
		return member;
	}
	public void setMember(Customer member) {
		this.member = member;
	}
	//cartMap's getter
	public int size() {
		return cartMap.size();
	}
	public boolean isEmpty() {
		return cartMap.isEmpty();
	}
	public Integer getQuantity(CartItem key) {
		return cartMap.get(key);
	}
	public Set<CartItem> getCartItemsSet() {
		return new HashSet(cartMap.keySet());
	}
	//cartMap's business Methods
	public double getAmount(CartItem key) {
		return key.getProduct().getUnitPrice() * getQuantity(key);
	}
	public int getTotalQuantity() {
		int sum=0;
		for(Integer qty:cartMap.value()) {
			if(qty!=null) {
				sum+=qty;
			}
		}
		return sum;
	}
	
	public double getTotalAmount() {
		double sum=0;
		for(CartItem key:cartMap.keySet()) {
			if(key!=null) {
				sum+=this.getAmount(key);
			}
		}
		return sum;
	}


	
	
	//cartMap's setter
	public Integer add(CartItem key, Integer value) {
		return cartMap.put(key, value);
	}
	//修改購物明細數量，會檢查後面兩個數字是否相同，把old取代成new
	public boolean update(CartItem key, int oldValue, int newValue) {
		return cartMap.replace(key, oldValue, newValue);
	}	
	public Integer remove(Object key) {
		return cartMap.remove(key);
	}
}
