<%@page import="com.wcs.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!-- /subviews/nav.jsp start -->
<nav>
	<hr>
	<a href='/wcs/products_list.jsp'>產品列表</a>|
	<a href='/wcs/seats.jsp'>訂位</a>|
	
	
	
	<span>${sessionScope.member.getName()}你好</span>
	<hr>
</nav>
<!-- /subviews/nav.jsp end -->