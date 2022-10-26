//TODO 都還沒寫

package com.wcs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
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
import com.wcs.exception.WCSInvalidDataException;
import com.wcs.service.CustomerService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register.do") //http://localhost:8080/wcs/register.do 
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		response.setCharacterEncoding("UTF-8");//傳來的項目有中文就要先寫這一行
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		String comfirmPassword = request.getParameter("comfirmPassword");
		LocalDate birthday = LocalDate.parse(request.getParameter("birthday"));
		char gender = (request.getParameter("gender")).charAt(0);
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		Boolean subscribed = true;
		if((request.getParameter("subscribed"))==null) {
			subscribed = false;
		}
		/*Boolean subscribed = false; 
		if((request.getParameter("subscribed"))!=null && (request.getParameter("subscribed")).equals("on")){
			subscribed = true;
		}*/
		System.out.println(subscribed);
		
		String captcha = request.getParameter("captcha");
		
		if(id==null || id.length()==0) {
			errorList.add("必須輸入帳號");
		}
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
		if(birthday==null) { //birthday沒輸入是回傳什麼?
			errorList.add("必須輸入生日");
		}
		if(gender != 'M' && gender != 'F' && gender != 'U') {
			errorList.add("必須選擇性別");
		}
		
		if(captcha==null || captcha.length()==0) {
			errorList.add("必須輸入驗證碼");
		}else {
			//TODO: 檢查驗證碼
		}
		
		if(errorList.isEmpty()) {
    	//2.呼叫商業邏輯
	    	CustomerService service = new CustomerService();
	    	Customer c = new Customer();
	    	try {
	    		c.setId(id);
	    		c.setEmail(email);
	    		c.setName(fullname);
	    		c.setPassword(password);
	    		c.setBirthday(birthday);
	    		c.setGender(gender);
	    		c.setAddress(address);
	    		c.setPhone(phone);
	    				
	    		service.register(c);
	    		//3.1註冊成功，轉交(forward)給register_ok.jsp
	    		request.setAttribute("member", c);
	    		RequestDispatcher dispatcher = request.getRequestDispatcher("register_ok.jsp");
	    		dispatcher.forward(request, response);
	    		return;    		
	    	}catch(WCSInvalidDataException e) {
	    		errorList.add(e.getMessage());
			}catch(WCSException e){
	    		//3.2註冊失敗
	    		this.log("註冊失敗", e);
	    		errorList.add(e.getMessage());
	    	}catch(Exception e) {//RuntimeException, WCSInvalidDataException都包含在內。
	    		this.log("註冊功能發生系統錯誤",e);
	    		errorList.add("註冊系統錯誤: "+e.getMessage());
	    	}
    	}	
		//3.2註冊失敗，轉交(forward)給register.jsp
		request.setAttribute("errorList", errorList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
		dispatcher.forward(request, response);
		
		
    }
}


