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

	<form id='searchForm' method='GET' action='/wcs/products_list.jsp'>
		<input type='search' name='keyword' placeholder='請輸入查詢關鍵字'>
		<input type='submit' value='搜尋'>
	</form>
	<a href='/wcs/member/cart.jsp'>購物車</a>|
<!-- 	改購物車圖示<img src='/wcs/images/cart.png> -->
	<% 
	Customer c = (Customer)session.getAttribute("member");
	if(c==null){
	%>
	<a href='/wcs/register.jsp'>註冊</a>|
	<a href='/wcs/login.jsp'>登入</a>|
	<%}else{%>
	<a href='/wcs/member/update.jsp'>修改會員</a>|
	<a href='/wcs/logout.do' onclick="logoutSnackbar()" >登出</a>|
	<%} %>
	
<!-- 	Show Snackbar -->
	<div id="snackbar">登出</div>
	<script>
		function logoutSnackbar() {
		  var x = document.getElementById("snackbar");
		  x.className = "show";
		  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
		}
	</script>
<!-- 	Show Snackbar -->
</header>
<!-- /subviews/header.jsp end -->