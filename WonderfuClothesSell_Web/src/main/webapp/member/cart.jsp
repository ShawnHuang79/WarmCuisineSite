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
			.hide {
				overflow: hidden;
			}
			
			.left {
				float: left;
			}
			
			.moreProductBoxHead {
				position: relative;
				margin: 0;
				height: 50px;
				font-size: 30px;
				font-weight: 400;
				color: #757575;
				border-top: 1px solid #e0e0e0;
			}
			
			.moreProductBoxHead span {
				position: absolute;
				top: -20px;
				left: 372px;
				height: 40px;
				width: 482px;
				line-height: 40px;
				text-align: center;
				display: block;
				background-color: #f5f5f5;
				font-size: 30px;
			}
			
			#moreProductBox {
				width: 1240px;
				margin: 20px auto;
			}
			
			#moreProductBox ul {
				margin-right: -14px;
				overflow: hidden;
			}
			
			#moreProductBox li {
				width: 234px;
				float: left;
				margin-right: 14px;
				padding: 24px 0 20px;
				background: #FFF;
				text-align: center;
				position: relative;
				cursor: pointer;
				margin-bottom: 14px;
			}
			
			.productImg {
				width: 150px;
				height: 150px;
				margin: 0 auto 18px;
			}
			
			.productName {
				display: block;
				text-overflow: ellipsis;
				white-space: nowrap;
				overflow: hidden;
				font-weight: 400;
			}
			
			.productName a {
				color: #333;
			}
			
			.productPrice {
				color: #ff6700;
				margin: 10px;
			}
			
			
			#moreProductBox li:hover .addBtn {
				display: block;
			}
			
			#moreProductBox li:hover .addBtnrank {
				opacity: 0;
			}
			
			#moreProductBox li .addBtn:hover {
				background-color: #f60;
				color: white;
			}
			
			.addBtn {
				height: 22px;
				position: absolute;
				width: 122px;
				bottom: 5px;
				left: 50%;
				margin-left: -61px;
				line-height: 22px;
				display: none;
				color: #F60;
				font-size: 12px;
				border: 1px solid #f60;
			}
			
			.cart {
				width: 1240px;
				margin: 20px auto;
				background: #FFF;
			}
			
			.cart .check {
				width: 50px;
			}
			
			.cart .check i {
				color: #fff;
				display: inline-block;
				width: 18px;
				height: 18px;
				line-height: 18px;
				border: 1px solid #e0e0e0;
				margin-left: 24px;
				background-color: #fff;
				font-size: 16px;
				text-align: center;
				vertical-align: middle;
				position: relative;
				top: -1px;
				cursor: pointer;
				font-family: "iconfont";
			}
			
			.tick {
				border-color: #ff6700 !important;
				background-color: #ff6700 !important;
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
				width: 300px;
			}
			
			.cart .name span {
				line-height: 1;
				margin-top: 8px;
				margin-bottom: 8px;
				font-size: 18px;
				font-weight: normal;
				text-overflow: ellipsis;
				white-space: nowrap;
				overflow: hidden;
			}
			
			.cart .price {
				width: 144px;
				text-align: right;
				padding-right: 84px;
			}
			
			.cart .price span {
				color: #ff6700;
				font-size: 16px;
			}
			
			.cart .number {
				width: 150px;
			}
			
			.cart .subtotal {
				width: 130px;
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
			}
			
			.row {
				height: 86px;
				line-height: 86px;
				padding: 15px 0;
				margin: 0px;
			}
			
			#sumArea {
				width: 1240px;
				height: 60px;
				background: white;
				margin: 20px auto;
			}
			
			#sumArea #checkOutBtn {
				width: 250px;
				height: 60px;
				text-align: center;
				float: right;
				line-height: 60px;
				font-size: 19px;
				background: #FF4B00;
				color: white;
			}
			
			#checkOutBtn {
				cursor: pointer;
			}
			
			
			#sumArea #checkOutAmountDiv {
				width: 250px;
				height: 60px;
				text-align: center;
				float: right;
				line-height: 60px;
				font-size: 16px;
				color: #FF4B00;
			}
			
			#sumArea #checkOutAmountDiv #checkOutAmount {
				width: 100px;
				height: 60px;
				font-size: 25px;
				color: #FF4B00;
				/*	float: left;*/
			}
			
			.quantityDiv {
				height: 85px;
				width: 10%;
				/*border: 1px solid black;*/
				float: left;
				margin-right: 25px;
			}
			
			.quantityInnerDiv {
				width: 150px;
				height: 40px;
				border: 1.2px solid #E0E0E0;
				float: right;
				margin-top: 21px;
			}
			
			.quantityIncrease {
				width: 30%;
				height: 40px;
				line-height: 40px;
				float: left;
				text-align: center;
				font-size: 21px;
				color: #747474;
			}
			
			.quantityIncrease:hover {
				width: 30%;
				height: 40px;
				line-height: 40px;
				float: left;
				text-align: center;
				font-size: 21px;
				color: #747474;
				background: #E0E0E0;
				cursor: pointer;
			}
			
			.quantity {
				width: 40%;
				height: 40px;
				line-height: 40px;
				float: left;
				text-align: center;
				font-size: 16px;
				color: #747474;
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
			
			.quantityDecrease {
				width: 30%;
				height: 40px;
				line-height: 40px;
				float: left;
				text-align: center;
				font-size: 25px;
				color: #747474;
			}
			
			.quantityDecrease:hover {
				width: 30%;
				height: 40px;
				line-height: 40px;
				float: left;
				text-align: center;
				font-size: 25px;
				color: #747474;
				background: #E0E0E0;
				cursor: pointer;
			}
			
			.tick2 {
				border-color: #ff6700 !important;
				background-color: #ff6700 !important;
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
					<div class="check left">
						<i onclick="checkAll()">√</i>
					</div>
					<div class="img left">全選</div>
					<div class="name left">商品名稱</div>
					<div class="price left">單價</div>
					<div class="number left">數量</div>
					<div class="size left">尺寸</div>
					<div class="subtotal left">小計</div>
					<div class="delete left">刪除</div>
				</div>
				<%for(CartItem cartItem:cart.getCartItemsSet()) {%>
					<div class="row hide">
						
						<div class="check left">
							<i class="i_check" id="i_check" onclick="i_check()">√</i>
						</div>
						<div class="img left"><img src='<%= cartItem.getPhotoUrl() %>' width="80" height="80"></div>
						<div class="name left"><%= cartItem.getProductName() %></div>
						<div class="price left"><%=cart.getUnitPrice(cartItem) %></div>
						<div class="quantityDiv"><div class="quantityInnerDiv"><div class="quantityDecrease">-</div><div class='quantity'><input type='number' class='quantity' value='<%=cart.getQuantity(cartItem) %>' name='quantity<%=cartItem.hashCode() %>' required></div><div class="quantityIncrease">+</div></div> </div>
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
				<div id="checkOutAmountDiv">
					合計：<span id="checkOutAmount"><%=cart.getTotalAmount() %></span>元
				</div>
				<span><input type='submit' value='修改購物車'></span>
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
		<%@include file='/subviews/footer.jsp' %> 
		</article>
	</body>
</html>