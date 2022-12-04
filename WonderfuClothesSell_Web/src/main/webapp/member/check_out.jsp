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
				/*margin: 0;
				padding: 0;
				color: #666;
				font-size: 14px;*/
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
			<jsp:param value="結帳" name="subtitle"/>
		</jsp:include>
<%-- 		<%@include file='/subviews/nav.jsp' %>  --%>
		<%
			ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");	
		%>	
		<article>
<%-- 		<%=cart %> --%>
		<%if(cart==null || cart.isEmpty()) {%>
			<div>購物車是空的，請先購物</div>
		<%}else{ %>
			<p>${errorList}</p>
			<form action='check_out.do' method='POST' id='cartForm'>
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
				</div>
				<%for(CartItem cartItem:cart.getCartItemsSet()) {%>
					<div class="row hide">
						<div class="check left">
							<i class="i_check" id="i_check" onclick="i_check()">√</i>
						</div>
						<div class="img left"><img src='<%= cartItem.getPhotoUrl() %>' width="80" height="80"></div>
						<div class="name left"><%= cartItem.getProductName() %></div>
						<div class="price left"><%=cart.getUnitPrice(cartItem) %></div>
						<div class="number left"><%=cart.getQuantity(cartItem) %></div>
						<div class="size left"><%= cartItem.getSizeName() %></div>
						<div class="subtotal left"><%=cart.getUnitPrice(cartItem) %></div>
	
					</div>
				<%} %>
			</div>
			<div id="sumArea">
				<div id="checkOutAmountDiv">
					合計：<span id="checkOutAmount"><%=cart.getTotalAmount() %></span>元
				</div>
			</div>
				<table>
				<tfoot>
					<tr>
						<td colspan='3'>
						共<%= cart.size() %>項 <%=cart.getTotalQuantity() %>件, 
						總金額: <%=cart.getTotalAmount() %>元						
						</td>						
					</tr>
					<tr >
						<td class='inputTd' colspan='1'>
							<span>
								<label>取件方式:</label>
								<select name='shippingType' required>
									<option value=''>請選擇...</option>
									<option value='SHOP' >店面自取</option>									
									<option value='HOME' data-fee='100'>宅配,100元</option>
									<option value='STORE' data-fee='65'>超商, 65元</option>									
								</select>
							</span>								
							<span>
								<label>付款方式:</label>
								<select name='paymentType' required>
									<option value=''>請選擇...</option>
									<option value='SHOP'>自取付款</option>
									<option value='ATM'>ATM轉帳</option>
									<option value='HOME' data-fee='50'>貨到付款,50</option>
									<option value='STORE'>超商付款</option>
									<option value='CARD'>信用卡付款</option>
								</select>
							</span>
						</td>
						<td colspan='2'>
<%-- 							總金額+物流費: <%=cart.getTotalAmount() %><span id='feeSpan'></span><span id='totalAmountWithFee'></span>元 --%>
						</td>				
					</tr>
					<tr>
						<td colspan='3'>							
								<fieldset style='width:75%;margin: auto;text-align: left'>
									<legend>收件人 <a style='font-size: smaller' href="javascript:copyMember()">同訂購人</a></legend>								
									<label>姓 名: </label><input name='recipientName' required><br>
									<label>Email:</label><input name='recipientEmail' required><br>
									<label>電 話: </label><input name='recipientPhone' required><br>									
									<label>地 址: </label><input name='shippingAddress' required><br>
								</fieldset>
						</td>
					</tr>
					<tr>
						<td colspan='3'>
						<input type='submit' value='送出訂單'>
						</td>
					</tr>
				</tfoot>
			</table>
			</form>
		<%} %>
	</article>
		<%@include file='/subviews/footer.jsp' %>
	</body>
</html>