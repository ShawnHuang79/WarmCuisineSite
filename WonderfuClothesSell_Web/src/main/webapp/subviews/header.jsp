<%@page import="com.wcs.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!-- /subviews/header.jsp start -->
<header>
	<h1><a href='#'>Eat Food</a> 
		<sub>
			<%=request.getParameter("subtitle")==null?"歡迎光臨": request.getParameter("subtitle") %>
		</sub>
	</h1>
	<div></div>
	<form>
		<input type='search' placeholder='請輸入查詢關鍵字'>
		<input type='submit' value='搜尋'>
	</form>
	<a href='/wcs/member/cart.jsp'>購物車</a>|
	<% 
	Customer c = (Customer)session.getAttribute("member");
	if(c==null){
	%>
	<a href='/wcs/register.jsp'>註冊</a>|
	<a href='/wcs/login.jsp'>登入</a>|
	<%}else{%>
	<a href='/wcs/register.jsp'>修改會員</a>|
	<a href='/wcs/login.jsp'>登出</a>|
	<%} %>
</header>
<!-- /subviews/header.jsp end -->