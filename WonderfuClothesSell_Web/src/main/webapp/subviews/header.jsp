<%@page import="com.wcs.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<style>
	@import url(/wcs/css/lightbox.css);
	#login{
		cursor: pointer;
	}
	header{
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		background-image: url('/wcs/images/headerBackground.jpg');
		background-position: center;
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

		$("#getHeader").html(response);
		openLightboxForHeader()
	}
	function openLightboxForHeader() {
		  document.getElementById("lightboxForHeader").style.display = "block";
		  setTimeout(function(){document.getElementById("lightboxForHeader").style.opacity = 1;},50);
		  
		}
	function closeLightboxForHeader() {
	    document.getElementById("lightboxForHeader").style.opacity = 0
	    setTimeout(function(){document.getElementById("lightboxForHeader").style.display = "none";},300);
	}
</script>

<!-- /subviews/header.jsp start -->
<header>
	<div id="lightboxForHeader" class="lightboxForHeaderClass">
 		<div class="closelightboxForHeader" onclick="closeLightboxForHeader()">&times;</div>
 		<div id='getHeader' class="lightboxForHeaderContent">
		</div>
	</div>	
	<div>
		<h1><a href='/wcs'>&nbsp;&nbsp;&nbsp;&nbsp; Warm Cuisine Site</a> 
			<%-- <sub>
				<%=request.getParameter("subtitle")==null?"歡迎光臨": request.getParameter("subtitle") %>
			</sub>--%>
		</h1>
	</div>
	<div id="navFormHeader">

		<a href='/wcs/products_list.jsp'>產品列表</a>|
		<a href='/wcs/seats.jsp'>訂位</a>|
		<a href='/wcs/member/cart.jsp'>
			<img class='headerImgs' src='/wcs/images/shopping_cart.png'>
			<span class='cartQuantitySpan'>
				${empty sessionScope.cart?"":String.format("(%d)",sessionScope.cart.totalQuantity) } <!-- 要把搜尋結果帶回框框內，注意EL無法做字串相加  -->
			</span>
		</a>|
	<!-- 	改購物車圖示<img src='/wcs/images/cart.png> -->
		<% 
		Customer c = (Customer)session.getAttribute("member");
		if(c==null){
		%>
		<a href='/wcs/register.jsp'>註冊</a>|
		<a id='login'><img id='membertImg' class='headerImgs' src='/wcs/images/membertImg.png'>登入</a>
		<%}else{%>
		<span>${sessionScope.member.getName()}你好</span>|
		<a href='/wcs/member/orders_history.jsp'>歷史訂單</a> |
		<a href='/wcs/member/update.jsp'>修改會員</a>|
		<a href='/wcs/logout.do' onclick="logoutSnackbar()" >登出</a>
		<%} %>
	</div>
	
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