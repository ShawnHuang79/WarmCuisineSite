package com.wcs.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wcs.entity.Product;
import com.wcs.entity.ShoppingCart;
import com.wcs.entity.Size;
import com.wcs.exception.WCSException;
import com.wcs.service.ProductService;

/**
 * Servlet implementation class AddCartServlet
 */
@WebServlet("/add_cart.do")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errorList = new ArrayList<>();
		HttpSession session = request.getSession();
		//1.取得request中的formData
		//productId在畫面中不用看到，但要用input hidden偷偷傳過來。
		String productId = request.getParameter("productId");
		String sizeName = request.getParameter("sizeName");
		String quantity = request.getParameter("quantity");
		String ajax = request.getParameter("ajax");
	
		
		//從前端傳過來的是某個產品的"中"這個size以及需要數量，要用product service去找DAO要資料庫
		//裏面size的相關資料，比對是"中"再連同"中"相關的價格拿出來放在size物件裡面才能夠給cart進行add
		
		if(productId!=null && quantity!=null && quantity.matches("\\d+")) {
			ProductService pService = new ProductService();
			try {
				Product p = pService.getIdProduct(productId);
				if(p!=null) {
					//Size size = p.Service.getSize(productId, colorName, sizeName);
					int qty = Integer.parseInt(quantity);
					ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
					//第一次建立購物車時，加入session當中。
					if(cart==null) {
						cart = new ShoppingCart();
						session.setAttribute("cart", cart);
					}
					//其實p裡面就有size了
					Size size = null;
					if(p.hasSize() && sizeName!=null) {
						size = pService.getSize(productId, sizeName);
			
					}
					cart.add(p, size, qty);
				}else {
					errorList.add("加入購物車失敗productId: " + productId + "查無資料!");
				}
			}catch(WCSException e) {
				this.log("加入購物車失敗!", e);
				errorList.add("加入購物車失敗:"+e);
			}catch(Exception e) {
				this.log("加入購物車失敗!", e);
				errorList.add("加入購物車失敗，發生系統錯誤"+e);
			}
		}else {
			errorList.add("加入購物車失敗 productId: " + productId + ", quantity" + quantity + "無法處理!");
		}
		//如果有ajax請求就把資料傳到small_cart.jsp且不進行Redirect。
		if(ajax!=null && Boolean.parseBoolean(ajax)) {
			request.getRequestDispatcher("small_cart.jsp").forward(request, response);
		}else {
			response.sendRedirect("member/cart.jsp");
		}
	}
}
