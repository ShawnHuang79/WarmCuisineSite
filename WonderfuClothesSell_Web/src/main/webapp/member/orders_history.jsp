<%@page import="com.wcs.entity.Order"%>
<%@page import="com.wcs.service.OrderService"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>歷史訂單</title>
		<style>
			@import url(/wcs/css/wcs.css);
	    </style>
	</head>
	<body>
		<jsp:include page='/subviews/header.jsp' > 
			<jsp:param value="歷史訂單" name="subtitle"/>
		</jsp:include>
		<%@include file='/subviews/nav.jsp' %> 
		<%			
			List<Order> list = null;
			OrderService oService = new OrderService();
			Customer member = (Customer)session.getAttribute("member");
			if(member!=null){
				list = oService.getOrderHistory(member.getId());
			}		
		%>
		
<article>
			<% if(list==null || list.size()==0){ %>
				<h2>查無您的歷史訂單</h2>
			<%}else{ %>
			<table id='ordersHistory'>
				<caption>歷史訂單</caption>
				<thead>
					<tr>
						<th>訂單編號</th><th>訂購日期時間</th><th>取貨/付款</th><th>總金額</th><th></th>
					</tr>
				</thead>
				<tbody>
					<% for(Order order:list){%>
					<tr>
						<td><%= order.getId()%></td>
						<td><%= order.getCreatedDate() %> <%= order.getCreatedTime() %></td>
						<td><%= order.getShippingType().getDescription() %>, 
								<%= order.getPaymentType().getDescription() %></td>
						<td><%=order.getTotalAmount()%>及<%= order.getTotalAmountWithFee() %>元</td><td><a href='order.jsp?orderId=<%= order.getId() %>'>檢視明細</a></td>
					</tr>				
					<% } %>
				</tbody>
			</table>
			<% } %>
		</article>
		<%@include file='/subviews/footer.jsp' %>
	</body>
</html>