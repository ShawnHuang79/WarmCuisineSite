<%@page import="com.wcs.entity.Product"%>
<%@page import="com.wcs.service.ProductService" %>
<%@ page pageEncoding="UTF-8"%>
<%--TODO考慮放header --%>
<a href='/wcs/member/cart.jsp'>購物車</a>
<span style='float:right' class='cartQuantitySpan' > 
	${empty sessionScope.cart?"":String.format("(%d)",sessionScope.cart.totalQuantity)}
</span> 
<%@include file='/subviews/product_data.jsp' %>
