<%@page import="com.wcs.entity.Outlet"%>
<%@page import="com.wcs.exception.WCSInvalidDataException"%>
<%@page import="com.wcs.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.wcs.service.ProductService"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		<style>
			@import url(/wcs/css/wcs.css);
			@import url(/wcs/css/lightbox.css);
			body {
				margin: 0px;
			}
			a {
    			text-decoration:none;
			}
			.vendor-list{
				list-style: none;
				display: flex;
				flex-direction: row; /*row column row-reverse column-reverse*/
				flex-wrap: wrap;
				justify-content: center;
			
			}
			.vendor-list li{
				width: 650px;
				border: 1px solid ;
				border-color: rgba(0,0,0,0.2);
				padding-top: 30px;
				border-radius: 10px;
				/*background: #F0F0FF;*/
				text-align: center;
				margin: 10px;
				
				
			}
			.vendor-tile{
				display: flex;
				flex-direction: row; /*row column row-reverse column-reverse*/
				justify-content: space-between;

				
			}
			
			.vendor-tile img, .vendor-info, #Description{
				width: 250px;
				height: 180px;
			}
			.vendor-info{
				display:flex;
				flex-direction: column; /*row column row-reverse column-reverse*/
				justify-content: space-around;
				text-align:left;
				
			}
			.productDescription{
				color:#333
			}
			#productDescriptionName{
				font-weight:bold;
			}


			/*.photo{
				width: 200px;
				height: 150px;
			}*/
			/*.column {
			  float: left;
			  width: 25%;
			}*/
			

	    </style>
	    <script src="https://code.jquery.com/jquery-3.0.0.js" 
			integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
			crossorigin="anonymous"></script>
	    <script>
	    	function getProductByCategory(){
	    		
	    	}
	    	$(document).ready(init);
	    	function init(){
	    		
	    	}
	    	function getBookPng(theImg){
	    		alert(this);
	    		$(theImg).attr("src", "images/defaultpicture.png")
	    	}
	    	function getProductData(pid, doAjax){ //如果需要p的資料，就從參數pid送來，doAjax控制同步非同步，
	    		//
	    		var urlPath = 'product_div.jsp?productId='+pid;/*product_div是ajax中顯示的內容*/
	    		if(doAjax){
	    			$.ajax({
	    				url: urlPath,
	    				method: 'GET'
	    			}).done(getProductDataDoneHandler);
	    			
	    		}else{
	    			location.href=('product.jsp?productId='+pid)//同步請求
	    		}
	    	}
	    	function getProductDataDoneHandler(response){

	    		$("#getProductData_Div").html(response);
				openModal()
	    	}
			function openModal() {
				  document.getElementById("myModal").style.display = "block";
				  setTimeout(function(){document.getElementById("myModal").style.opacity = 1;},50);
				}
			function closeModal() {
			    document.getElementById("myModal").style.opacity = 0
			    setTimeout(function(){document.getElementById("myModal").style.display = "none";},300);
			}
	    </script>
	    
	</head>
	<body>
		<jsp:include page='/subviews/header.jsp' > 
			<jsp:param value="Product" name="subtitle"/>
		</jsp:include>
		<%@include file='/subviews/nav.jsp' %> 
<!-- lightbox 要和header整合-->
		<div id="myModal" class="modal">
	 		<div class="close cursor" onclick="closeModal()">&times;</div>
	  		<div id='getProductData_Div' class="modal-content">
			</div>
		</div>
<!-- lightbox -->

		<script>

		</script>
		<%
			//1.取得QueryString中指定的參數
			String newest = request.getParameter("newest");
			String keyword = request.getParameter("keyword");
			String category = request.getParameter("category");
			double minPrice = 0;
			double maxPrice = 0;
			if((request.getParameter("minPrice"))!=null){
				try{
					minPrice = Double.parseDouble(request.getParameter("minPrice"));
				}catch (Exception e){
				}
			}
			if((request.getParameter("maxPrice"))!=null){
				try{
					maxPrice = Double.parseDouble(request.getParameter("maxPrice"));
				}catch (Exception e){
				}
			}
			ProductService service = new ProductService();
			List<Product> list = null;			
			if(newest!=null){
				list = service.getNewestProducts();
			}else if(keyword!=null && keyword.length()>0){
				list = service.getKeywordProducts(keyword);
			}else if(category!=null && category.length()>0){
				list = service.getCategoryProducts(category);
			}
			else if(minPrice!=0 && maxPrice!=0){
				list = service.getPriceIntevalProducts(minPrice, maxPrice);
			}
			else{
				list = service.getAllProducts();
			}
		%>
		<aside>
 			<a href='?'>全部產品</a><br> <%--query string --%>
			<a href='?newest='>最新上架</a><br>
			<a href='?category=餐點'>餐點</a><br>
			<a href='?category=飲料'>飲料</a><br>
<!-- 			<a href='javascript:getProductByCategory("飲料")'>飲料</a><br> -->
		</aside>
		<article>

			<ul class="vendor-list" data-title-pickup=""
				data-title-delivery="熱門餐廳" >
				<% if(list==null||list.size()==0){ %>
					<h2>查無產品</h2>
				<%}else{ %>
					<%-- for(int i=0;i<list.size();i++){
						Product p = list.get(i);--%>
					<%
						for(Product p:list){
					%>	
						<li>
							<figure class="vendor-tile">

								<div id='Description'>
									<a href='javascript:getProductData(<%= p.getId() %>, true)'>
										<div class="vendor-info">
											<div>
												<span class="productDescription" id='productDescriptionName'><%= p.getName()%></span>
												<p class="productDescription"><%=p.getDescription() %></p>
											</div>
											<div>
												<p class="productDescription">
													<% if(p instanceof Outlet){%>
														<%=((Outlet)p).getListPrice()%>
													<%}else{ %>
														<%=p.getUnitPrice() %>
													<%} %>元起
												</p>
											</div>
										</div>
									</a>
								</div>
								<div>
									<a href='javascript:getProductData(<%= p.getId() %>)'> 
										<picture class="vendor-picture">
											<img src='<%= p.getPhotoUrl() %>' onerror='getBookPng(this)'> <%--加入圖片的error處理 --%>
										</picture>
									</a>
								</div>
							</figure>
						</li>
						<br>						
					<%
					}
				}
				%>		
			</ul>
	    </article>    
	</body>
</html>