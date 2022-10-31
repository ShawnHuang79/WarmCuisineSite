package com.wcs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout.do")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //登出成功畫面可以考慮用閃一下再顯示後段，或者用前端設定點擊登出時先產生回應等待0.5秒再外部轉址??
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.取得request中的session物件，但若沒有，不要建立新的(false)。
		HttpSession session = request.getSession(false);
		if(session!=null) {
			//2.呼叫商業邏輯
			session.invalidate();
		}
		//3.外部轉址給首頁
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		response.sendRedirect("/wcs/");
		return;
	}

}
