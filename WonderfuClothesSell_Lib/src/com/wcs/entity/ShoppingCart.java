package com.wcs.entity;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ShoppingCart {
	private Customer member;
	//map<購物車的物件,數量>
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
	public int getQuantity(CartItem key) {
		//用.get依照傳入的CartItem為key取出其數量
		Integer qty = cartMap.get(key);
		return qty==null?0:qty;
	}
	public Set<CartItem> getCartItemsSet() {
		return new HashSet<>(cartMap.keySet());
	}
	
	//unitprice的邏輯是老師寫的，要再調整
	public double getUnitPrice(CartItem key) {
		double price = key.getUnitPrice();
		if(!(key.getProduct() instanceof Outlet) 
				&&member instanceof VIP) {
			price *=(100D-((VIP)member).getDiscount())/100;			
		}
		return price;
	}
	//getDiscountString的邏輯是老師寫的，要再調整
	public String getDiscountString(CartItem key) {
		if(member instanceof VIP 
				&& !(key.getProduct() instanceof Outlet)) {
			return "VIP "+((VIP)member).getDiscountString();
		}
		return key.getDiscountString();
	}
	
	
	//cartMap's business Methods
	public double getAmount(CartItem key) {
		return key.getUnitPrice() * getQuantity(key);
	}
	//總價
	public int getTotalQuantity() {
		int sum=0;
		for(Integer qty:cartMap.values()) {
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
	
	//cartMap's setter(delegate methods) 
	/*public Integer add(CartItem key, Integer value) {
		return cartMap.put(key, value);
	}*/
	public void add(Product product, Size size, int quantity) {
		if (product==null || quantity<=0) 
				throw new IllegalArgumentException("加入購物車時，必需有產品與數量");
		
		CartItem cartItem = new CartItem();
		cartItem.setProduct(product);
		if(product.hasSize() && size!=null) {			
			cartItem.setSize(size);
		}
		
		Integer oldQty = cartMap.get(cartItem);
		if(oldQty!=null) quantity+=oldQty;
		
		cartMap.put(cartItem, quantity);
	}
	
	//修改購物明細數量，會檢查後面兩個數字是否相同，把old取代成new
	public boolean update(CartItem key, int oldValue, int newValue) {
		return cartMap.replace(key, oldValue, newValue);
	}	
	public Integer remove(CartItem cartItem) {
		return cartMap.remove(cartItem);
	}
	@Override
	public String toString() {
		return this.getClass().getSimpleName() + "訂購人: " + member + ",\n 購物明細:" + cartMap + ",\n 共" + size() +
				"項, " + getTotalQuantity() + "件, 總金額: " + getTotalAmount() + "元";
	}
	
}
