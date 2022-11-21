package com.wcs.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.Set;

public class Order {
	private int id;
	 
	private Customer member;
	 
	private LocalDate createdDate;
	 
	private LocalTime createdTime;
	 
	private ShippingType shippingType;
	
	private PaymentType paymentType;
	 
	private double shippingFee;
	 
	private double paymentFee;
	 
	private String shippingNote;
	 
	private String paymentNote;
	 
	private int status;
	 
	private String recipientName;
	 
	private String recipientEmail;
	 
	private String recipientPhone;
	 
	private String shippingAddress;
	 
	private double totalAmount;
	 
	private Set<OrderItem> orderItemsSet = new HashSet<>();
	
	//回傳副本
	public Set<OrderItem> getOrderItemsSet(){
		return new HashSet<>(orderItemsSet);
	}
	public int size() {
		return orderItemsSet.size();
	}
	public boolean isEmpty() {
		return orderItemsSet.isEmpty();
	}
	public int getTotalQuantity(){
		int sum=0;
		for(OrderItem orderItem:orderItemsSet) {
			sum+= orderItem.getQuantity();
		}
		return sum;
	}
	
	//TODO 還有缺一個set的程式
	
	//orderItemsSet的setter
	//ordersDAO將資料庫的明細讀出來時，會用此方法加入訂單。
	public void add(OrderItem orderItem) {
		if(orderItem==null)
			throw new IllegalArgumentException("將訂單明細加入訂單時，明細不得為null");
		orderItemsSet.add(orderItem);
	}
	
	//checkoutServlet將session的cart內容dump為訂單中的多筆orderItem
	public void add(ShoppingCart cart) {
		if(cart==null || cart.size()<=0)
			throw new IllegalArgumentException("將購物車明細加入訂單時，cart不得為null");
		for(CartItem cartItem:cart.getCartItemsSet()) {
			OrderItem orderItem = new OrderItem();
			orderItem.setProduct(cartItem.getProduct());
			orderItem.setSizeName(cartItem.getSizeName());
			orderItem.setPrice(cartItem.getUnitPrice());//如果有VIP折扣要另外寫。
			orderItem.setQuantity(cart.getQuantity(cartItem));
			orderItemsSet.add(orderItem);
		}
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Customer getMember() {
		return member;
	}

	public void setMember(Customer member) {
		this.member = member;
	}

	public LocalDate getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDate createdDate) {
		this.createdDate = createdDate;
	}

	public LocalTime getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(LocalTime createdTime) {
		this.createdTime = createdTime;
	}

	public ShippingType getShippingType() {
		return shippingType;
	}

	public void setShippingType(ShippingType shippingType) {
		this.shippingType = shippingType;
	}

	public PaymentType getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(PaymentType paymentType) {
		this.paymentType = paymentType;
	}

	public double getShippingFee() {
		return shippingFee;
	}

	public void setShippingFee(double shippingFee) {
		this.shippingFee = shippingFee;
	}

	public double getPaymentFee() {
		return paymentFee;
	}

	public void setPaymentFee(double paymentFee) {
		this.paymentFee = paymentFee;
	}

	public String getShippingNote() {
		return shippingNote;
	}

	public void setShippingNote(String shippingNote) {
		this.shippingNote = shippingNote;
	}

	public String getPaymentNote() {
		return paymentNote;
	}

	public void setPaymentNote(String paymentNote) {
		this.paymentNote = paymentNote;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getRecipientEmail() {
		return recipientEmail;
	}

	public void setRecipientEmail(String recipientEmail) {
		this.recipientEmail = recipientEmail;
	}

	public String getRecipientPhone() {
		return recipientPhone;
	}

	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public double getTotalAmount() {
		if(orderItemsSet==null &&orderItemsSet.size()==0) {
			return totalAmount;
		}else {
			double sum=0;
			for(OrderItem orderItem: orderItemsSet) {
				sum += orderItem.getPrice() * orderItem.getQuantity();
			}
			return sum;
		}
		
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	@Override
	public String toString() {
		return this.getClass().getSimpleName() + 
				"[訂單編號=" + id + ", 處理狀態=" + status  
				+ ", 訂購人=" + member 
				+ ",\n 訂購日期時間=" + createdDate + " "+ createdTime 
				+ ",\n 貨運方式=" + shippingType + ", 手續費=" + shippingFee + ","+ shippingNote 
				+ ",\n 付款方式=" + paymentType + ", 手續費=" + paymentFee + ", " + paymentNote 
				+ ",\n 收件人=" + recipientName + ", Email=" + recipientEmail + ", 電話=" + recipientPhone 
				+ ",\n 收件Address=" + shippingAddress
				+ ", 訂購明細=\n" + orderItemsSet 
				+ ",\n 共" + size() + "項, "+ getTotalQuantity() + "件 總金額=" + getTotalAmount()+ "元";
	}	
	
}
