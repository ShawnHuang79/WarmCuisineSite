<%@page import="com.wcs.entity.Customer"%>
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
			#ordersHistoryOuter{
				width: 60%;
				margin: 0px 20%;
			}
			
			.ordersHistory{
				display: flex;
				flex-direction: row;
				justify-content: space-around;
			}
			
			 .id, .date, .type, .amount, .detail{
				width: 150px;
				text-align: center;
			}
			.id{
				width: 120px;
			}
			
			.type{
				width: 200px;
			}
			.ordersHistoryTitle{
				font-size: 1.2em;
				margin-bottom: 20px;
				font-weight: bold;
				text-align: center;
			}
			
	    </style>
	</head>
	<body>
		<jsp:include page='/subviews/header.jsp' > 
			<jsp:param value="歷史訂單" name="subtitle"/>
		</jsp:include>
<%-- 		<%@include file='/subviews/nav.jsp' %>  --%>
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
			<div id='ordersHistoryOuter'>
				
				<div>
					<div class='ordersHistoryTitle'>歷史訂單</div>
					<div class='ordersHistory ordersHistoryTitle'>
						<div class='id'>訂單編號</div>
						<div class='date'>訂購日期時間</div>
						<div class='type'>取貨/付款</div>
						<div class='amount'>總金額</div>
						<div class='detail'></div>
					</div>
				</div>
				<div>
					<% for(Order order:list){%>
					<div class='ordersHistory'>
						<div class='id'><%= order.getId()%></div>
						<div class='date'><%= order.getCreatedDate() %> <%= order.getCreatedTime() %></div>
						<div class='type'><%= order.getShippingType().getDescription() %>, 
								<%= order.getPaymentType().getDescription() %></div>
						<div class='amount'><%= order.getTotalAmountWithFee() %>元</div>
						<div class='detail'><a href='order.jsp?orderId=<%= order.getId() %>'>檢視明細</a></div>
					</div>				
					<% } %>
				</div>
			</div>
			<% } %>
		</article>
		<%@include file='/subviews/footer.jsp' %>
	</body>
</html>