<%@page import="com.wcs.service.CustomerService"%>
<%@page import="com.wcs.entity.Customer"%>
<%@page pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="UTF-8">
		<meta http-equiv="refresh" content="0.5; url='/wcs/index.jsp'"/><!-- 跳轉網站 -->
		<title>登入成功</title>

	    <style>
			@import url(/wcs/css/wcs.css);
	    </style>
	</head>
	<body>
		<header>
			<h1><a href='#'>Eat Food登入成功</a> 
				
			</h1>
			<form>
				<input type='search' placeholder='請輸入查詢關鍵字'>
				<input type='submit' value='搜尋'>
			</form>
			
			<hr>
		</header>
	    <nav>
	    	<a href='register.jsp'>註冊</a>|
	    	<a href='login.jsp'>登入</a>|
	    	<a href='member/update.jsp'>修改會員</a>|
	    	<hr>
	    </nav>
	    <%
	    	Customer c = (Customer)session.getAttribute("member");
	    %>
	    <article>
	    	<h1><%= c==null?"XXX":c.getName() %>你好</h1>>
	    	<br>
	    	<h1>5秒後將跳轉</h1>
	    	<br>
	    </article>
	    <footer id="copyright">
			<div>Copyright © 2022 All rights reserved</div>
		</footer>   
	</body>
</html>