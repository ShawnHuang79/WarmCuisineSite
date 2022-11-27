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
		//$("#productSizeRadio").on('change', changeProductHandler)
		//$("cartForm").on("submit", addToCart); //會多重註冊同一個程式，會出問題。
		$("input[name='sizeName']").on('change',changeSizeData);
		
		<%--<%if(request.getMethod().equals("POST")){%>
			//repopulateForm();
		<%}%> 用在點擊選項時更換圖片--%>
	}
	function changeSizeData(){
		var theOption = $(this);
		var listPrice = theOption.attr('data-listPrice');
		var unitPrice = theOption.attr('data-unitPrice');
		
		$("#listPriceSpan").text(listPrice);
		$("#unitPriceSpan").text(unitPrice);
	}

	function repopulateForm(){
<%-- 		$("input[value='<%= request.getParameter()]"); --%>
		//$ .trigger  //模仿使用者點選的動作。
	}
	function changeProductHandler(){
		//$("#theProductPhoto").attr('src', $(this).attr('data-photo'));
		//$("#colorStockSpan").html('('color+":"+stock+ '個)')
		
		//$("select[name='colorName'] option:selected")如果用select+option的寫法。
	}
	var ajax = true;
	function addToCart(e){
		if(ajax){
			e.preventDefault();
			$.ajax({
				url: $("#cartForm").attr("action")+"?ajax="+ajax, //把ajax參數用get送出去
				method: $("#cartForm").attr("method"),
				data: $("#cartForm").serialize()
			}).done(addToCartDoneHandler);
		}
	}
	function addToCartDoneHandler(response){
		alert("加入購物車成功");//考慮改和登出一樣snackbar
		$(".cartQuantitySpan").text("("+response.totalQuantity+")");
	}
	//改Json回傳格式用
	/*function getSizeJsonDataDoneHandler(data){
		var jsonSizeArray = data.sizeArray;
		$("#sizeDiv>div").html('');
		for(i=0;i<jsonSizeArray.length;i++){
			var jsonSize = jsonSizeArray[i];
			var radioInput = "<input type = 'radio' value='M' name='size' required ">
			var sizeLabel = "<label>"+jsonSize.sizeName+"</label>";
			
			$("#sizeDiv>div").append(radioInput);
			$("#sizeDiv>div").append(sizeLabel);
				
		}
	}*/
	
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
		<div id='theProductPhoto' style="background-image: url(<%=p.getPhotoUrl()%>)">

<%-- 			<img  src='<%=p.getPhotoUrl()+ "?width=400&height=400&quality=45"%>'> --%>
		</div>
		<h3><%= p.getName()%></h3>
		<!-- 			右上角購物車小圖示 -->

		<span style='float:right' class='cartQuantitySpan' > 
			${empty sessionScope.cart?"":String.format("(%d)",sessionScope.cart.totalQuantity)}
		</span> 
		<a href='/wcs/member/cart.jsp' style='float:right'>購物車</a>
		<%if(p instanceof Outlet){ %>
		<div>定價:<span id='listPriceSpan'><%= ((Outlet)p).getListPrice()%></span>元</div>
		<div>折扣:<%= ((Outlet)p).getDiscount()%>%</div>
		<div>售價:<span id='unitPriceSpan'><%= ((Outlet)p).getUnitPrice()%></span>元</div>
		<%}else{ %>
		<div>定價:<span id='unitPriceSpan'><%= p.getUnitPrice()%></span>元</div>
		<%} %>

		<form method='GET' action='/wcs/add_cart.do' id='cartForm' onsubmit="addToCart(event)"><%--希望能資料檢查，但不送出請求，event是預設全域變數? --%>
			<input type='hidden' name='productId' value='<%=productId%>'>
			<div>
<!-- 				size中的unitPrice其實是listPrice -->
				<label>容量:</label>
<%--  				<%for (int i=0; i<p.getSizesList().size(); i++){  --%>
<%-- 				%> --%>
<%-- 				<input id='productSizeRadio' type='radio' name='sizeName' value='<%=p.getSizesList().get(i).getSizeName() %>' data-photo='' required --%>
<%-- 					 data-listPrice='<%=p.getSizesList().get(i).getUnitPrice() %>'  --%>
<!-- 				> -->
<%-- 				<label><%=size.getSizeName() %>及<%=size.getUnitPrice() %></label> --%>
					
<%-- 				<% }%> --%>
 				<%for (Size size:p.getSizesList()){ 
				%> 
				<input id='productSizeRadio' type='radio' name='sizeName' value='<%=size.getSizeName() %>' data-photo='' required
					 data-listPrice='<%=size.getListPrice() %>' data-unitPrice='<%=size.getUnitPrice() %>' 
				>
				<label><%=size.getSizeName() %></label>
					
				<% }%>
				
				

<!-- 				<input class='productVolumnRadio' type='radio' name='volumn' value='中'><label>中</label> 
				<input class='productVolumnRadio' type='radio' name='volumn' value='小'><label>小</label>-->
			</div>
			<label>數量:</label>
			<input type='number' min='1' max='12' name='quantity' required>
			<input type='submit' value="加入購物車" onclick='ajax=true'>
			<input type='submit' value="直接結帳" onclick='ajax=false'>
		</form>
	</div>
<% }%>
