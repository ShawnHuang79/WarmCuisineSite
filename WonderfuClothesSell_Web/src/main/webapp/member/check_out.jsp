<%@page import="com.wcs.entity.ShippingType"%>
<%@page import="com.wcs.entity.CartItem"%>
<%@page import="com.wcs.entity.ShoppingCart"%>
<%@page import="com.wcs.entity.Order"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Check out</title>
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
				width: 800px;
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
				width: 800px;
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
				/*margin-top: 100px;*/
			}
			#customerInfo{
				margin: 0px 30%;
				display:flex;
				flex-direction: column;
				justify-content: space-between;
				height:300px;
				float: right;
				text-align: right;
			}
			
			#checkoutSubmit{
				background-color: #984B4B;
				color: #fdf9f0;
				position: relative;
				cursor: pointer;
				width: 200px;
  				height: 40px;
  				font-size: 1em;
			}
			.checkoutSelect{
				width: 200px;
				height: 40px;
				font-size: 20px;
				cursor: pointer;
				text-align: center;
				
			}
			

	    </style>
	    <script src="https://code.jquery.com/jquery-3.0.0.js" 
				integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
				crossorigin="anonymous"></script>
		<script>
			 function copyMember(){
				$("input[name='recipientName']").val('${sessionScope.member.name}');
				$("input[name='recipientEmail']").val('${sessionScope.member.email}');
				$("input[name='recipientPhone']").val('${sessionScope.member.phone}');
				var shippingOpt = $("select[name='shippingType'] option:selected").val();
				if(shippingOpt == '<%= ShippingType.HOME.name() %>'){
					$("input[name='shippingAddress']").val('${sessionScope.member.address}');
				}
			}
		</script>
	</head>
	<body>
		<jsp:include page='/subviews/header.jsp' > 
			<jsp:param value="??????" name="subtitle"/>
		</jsp:include>
<%-- 		<%@include file='/subviews/nav.jsp' %>  --%>
		<%
			ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");	
		%>	
		<article>
<%-- 		<%=cart %> --%>
		<%if(cart==null || cart.isEmpty()) {%>
			<div>?????????????????????????????????</div>
		<%}else{ %>
			<p>${errorList}</p>
			<form action='check_out.do' method='POST' id='cartForm'>
				<div id="cart" class="cart">
			
					<div class="cartHead hide">
						<div class="img left"></div>
						<div class="name left">????????????</div>
						<div class="price left">??????</div>
						<div class="quantityDiv left">??????</div>
						<div class="size left">??????</div>
						<div class="subtotal left">??????</div>
					</div>
					<%for(CartItem cartItem:cart.getCartItemsSet()) {%>
						<div class="row hide">
							<div class="img left"><img src='<%= cartItem.getPhotoUrl() %>' width="80" height="80"></div>
							<div class="name left"><%= cartItem.getProductName() %></div>
							<div class="price left"><%=cart.getUnitPrice(cartItem) %></div>
							<div class="quantityDiv left"><%=cart.getQuantity(cartItem) %></div>
							<div class="size left"><%= cartItem.getSizeName() %></div>
							<div class="subtotal left"><%=cart.getUnitPrice(cartItem) %></div>
		
						</div>
					<%} %>
				</div>
				<div id="sumArea">
					<div id="checkOutAmountDiv">
						???<%= cart.size() %>??? <%=cart.getTotalQuantity() %>??? ?????????<span id="checkOutAmount"><%=cart.getTotalAmount() %></span>???
					</div>
				</div>
				<div id="customerInfo">						
					<div>
						<select class='checkoutSelect' name='shippingType' required>
							<option value='' disabled selected hidden>?????????????????????</option>
							<option value='SHOP' >????????????</option>									
							<option value='HOME' data-fee='100'>??????,100???</option>
							<option value='STORE' data-fee='65'>??????, 65???</option>									
						</select>					
						
						<select class='checkoutSelect' name='paymentType' required>
							<option value='' disabled selected hidden>?????????????????????</option>
							<option value='SHOP'>????????????</option>
							<option value='ATM'>ATM??????</option>
							<option value='STORE'>????????????</option>
							<option value='CARD'>???????????????</option>
						</select>
					</div>
	<%-- 							?????????+?????????: <%=cart.getTotalAmount() %><span id='feeSpan'></span><span id='totalAmountWithFee'></span>??? --%>
					<div>????????? <a style='font-size: smaller' href="javascript:copyMember()">????????????</a></div>								
					<div>??? ?????? <input name='recipientName' required></div>
					<div>Email???<input name='recipientEmail' required></div>
					<div>??? ?????? <input name='recipientPhone' required></div>								
					<div>??? ?????? <input name='shippingAddress' required></div>
					<div><input id='checkoutSubmit' type='submit' value='????????????'></div>
				</div>
			</form>
		<%} %>
	</article>
<%-- 		<%@include file='/subviews/footer.jsp' %> --%>
	</body>
</html>