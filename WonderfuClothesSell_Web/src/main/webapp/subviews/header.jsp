<%@ page pageEncoding="UTF-8"%>
<!-- /subviews/header.jsp start -->
<header>
	<h1><a href='#'>Eat Food</a> 
		<sub>
			<%=request.getParameter("subtitle")==null?"歡迎光臨": request.getParameter("subtitle") %>
		</sub>
	</h1>
	<form>
		<input type='search' placeholder='請輸入查詢關鍵字'>
		<input type='submit' value='搜尋'>
	</form>
	<hr>
</header>
<!-- /subviews/header.jsp end -->