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
<!-- 		fancybox -->
		<link rel='stylesheet' type='text/css' href='fancybox3/jquery.fancybox.css'>
		<style>
			@import url(/wcs/css/wcs.css);
			body{
	            background-color: white;
	        }
			body {
				margin: 0px;
			}
			.vendor-list{
				list-style: none;
				border: 1px dashed black;
				display: flex;
				flex-direction: row; /*row column row-reverse column-reverse*/
				flex-wrap: wrap;
			
			}
			.vendor-list li{
				width: 400px;
				border: 1px solid black;
				padding-top: 30px;
				background: #F0F0FF;
				text-align: center;
				margin: 10px;
			}
			.vendor-tile img{
				width: 200px;
				height: 150px;
			}
			/*.photo{
				width: 200px;
				height: 150px;
			}*/
			/*.column {
			  float: left;
			  width: 25%;
			}*/
			
			/* lightbox */
			.modal {
			  display: none;
			  opacity: 0;
			  position: fixed;
			  z-index: 1;
			  padding-top: 100px;
			  left: 0;
			  top: 0;
			  width: 100%;
			  height: 100%;
			  overflow: auto;
			  background-color: black;
			  transition: opacity 0.4s;
			}
			
			/* Modal Content */
			.modal-content {
			  position: relative;
			  background-color: #fefefe;
			  margin: auto;
			  padding: 0;
			  width: 90%;
			  max-width: 500px;
			}
			
			/* The Close Button */
			.close {
			  color: white;
			  position: absolute;
			  top: 10px;
			  right: 25px;
			  font-size: 35px;
			  font-weight: bold;
			}
			
			.close:hover,
			.close:focus {
			  color: #999;
			  text-decoration: none;
			  cursor: pointer;
			}
			.cursor {
			  cursor: pointer;
			}
			/* lightbox */
			#getProductData_Div{
				/*width: 1000px;
				height: 800px;*/

			}
	    </style>
	    <script src="https://code.jquery.com/jquery-3.0.0.js" 
			integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
			crossorigin="anonymous"></script>
<!-- fancybox -->
	    <script src='fancybox3/jquery.fancybox.js'></script>
	    <script>
	    	function getProductByCategory(){
	    		
	    	}
	    	$(init);
	    	function init(){
	    		
	    	}
	    	function getBookPng(theImg){	
	    		$(theImg).attr("src", "images/defaultpicture.png")
	    	}
	    	function getProductData(pid, doAjax){ //如果需要p的資料，就從參數pid送來，doAjax控制同步非同步，
	    		//
	    		var urlPath = 'product_div.jsp?productId='+pid;
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
<!-- fancybox -->
				openModal()
<!-- fancybox -->
	    	}
	    	
	    	
	    </script>
	    
	</head>
	<body>
		<jsp:include page='/subviews/header.jsp' > 
			<jsp:param value="Product" name="subtitle"/>
		</jsp:include>
		<%@include file='/subviews/nav.jsp' %> 
<!-- fancybox -->
		<div id="myModal" class="modal">
	 		<span class="close cursor" onclick="closeModal()">&times;</span>
	  		<div id='getProductData_Div' class="modal-content">
			</div>
		</div>
<!-- fancybox -->

		<script>
		function openModal() {
		  document.getElementById("myModal").style.display = "block";
		  setTimeout(function(){document.getElementById("myModal").style.opacity = 1;},50);
		}
		function closeModal() {
		    document.getElementById("myModal").style.opacity = 0
		    setTimeout(function(){document.getElementById("myModal").style.display = "none";},300);
		}
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
 			<a href='?'>全部產品</a><br> <!--query string -->
			<a href='?newest='>最新上架</a><br>
			<a href='?category=餐點'>餐點</a><br>
			<a href='javascript:getProductByCategory("飲料")'>飲料</a><br>
		</aside>
		
		<article>

			<ul class="vendor-list" data-title-pickup=""
				data-title-delivery="熱門餐廳" >
				<% if(list==null||list.size()==0){ %>
					<h2>查無產品</h2>
				<%}else{ %>
					<% for(int i=0;i<list.size();i++){
						Product p = list.get(i);%>
						<li>
							<figure class="vendor-tile">
								<a href='javascript:getProductData(<%= p.getId() %>)'> 
									<picture class="vendor-picture">
											<img src='<%= p.getPhotoUrl() %>'>
									</picture>
								</a>
								<a href='javascript:getProductData(<%= p.getId() %>, true)'>
								<figcaption class="vendor-info">
									<span class="headline"><%= p.getName()%></span>
									<p>&lt;店內價&gt;台式</p>
									<p><strong>免費</strong> 外送</p>
								</figcaption>
								</a>
							</figure>
						</li>						
					<%
					}
				}
				%>
			</ul>
	    </article>    
	</body>
</html>