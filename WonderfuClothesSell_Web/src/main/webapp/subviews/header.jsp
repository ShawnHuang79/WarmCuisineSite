<%@page import="com.wcs.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<style>
	@import url(/wcs/css/lightbox.css);
	#login{
		cursor: pointer;
	}
</style>
<script src="https://code.jquery.com/jquery-3.0.0.js" 
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
	crossorigin="anonymous">
</script>
<script>
	$(document).ready(initAjax);
	function initAjax(){
		$("#login").click(loginHandler);
	}
	function loginHandler(){
		$.ajax({
			url: '/wcs/login.jsp',
			method: 'GET'
		}).done(loginAjaxHandler);
	}
	function loginAjaxHandler(response){

		$("#getProductData_Div").html(response);
		openModal()
	}
	function openModal() {
		  document.getElementById("myModal").style.display = "block";
		  setTimeout(function(){document.getElementById("myModal").style.opacity = 1;},50);
		}
	function closeModal() {
	    document.getElementById("myModal").style.opacity = 0
	    setTimeout(function(){document.getElementById("myModal").style.display = "none";},300);
	}
</script>

<!-- /subviews/header.jsp start -->
<header>
	<div id="myModal" class="modal">
 		<span class="close cursor" onclick="closeModal()">&times;</span>
  		<div id='getProductData_Div' class="modal-content">
		</div>
	</div>	
	<h1><a href='/wcs'>Eat Food</a> 
		<sub>
			<%=request.getParameter("subtitle")==null?"歡迎光臨": request.getParameter("subtitle") %>
		</sub>
	</h1>
	<div></div>

	<form id='searchForm' method='GET' action='/wcs/products_list.jsp'>
 		<input type='search' name='keyword' placeholder='請輸入查詢關鍵字' value='${param.keyword}' ><!-- 要把搜尋結果帶回框框內  -->
		<input type='submit' value='搜尋'>
	</form>
	<form id='searchForm' method='GET' action='/wcs/products_list.jsp'>
 		<input type='search' name='minPrice' placeholder='請輸入最低價格' value='${param.minPrice}' ><!-- 要把搜尋結果帶回框框內  -->
		<input type='search' name='maxPrice' placeholder='請輸入最低價格' value='${param.maxPrice}' >
		<input type='submit' value='價格查詢'>
	</form>
	<a href='/wcs/member/cart.jsp'>購物車</a>|
<!-- 	改購物車圖示<img src='/wcs/images/cart.png> -->
	<% 
	Customer c = (Customer)session.getAttribute("member");
	if(c==null){
	%>
	<a href='/wcs/register.jsp'>註冊</a>|
	<a id='login'>登入</a>|
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