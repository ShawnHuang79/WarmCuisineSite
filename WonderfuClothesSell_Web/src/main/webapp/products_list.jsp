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
			.photo{
				width: 200px;
				height: 150px;
			}
			#getProductData_Div{
				width: 1000px;
				height: 800px;
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
	    		var urlPath = 'product.jsp?productId=1'+pid;
	    		if(doAjax){
	    			$.ajax({
	    				url: urlPath,
	    				method: 'GET'
	    			}).done(getProductDataDoneHandler);
	    			
	    		}else{
	    			location.href=urlPath//同步請求
	    		}
	    	}
	    	function getProductDataDoneHandler(response){
	    		//console.log(response);

	    		$("#getProductData_Div").html(response);
<!-- fancybox -->
	    		$.fancybox.open({
	    		    src  : '#getProductData_Div',
	    		    type : 'inline',
	    		    opts : {
	    		    	afterShow : function( instance, current ) {
	    		       	console.info('done!');
	    	     		}
	    	   		}
	    	  	});
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
		<div id='getProductData_Div'>
		</div>
<!-- fancybox -->
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
			//String minPrice = request.getParameter("minPrice");
			//String maxPrice = request.getParameter("maxPrice");
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
		<% if(list==null||list.size()==0){ %>
		<h2>查無產品</h2>
		<%}else{ %>
			<ul class="vendor-list" data-title-pickup=""
				data-title-delivery="熱門餐廳" >
				<% for(int i=0;i<list.size();i++){
					Product p = list.get(i);%>
					<img class='photo' src='<%= p.getPhotoUrl() %>' onerror='getBookPng(this)'>
					<%= p.getPhotoUrl()%>
					<%= p.getCategory() %>
					<%= p.getDiscount() %>
				<%
				}
		}
				%>
<!--				<a href='?'
 				要用?的方式傳上網址列進行搜尋，是給使用者用選擇的方式作為查詢條件? -->
				<li>
					
					<figure class="vendor-tile">
						<a href='javascript:getProductData()'> <%-- <%= p.getId() %>要用參數送到function使用 --%>
							<picture class="vendor-picture">
									<img src="images/food.jpg"><!-- 這裡是連到食物的圖片 -->
							</picture>
						</a>
						<a href='javascript:getProductData("", true)'>
						<figcaption class="vendor-info">
							<span class="headline">臻蜜定食舖</span>
								<div class="ratings-component">
									<span class="stars"></span>
									<span class="rating"><strong>4.4</strong>/5</span>
								</div>
							<p>&lt;店內價&gt;台式</p>
							<p><strong>免費</strong> 外送</p>
						</figcaption>
						</a>
					</figure>
					
				</li>
				<li>
					<figure class="vendor-tile">
						<picture class="vendor-picture">
								<img src="https://images.deliveryhero.io/image/fd-tw/LH/tfbb-hero.jpg"><!-- 這裡是連到食物的圖片 -->
						</picture>
						<figcaption class="vendor-info">
							<span class="headline">臻蜜定食舖</span>
								<div class="ratings-component">
									<span class="stars"></span>
									<span class="rating"><strong>4.4</strong>/5</span>
								</div>
							<p>&lt;店內價&gt;台式</p>
							<p><strong>免費</strong> 外送</p>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure class="vendor-tile">
						<picture class="vendor-picture">
								<img src="https://images.deliveryhero.io/image/fd-tw/LH/b2ql-hero.jpg"><!-- 這裡是連到食物的圖片 -->
						</picture>
						<figcaption class="vendor-info">
							<span class="headline">臻蜜定食舖</span>
								<div class="ratings-component">
									<span class="stars"></span>
									<span class="rating"><strong>4.4</strong>/5</span>
								</div>
							<p>&lt;店內價&gt;台式</p>
							<p><strong>免費</strong> 外送</p>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure class="vendor-tile">
						<picture class="vendor-picture">
								<img src="https://images.deliveryhero.io/image/fd-tw/LH/szlu-hero.jpg"><!-- 這裡是連到食物的圖片 -->
						</picture>
						<figcaption class="vendor-info">
							<span class="headline">臻蜜定食舖</span>
								<div class="ratings-component">
									<span class="stars"></span>
									<span class="rating"><strong>4.4</strong>/5</span>
								</div>
							<p>&lt;店內價&gt;台式</p>
							<p><strong>免費</strong> 外送</p>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure class="vendor-tile">
						<picture class="vendor-picture">
								<img src="https://images.deliveryhero.io/image/fd-tw/LH/y2mr-hero.jpg"><!-- 這裡是連到食物的圖片 -->
						</picture>
						<figcaption class="vendor-info">
							<span class="headline">臻蜜定食舖</span>
								<div class="ratings-component">
									<span class="stars"></span>
									<span class="rating"><strong>4.4</strong>/5</span>
								</div>
							<p>&lt;店內價&gt;台式</p>
							<p><strong>免費</strong> 外送</p>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure class="vendor-tile">
						<picture class="vendor-picture">
								<img src="images/food.jpg"><!-- 這裡是連到食物的圖片 -->
						</picture>
						<figcaption class="vendor-info">
							<span class="headline">臻蜜定食舖</span>
								<div class="ratings-component">
									<span class="stars"></span>
									<span class="rating"><strong>4.4</strong>/5</span>
								</div>
							<p>&lt;店內價&gt;台式</p>
							<p><strong>免費</strong> 外送</p>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure class="vendor-tile">
						<picture class="vendor-picture">
								<img src="https://www.foodpanda.com.tw/restaurant/y2mr/pa-pa-rice-yi-shi-dun-fan"><!-- 這裡是連到食物的圖片 -->
						</picture>
						<figcaption class="vendor-info">
							<span class="headline">臻蜜定食舖</span>
								<div class="ratings-component">
									<span class="stars"></span>
									<span class="rating"><strong>4.4</strong>/5</span>
								</div>
							<p>&lt;店內價&gt;台式</p>
							<p><strong>免費</strong> 外送</p>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure class="vendor-tile">
						<picture class="vendor-picture">
								<img src="images/food.jpg"><!-- 這裡是連到食物的圖片 -->
						</picture>
						<figcaption class="vendor-info">
							<span class="headline">臻蜜定食舖</span>
								<div class="ratings-component">
									<span class="stars"></span>
									<span class="rating"><strong>4.4</strong>/5</span>
								</div>
							<p>&lt;店內價&gt;台式</p>
							<p><strong>免費</strong> 外送</p>
						</figcaption>
					</figure>
				</li>
				<li>
					<figure class="vendor-tile">
						<picture class="vendor-picture">
								<img src="images/food.jpg"><!-- 這裡是連到食物的圖片 -->
						</picture>
						<figcaption class="vendor-info">
							<span class="headline">臻蜜定食舖</span>
								<div class="ratings-component">
									<span class="stars"></span>
									<span class="rating"><strong>4.4</strong>/5</span>
								</div>
							<p>&lt;店內價&gt;台式</p>
							<p><strong>免費</strong> 外送</p>
						</figcaption>
					</figure>
				</li>
			</ul>
	    </article>    
	</body>
</html>