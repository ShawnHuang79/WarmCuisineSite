package com.wcs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wcs.entity.CartItem;
import com.wcs.entity.ShoppingCart;

/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/member/update_cart.do")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		if(cart!=null) {
			for(CartItem cartItem:cart.getCartItemsSet()) {
				//為了判斷是否重複，在cart那邊就已經把name設定成加入了hashcode，所以這邊getParameter也要加
				String quantity = request.getParameter("quantity"+cartItem.hashCode());
				String delete = request.getParameter("delete"+cartItem.hashCode());
				if(delete==null && quantity!=null && quantity.matches("\\d+")) {
					int oldQty = cart.getQuantity(cartItem);
					int qty = Integer.parseInt(quantity);
					if(qty>0) {
						cart.update(cartItem, oldQty, qty);
					}else if(qty==0) {
						cart.remove(cartItem);
					}
				}else if(delete!=null){
					cart.remove(cartItem);
				}
			}
		}
		//3.redirect to /member/cart.jsp
		String submitPath = request.getParameter("submitPath");
		if(submitPath!=null) {
			response.sendRedirect(submitPath);
			return;
		}
		response.sendRedirect("cart.jsp");		
	}

}
