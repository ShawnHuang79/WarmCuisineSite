<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
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
	    </style>
	</head>
	<body>
		<jsp:include page='/subviews/header.jsp' > 
			<jsp:param value="Product" name="subtitle"/>
		</jsp:include>
		<%@include file='/subviews/nav.jsp' %> 
		<article>
			<ul class="vendor-list" data-title-pickup=""
				data-title-delivery="熱門餐廳" >
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