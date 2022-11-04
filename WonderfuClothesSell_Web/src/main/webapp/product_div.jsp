<%@page import="com.wcs.entity.Product"%>
<%@page import="com.wcs.service.ProductService" %>
<%@ page pageEncoding="UTF-8"%>

	<%
		String productId = request.getParameter("productId");
		ProductService service = new ProductService();
		Product p = null;
		if(productId!=null){
			p = service.getIdProduct(productId);
		}
	%>
	<%=p %>
	<%if(p==null){ %>
		<p>查無此產品(產品編號為: <%= productId %>).<p>
	<%}else{ %>
	<div class='productDetails'>
		<img src='https://images.deliveryhero.io/image/fd-tw/LH/b2ql-hero.jpg?width=400&height=400&quality=45'>
		<h3>招牌甘泉魚麵</h3>
		<div>定價:100</div>
		<div>折扣:21%</div>
		<div>售價:79</div>
		<div>庫存: 1</div>
		<form>
			
			<label>容量:</label>
			<input type='radio' name='volumn' value='大' required>
			<input type='radio' name='volumn' value='中'>
			<input type='radio' name='volumn' value='小'>
			<label>數量:</label>
			<input type='number' min='1' max='12' required>
			<input type='submit' value="加入購物車">
		</form>
		
	</div>
	<% }%>