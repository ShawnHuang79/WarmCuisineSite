package com.wcs.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wcs.entity.Customer;
import com.wcs.exception.WCSException;
import com.wcs.exception.WCSInvalidDataException;
import com.wcs.service.CustomerService;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/update.do")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errorList = new ArrayList<>();
    	//1.取得request中的form data並檢查
		request.setCharacterEncoding("UTF-8");//傳來的項目有中文就要先寫這一行
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		String comfirmPassword = request.getParameter("comfirmPassword");
		LocalDate birthday = LocalDate.parse(request.getParameter("birthday"));
		char gender = (request.getParameter("gender")).charAt(0);
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		boolean subscribed = true;
		if((request.getParameter("subscribed"))==null) {
			subscribed = false;
		}
		/*boolean subscribed = false; 
		if((request.getParameter("subscribed"))!=null && (request.getParameter("subscribed")).equals("on")){
			subscribed = true;
		}*/
		String captcha = request.getParameter("captcha");
		
		if(email==null || email.length()==0) {
			errorList.add("必須輸入email");
		}
		if(fullname==null || fullname.length()==0) {
			errorList.add("必須輸入姓名");
		}
		if(password==null || password.length()==0) {
			errorList.add("必須輸入密碼");
		}
		if(comfirmPassword==null || comfirmPassword.length()==0) {
			errorList.add("必須輸入確認密碼");
		}
		if(!password.equals(comfirmPassword)) {
			errorList.add("兩次密碼輸入不相同");
		}
		//兩個密碼的確認要寫
		
		if(birthday==null) { //birthday沒輸入是回傳什麼?
			errorList.add("必須輸入生日");
		}
		if(gender != 'M' && gender != 'F' && gender != 'U') {
			errorList.add("必須選擇性別");
		}
		HttpSession session = request.getSession();
		if(captcha==null || captcha.length()==0) {
			errorList.add("必須輸入驗證碼");
		}else {
			String sessionCapture = (String)session.getAttribute("com.wcs.view.CaptchaServlet");
			if (!captcha.equalsIgnoreCase(sessionCapture)) {
				errorList.add("驗證碼不正確");
			}
		}
		session.removeAttribute("captcha");
		
		if(errorList.isEmpty()) {
    	//2.呼叫商業邏輯
	    	CustomerService service = new CustomerService();
	    	Customer c = (Customer)session.getAttribute("member");
	    	try {
	    		c.setEmail(email);
	    		c.setName(fullname);
	    		c.setPassword(password);
	    		c.setBirthday(birthday);
	    		c.setGender(gender);
	    		c.setAddress(address);
	    		c.setPhone(phone);
	    		c.setSubscribed(subscribed);
	    				
	    		service.update(c);
	    		//3.1註冊成功，轉交(forward)給register_ok.jsp
	    		session.setAttribute("member", c);
	    		RequestDispatcher dispatcher = request.getRequestDispatcher("register_ok.jsp");
	    		dispatcher.forward(request, response);
	    		return;    		
	    	}catch(WCSInvalidDataException e) {
	    		errorList.add(e.getMessage());
			}catch(WCSException e){
	    		//3.2註冊失敗
	    		this.log("修改會員失敗", e);
	    		errorList.add(e.getMessage());
	    	}catch(Exception e) {//RuntimeException, WCSInvalidDataException都包含在內。
	    		this.log("修改會員功能發生系統錯誤",e);
	    		errorList.add("修改會員系統錯誤: "+e.getMessage());
	    	}
    	}	
		//3.2註冊失敗，轉交(forward)給register.jsp
		request.setAttribute("errorList", errorList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/update.jsp");
		dispatcher.forward(request, response);
		
		
    }
}