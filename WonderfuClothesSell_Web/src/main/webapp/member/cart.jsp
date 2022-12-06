<%@page import="com.wcs.entity.Customer"%>
<%@page import="com.wcs.entity.CartItem"%>
<%@page import="com.wcs.entity.ShoppingCart"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Warm Cuisine Site</title>
		<style>
			@import url(/wcs/css/wcs.css);
			* {
				list-style: none;
				text-decoration: none;
			}
			
			body {
				/*background: #f5f5f5;
				height: 100%;*/
			}	
			

			
			.cart {
				width: 1240px;
				margin: 20px auto;
				background: #FFF;
				user-select: none;
			}	
			
			.cart .img {
				width: 190px;
			}
			
			.cart .img img {
				display: block;
				width: 80px;
				height: 80px;
				margin: 3px auto;
			}
			
			.cart .name {
				width: 200px;
			}
			.cart .price {
				width: 150px;
				text-align: center;
			}
			.cart .price span {
				color: #ff6700;
				font-size: 16px;
			}
			.cart .size{
				width: 160px;
				text-align: center;
			}
			
			.cart .subtotal {
				width: 160px;
				text-align: center;
			}
			
			.cart .delete {
				width: 105px;
				padding-right: 25px;
				text-align: center;
			}
			#deleteBtnHidden{
				border: none;
    			background-color: #ffffff;
    			font-size: 30px;
    			cursor: pointer;
			}
			.cart .delete a {
				font-size: 20px;
				cursor: pointer;
				display: block;
				width: 26px;
				height: 26px;
				margin: 30px auto;
				line-height: 26px;
			}
			
			.cart .delete a:hover {
				color: #FFF;
				background: #ff6700;
				border-radius: 50%;
			}
			
			.cartHead {
				height: 70px;
				line-height: 70px;

			}
			
			.cartHead, .row {
				border-bottom: solid 1px #e0e0e0;
				display:flex;
				flex-direction: row;
			}
			.row {
				height: 86px;
				line-height: 86px;
				padding: 15px 0;
				margin: 0px;
			}
			
			
			

			
			.quantityDiv {
				/*height: 85px;*/
				line-height: 75px;
				width: 200px;
				display:flex;
				flex-direction: row; 
				justify-content: center;
				/*border: 1px solid black;*/
				/*float: left;
				margin-right: 25px;*/
			}
			.quantityIncrease {
				width: 20%;
				height: 40px;
				/*line-height: 44px;*/
				text-align: center;
				font-size: 26px;
				/*color: #747474;*/
			
			}
			.quantityIncrease:hover {
				color: #747474;
				/*background: #E0E0E0;*/
				cursor: pointer;
			}
			.quantity {
				width: 30%;
				height: 40px;
				/*line-height: 40px;*/
				text-align: center;
				font-size: 22px;
				border:none;
				/*background-color:#fdf9f0;*/
			}
			.quantityDecrease {
				width: 20%;
				/*line-height: 40px;*/
				text-align: center;
				font-size: 30px;
			}
			.quantityDecrease:hover {
				color: #747474;
				/*background: #E0E0E0;*/
				cursor: pointer;
			}
			/* Chrome, Safari, Edge, Opera */
			input::-webkit-outer-spin-button,
			input::-webkit-inner-spin-button {
			  -webkit-appearance: none;
			  margin: 0;
			}
			
			/* Firefox */
			input[type=number] {
			  -moz-appearance: textfield;
			}
			
			
			
			
			#sumArea {
				width: 1240px;
				height: 60px;
				background: white;
				margin: 20px auto;
			}
			#sumArea #checkOutBtn, #changeCartBtn{
				width: 250px;
				height: 60px;
				text-align: center;
				float: right;
				line-height: 60px;
				font-size: 19px;
				background: #984B4B;
				color: white;
			}
			
			#checkOutBtn {
				cursor: pointer;
				margin-left: 50px;
			}
			
			
			#sumArea #checkOutAmountDiv {
				width: 250px;
				height: 60px;
				text-align: center;
				float: right;
				line-height: 60px;
				font-size: 16px;
				color: #984B4B;
			}
			
			#sumArea #checkOutAmountDiv #checkOutAmount {
				width: 100px;
				height: 60px;
				font-size: 25px;
				color: #984B4B;
				/*	float: left;*/
			}
			form{
			margin-top: 100px;
			}
			
	    </style>
		<script src="https://code.jquery.com/jquery-3.0.0.js" 
				integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
				crossorigin="anonymous">
		</script>
	    <script>
			$(document).ready(init);
			function init(){
				$(".quantityIncrease").click(quantityIncreaseHandler);
				$(".quantityDecrease").click(quantityDecreaseHandler);
				//$("#deleteBtn").click(deleteHandler)
						
			}
			/*function deleteHandler(){
				var result = confirm("message");
				if(result){
					$("#deleteBtnHidden").trigger("click");
				}
			}*/
			function quantityIncreaseHandler(){
				node = this.parentNode.getElementsByClassName('quantity')[0].childNodes[0];
				//console.log(this.parentNode);
				//console.log(node);
				num = node.value;
				num++;
				node.value = num;
			}
			function quantityDecreaseHandler(){
				node = this.parentNode.getElementsByClassName('quantity')[0].childNodes[0];
				//console.log(this.parentNode);
				//console.log(node);
				num = node.value;
				if (num > 1) {
					num--;
				}
				node.value = num;
			}
	    	
		</script>
	</head>
	<body>
		<jsp:include page='/subviews/header.jsp' > 
			<jsp:param value="購物車" name="subtitle"/>
		</jsp:include>
<%-- 		<%@include file='/subviews/nav.jsp' %>  --%>
		<%
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		Customer member = (Customer)session.getAttribute("member");
		%>	
		<article>
			<%if(cart==null || cart.isEmpty()){ %>
				<div>購物車目前沒有商品</div>
			<%}else{
				cart.setMember(member);
			%>

			
			<form action='update_cart.do' method='POST'>
			
			<div id="cart" class="cart">
		
				<div class="cartHead hide">
					<div class="img left"></div>
					<div class="name left">商品名稱</div>
					<div class="price left">單價</div>
					<div class="quantityDiv left">數量</div>
					<div class="size left">尺寸</div>
					<div class="subtotal left">小計</div>
					<div class="delete left">刪除</div>
				</div>
				<%for(CartItem cartItem:cart.getCartItemsSet()) {%>
					<div class="row hide">
						<div class="img left"><img src='<%= cartItem.getPhotoUrl() %>' width="80" height="80"></div>
						<div class="name left"><%= cartItem.getProductName() %></div>
						<div class="price left"><%=cart.getUnitPrice(cartItem) %></div>
						<div class="quantityDiv"><div class="quantityDecrease">-</div><div class='quantity'><input type='number' class='quantity' value='<%=cart.getQuantity(cartItem) %>' name='quantity<%=cartItem.hashCode() %>' required></div><div class="quantityIncrease">+</div></div>
						<div class="size left"><%= cartItem.getSizeName() %></div>
						<div class="subtotal left"><%=cart.getUnitPrice(cartItem) %></div>
						<%-- <div class="delete left"><div id='deleteBtn'>×</div></div>--%>
						
						<div class="delete left"><input id='deleteBtnHidden' class="delete" type='submit' name='delete<%=cartItem.hashCode() %>' value='×'></div>
<!-- 						<div class="delete left"><a rel="nofollow" href="javascript:;">×</a></div> -->
					</div>
				<%} %>
			</div>
			<div id="sumArea">
				<div><button type='submit' id="checkOutBtn" name='submitPath' value='check_out.jsp'>去結帳</button></div>
				<div><input type='submit' id="changeCartBtn" value='修改購物車'></div>
				<div id="checkOutAmountDiv">
					合計：<span id="checkOutAmount"><%=cart.getTotalAmount() %></span>元
				</div>
				
			</div>
			</form>
			<%} %>
<!-- 			<div id="moreProductBox"> -->
<!-- 				<h2 class="moreProductBoxHead"> -->
<!-- 					<span>買購物車中商品的人還買了</span> -->
<!-- 				</h2> -->
<!-- 				<ul> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<%-- 		<%@include file='/subviews/footer.jsp' %>  --%>
		</article>
	</body>
</html>