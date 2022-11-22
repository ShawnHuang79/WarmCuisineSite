package com.wcs.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wcs.entity.Customer;
import com.wcs.entity.Order;
import com.wcs.entity.PaymentType;
import com.wcs.entity.ShippingType;
import com.wcs.entity.ShoppingCart;
import com.wcs.exception.WCSException;
import com.wcs.service.OrderService;


/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/member/check_out.do")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errorList = new ArrayList<>();
		HttpSession session = request.getSession();
		
		Customer member = (Customer)session.getAttribute("member");
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
				
		if(cart==null || cart.isEmpty()) {
			response.sendRedirect("cart.jsp"); //購物車是空的，外部轉交回cart.jsp
			return;
		}
		//1. 取得request中的Form Data
		String shippingType = request.getParameter("shippingType");
		String paymentType = request.getParameter("paymentType");
		
		String recipientName = request.getParameter("recipientName");
		String recipientEmail = request.getParameter("recipientEmail");
		String recipientPhone = request.getParameter("recipientPhone");
		String shippingAddress = request.getParameter("shippingAddress");
		
		ShippingType shType = null;		
		if(shippingType==null) {
			errorList.add("必須選擇取件方式");
		}else {
			try {
			shType=ShippingType.valueOf(shippingType);
			}catch(RuntimeException e) {
				errorList.add("取件方式:" + shippingType + "不正確!");
			}			
		}
		
		PaymentType pType = null;
		if(paymentType==null) {
			errorList.add("必須選擇付款方式");
		}else {
			try {
			pType=PaymentType.valueOf(paymentType);
			}catch(RuntimeException e) {
				errorList.add("付款方式:" + paymentType + "不正確!");
			}			
		}
		
		if(recipientName==null || (recipientName=recipientName.trim()).length()==0) 
			errorList.add("必須輸入收件人姓名");
		
		if(recipientEmail==null || (recipientEmail=recipientEmail.trim()).length()==0) 
			errorList.add("必須輸入收件人Email");
		
		if(recipientPhone==null || (recipientPhone=recipientPhone.trim()).length()==0) 
			errorList.add("必須輸入收件人電話");
		
		if(shippingAddress==null || (shippingAddress=shippingAddress.trim()).length()==0) 
			errorList.add("必須輸入收件地址");
		
		//2.若無誤，則呼叫商業邏輯
		if(errorList.isEmpty()) {
			Order order = new Order();
			OrderService oService = new OrderService();
			try {
				order.setMember(member);
				order.add(cart);
				
				order.setCreatedDate(LocalDate.now());
				order.setCreatedTime(LocalTime.now());
				
				order.setShippingType(shType);
				order.setShippingFee(shType.getFee());
				
				order.setPaymentType(pType);
				order.setPaymentFee(pType.getFee());
				
				order.setRecipientName(recipientName);
				order.setRecipientEmail(recipientEmail);
				order.setRecipientPhone(recipientPhone);
				order.setShippingAddress(shippingAddress);
			
				oService.checkOut(order);
				session.removeAttribute("cart");
				//3.1 結帳成功，內部轉交check_out_ok.jsp
				request.setAttribute("order", order);
				request.getRequestDispatcher("check_out_ok.jsp").forward(request, response);
				return;
			}catch(WCSException e) {
				this.log(e.getMessage(), e);
				errorList.add(e.getMessage() + ":" + e);
			}catch(Exception e) {
				this.log("結帳失敗! 發生系統錯誤", e);
				errorList.add("結帳失敗! 發生系統錯誤:" + e);			
			}
		}
		
		//3.2 結帳失敗，內部轉交check_out.jsp
		request.setAttribute("errorList", errorList);
		request.getRequestDispatcher("check_out.jsp").forward(request, response);
		return;
	}

}
