<%@page import="com.wcs.entity.OrderItem"%>
<%@page import="com.wcs.service.OrderService"%>
<%@page import="com.wcs.entity.Order"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		<style>
			@import url(/wcs/css/wcs.css);
	    </style>
	</head>
	<body>
		<jsp:include page='/subviews/header.jsp' > 
			<jsp:param value="訂單明細" name="subtitle"/>
		</jsp:include>
		<%@include file='/subviews/nav.jsp' %> 
		<%
			
			String orderId = request.getParameter("orderId");
			Order order = null;
			OrderService oService = new OrderService();
			Customer member = (Customer)session.getAttribute("member");
			if(member!=null && orderId!=null){
				order = oService.getOrderByMemberIdAndOrderId(member.getId(), orderId);				
			}		
		%>
		
		<article>
			<% if(order==null) {%>
				<p>查無此訂單</p>
			<% }else{%>
			<div class='master'>
				<div class='order'>
					<div>訂單編號:<%= order.getId() %> 訂購人: ${member.name}</div>
					<div>訂購日期時間: <%= order.getCreatedDate() %> <%= order.getCreatedTime() %></div>				
					<div>取貨方式: <%= order.getShippingType().getDescription() %>  
						, 付款方式:<%= order.getPaymentType().getDescription() %>
<%-- 						<% if(order.getPaymentType() == PaymentType.ATM  --%>
<%-- 							&& order.getStatus()==Order.Status.NEW.ordinal()){%> --%>
<%-- 						<a href='atm_transfer.jsp?orderId=<%= order.getId() %>'>通知已轉帳</a> --%>
<%-- 						<% }%> --%>
					</div>
					<div>訂單狀態: <%= order.getStatusString()%></div>
					<h3>總金額(含物流手續費): <%= order.getTotalAmountWithFee()%>元</h3>
				</div>
				<fieldset class='order'>
					<legend>收件人</legend>								
					<label>姓 名: </label><input value='<%= order.getRecipientName() %> ' readonly><br>
					<label>Email:</label><input value='<%= order.getRecipientEmail() %>' readonly><br>
					<label>電 話: </label><input value='<%= order.getRecipientPhone() %>' readonly><br>									
					<label>地 址: </label><input value='<%= order.getShippingAddress() %>' readonly><br>
				</fieldset>
			</div>
			<div class='master'>
				<div class='statusDiv'>新訂單</div> <i style='font-size:24px' class='fas'>&#xf105;</i>
				<div class='statusDiv'>待處理</div> 
			</div>
			<div class='details' style='clear:both'>
				<% if(order.getOrderItemsSet()==null || order.getOrderItemsSet().isEmpty() ) {%>
					<p>無訂單明細</p>
				<%}else{ %>				
				<table id='orderTable'>
					<caption>訂單明細</caption>
					<thead>
						<tr>
							<th>產 品</th>
							<th>價 格</th>
							<th>數 量</th>
						</tr>
					</thead>
					<tbody>
						<% for(OrderItem orderItem:order.getOrderItemsSet()){%>
						<tr>
							<td>
								<img src='<%= orderItem.getPhotoUrl() %>'>
								<div><%= orderItem.getProductName() %></div>
								<div>
									<span class='colorSizeSpan'>
										<%= orderItem.getSizeName() %>
									</span> 									
								</div>
							</td>
							<td>							
								<div>售價: <%= orderItem.getPrice() %>元</div>
							</td>
							<td>
								<div>數量: <%= orderItem.getQuantity() %></div>
								<div style='font-size: smaller'>小計: <%= orderItem.getAmount() %>元</div>
							</td>
						</tr>	
						<% } %>										
					</tbody>	
					<tfoot>
						<tr>
							<td colspan='3'>
								共<%= order.size() %>項 <%= order.getTotalQuantity() %>件, 總金額: <%= order.getTotalAmount() %>元					
							</td>						
						</tr>					
					</tfoot>
				</table>
				<% } %>
			</div>
	
		<% } %>
	
		</article>
		<%@include file='/subviews/footer.jsp' %>
	</body>
</html>