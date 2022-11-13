<%@page import="com.wcs.entity.Size"%>
<%@page import="com.wcs.entity.Outlet"%>
<%@page import="com.wcs.entity.Product"%>
<%@page import="com.wcs.service.ProductService"%>
<%@ page pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.0.0.js" 
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
	crossorigin="anonymous"></script>
<script>
	$(document).ready(init);
	
	function init(){
		$(".productVolumnradio").on('change', changeProductHandler)
		<%if(request.getMethod().equals("POST")){%>
			repopulateForm();
		<%}%>
	}
	function repopulateForm(){
<%-- 		$("input[value='<%= request.getParameter()]"); --%>
		//$ .trigger  //模仿使用者點選的動作。
	}
	function changeProductHandler(){
		$("#theProductPhoto").attr('src', $(this).attr('data-photo'));
		//$("#colorStockSpan").html('('color+":"+stock+ '個)')
		
		//$("select[name='colorName'] option:selected")如果用select+option的寫法。
	}
</script>


<%
	String productId = request.getParameter("productId");
	ProductService service = new ProductService();
	Product p = null;
	if(productId!=null){
		p = service.getIdProduct(productId);
	}
%>
<%if(p==null){ %>
	<p>查無此產品(產品編號為: <%= productId %>).<p>
<%}else{ %>
	<div class='productDetails'>
		<img id='theProductPhoto' src='<%=p.getPhotoUrl()+ "?width=400&height=400&quality=45"%>'>
		<h3><%= p.getName()%></h3>
		<%if(p instanceof Outlet){ %>
		<div>定價:<%= ((Outlet)p).getUnitPrice()%></div>
		<div>折扣:<%= ((Outlet)p).getDiscount()%></div>
		<%}else{ %>
		<div>定價:<%= p.getUnitPrice()%></div>
		<div>折扣:<%= p.getDiscount()%></div>
		<%} %>
		<div>售價:79</div>
		<div>庫存: 1</div>
		<form method='POST' action>
			<input type='text' name='productId' value='<%=productId%>'>
			<label>顏色:</label>
			<div>
				<label>容量:</label>
				<!-- 取得資料庫中的size大小並加到畫面上 -->
				<%for (String sizeName:p.getSizesMap().keySet()){
					Size size = p.getSizesMap().get(sizeName);
				%>
				<input class='productVolumnradio' type='radio' name='volumn' value='<%=sizeName %>' data-photo='' required
					data-price='<%=size.getPrice() %>'
				>
				<label><%=sizeName %></label>
					
				<% }%>
				
				

<!-- 				<input class='productVolumnradio' type='radio' name='volumn' value='中'><label>中</label> 
				<input class='productVolumnradio' type='radio' name='volumn' value='小'><label>小</label>-->
			</div>
			<label>數量:</label>
			<input type='number' min='1' max='12' required>
			<input type='submit' value="加入購物車">
		</form>
	</div>
<% }%>