<%@page import="com.wcs.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!-- /subviews/nav.jsp start -->
<nav>
	<% 
	Customer c = (Customer)session.getAttribute("member");
	if(c==null){}
	%>
	<a href='/wcs/register.jsp'>註冊</a>|
	<a href='/wcs/login.jsp'>登入</a>|
	
	<a href='/wcs/register.jsp'>修改會員</a>|
	<a href='/wcs/login.jsp'>登出</a>|
	
	<a href='/wcs/member/update.jsp'>修改會員</a>|
	<a href='/wcs/products_list.jsp'>產品列表</a>|
	<a href='/wcs/member/cart.jsp'>購物車</a>|
	
	
	<span>${sessionScope.member.getName()}你好</span>
	<hr>
</nav>
<!-- /subviews/nav.jsp end -->