package com.wcs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wcs.entity.Customer;
import com.wcs.exception.WCSException;
import com.wcs.service.OrderService;

/**
 * Servlet implementation class CreditCardCallBackServlet
 */
@WebServlet("/member/credit_card_back.do")
public class CreditCardCallBackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreditCardCallBackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer member = (Customer) request.getSession().getAttribute("member");
        // 1. 取得request中的parameter
        String amount = request.getParameter("amount");
        String auth_code = request.getParameter("auth_code");
        String card4no = request.getParameter("card4no");
        String card6no = request.getParameter("card6no");
        String merchantTradeNo = request.getParameter("MerchantTradeNo");
        String process_date = request.getParameter("process_date");
        String paymentTypeChargeFee = request.getParameter("PaymentTypeChargeFee");     
        String orderId = (String)request.getSession().getAttribute("credit_card_order_id");
        request.getSession().removeAttribute("credit_card_order_id");

        // 2. 呼叫商業邏輯
        OrderService service = new OrderService();
        try {
            service.updateOrderStatusToPAID(member, orderId, card6no, card4no, auth_code, process_date, amount);// 呼叫前面步驟一完成的修改訂單狀態為已付款的程式
        } catch (WCSException ex) {
            this.log("信用卡授權發生錯誤", ex);
        }
        // 3. redirect to /member/orders_history.jsp (或"/member/order.jsp?orderId=" +
        // orderId)
        response.sendRedirect(request.getContextPath() + "/member/orders_history.jsp");
        }
    
	}
