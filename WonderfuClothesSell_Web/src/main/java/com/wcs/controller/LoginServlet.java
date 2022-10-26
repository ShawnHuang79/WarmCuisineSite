package com.wcs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wcs.entity.Customer;
import com.wcs.exception.WCSException;
import com.wcs.service.CustomerService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do") //http://localhost:8080/wcs/login.do 
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errorList = new ArrayList<>();
    	//1.取得request中的form data(id, password, captcha),並檢查
		//response.setCharacterEncoding("UTF-8");不用輸入是因為這三個項目都是英文，如果是中文就要先
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String captcha = request.getParameter("captcha");
		
		if(id==null || id.length()==0) {
			errorList.add("必須輸入帳號");
		}
		if(password==null || password.length()==0) {
			errorList.add("必須輸入密碼");
		}
		if(captcha==null || captcha.length()==0) {
			errorList.add("必須輸入驗證碼");
		}else {
			//TODO: 檢查驗證碼
		}
		
		if(errorList.isEmpty()) {
    	//2.檢查無誤，呼叫商業邏輯。
	    	CustomerService service = new CustomerService();
	    	try {
	    		Customer c = service.login(id, password);
	    		request.setAttribute("member", c);
	    		//3.1登入成功，轉交(forward)給login_ok.jsp
	    		RequestDispatcher dispatcher = request.getRequestDispatcher("login_ok.jsp");
	    		dispatcher.forward(request, response);
	    		return;    		
	    	}catch(WCSException e){
	    		//3.2登入失敗
	    		this.log("登入失敗", e);
	    		errorList.add(e.getMessage());
	    	}catch(Exception e) {//RuntimeException, WCSInvalidDataException都包含在內。
	    		this.log("登入功能發生系統錯誤",e);
	    		errorList.add("發生系統錯誤: "+e.getMessage());
	    	}
    	}	
		//3.2登入失敗，轉交(forward)給login.jsp
		request.setAttribute("errorList", errorList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
		
		
    }
}


