<%@page pageEncoding='UTF-8'%>
<!DOCTYPE HTML>
<html>
	<head>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta charset="UTF-8">
	    <link rel="icon" type="image/x-icon" href="/wcs/images/fork.png">
	    <title>歡迎光臨</title>
	    <style>
	        @import url(/wcs/css/wcs.css);

			body {
				
				margin: 0px;
			}
			/*首頁輪撥*/
			
			#outer{
				position:relative;
				width:100%;/*image width=753 height=357*/
				height:100%;
				overflow:hidden;
				/*background-image:url(/wcs/images/image1.jpg);*/
				/*background-color:#666;*/
				margin:auto;
				/*transition: background 1s linear;*/
			}
			#outer:hover{
				/*background: transparent;可能要改成更換背景圖*/ 
			}
			
			#imgs{
				position:relative;
				width:300vw;/*image width=753x5=3765px*/
				/*display: flex;*/
				opacity: 0.6;
				display: flex;
				
			}
			#imgs:hover{
				/*寫入停止程式?*/
			}
			#imgs img{
				width:100vw;
				height:100vh;
				opacity: 0.2;
				transition: opacity 1s linear;
			}
			#logoAndNav{
				opacity:0;
				transition: opacity 1s linear;
			}
			/*首頁輪撥*/
			#logo, #nav{
				font-size:5em;
				color:#fdf9f0;/*#fdf9f0 #984B4B*/
				position:absolute;
				top:15%;
				left:30%;
				font-weight: bolder;
				/*background-color: ()*/
			}
			#nav{
				font-size:1.3em;
				top:40%;
				left:40%;
				width:400px;
				display:flex;
				flex-direction: row;
				justify-content:space-between;
				color:black;
			}
			.navText{
				/*padding:10px;*/
			}
			#nav a:visited{
				color:black;
			}
			.indexFooter{
				display:flex;
				flex-direction: row;
				flex-wrap: wrap;
				justify-content: space-around;
			}
	    </style>
	    <script src="https://code.jquery.com/jquery-3.0.0.js" 
	    integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		<script type="text/javascript">
			// 首頁輪播
			var myInterval, index=0;
				$(document).ready(function init(){
					//$(".dot,#next,#prev").click(moveHandler);//run the same function
					myInterval = setTimeout(moveHandler, 8000);//initial timer
					$("#imgs img:first").css("opacity","1");
					//logo可以放這裡停頓顯示，就可以讓背景先出現，再出現logo
					$("#imgs img:not(:first)").css("opacity","0.2");
					setTimeout(function(){$("#logoAndNav").css("opacity","1");}, 1200);
				});
				function moveHandler(e){
					clearInterval(myInterval);//reset timer
					myInterval = setTimeout(moveHandler, 8000);//set timeer
					//$("#imgs").css("background")
					//$(".dot:eq("+index+")").css("backgroundColor","gray");//reset dot color
					if(this==window){	index++;//setInterval
					//}else if($(this).attr("myIndex")){	index=Number($(this).attr("myIndex"));//.dot
					}else{	index+=Number($(this).attr("direction"));}// $#prev / #next
					if (index>2) index=0;//last image
					if (index<0) index=2;//first image
					
					$("#imgs img:gt("+(index)+")").css("opacity","0.2");
					$("#imgs img:lt("+(index)+")").css("opacity","0.2");
					setTimeout(function(){
						$("#imgs").stop().animate({"marginLeft":-index*100+"vw"},0);
						$("#imgs img:eq("+(index)+")").css("opacity","1");
					}, 900);
					//$("#imgs").stop().animate({"marginLeft":-index*100+"vw"},0);
					//$("#imgs img:gt("+(index)+")").fadeOut(500);
					//$("#imgs img:lt("+(index)+")").fadeOut(500);
				}
		</script>
	</head>  
  	<body>

<!-- 		首頁輪播 -->
		<div id="outer">
	        <div id="imgs">
				<img src="/wcs/images/image2.jpg">
				<img src="/wcs/images/image1.jpg">
				<img src="/wcs/images/image3.jpg">
			</div>
			<div id='logoAndNav'>
				<div id="logo">Warm Cuisine Site</div>
				<div id="nav">
					<div class='navText'><a href='/wcs/products_list.jsp'>START TASTE</a></div>
					<div><img src="/wcs/images/fork.png"></div>
					<div class='navText'><a href='/wcs/seats.jsp'>RESERVATION</a></div>
				</div>
			</div>
   		</div>
	    <footer>
	    	<div class = 'indexFooter'>
		    	<div>
		    		<h4>address</h4>
		    		<p>105 No. 99, Fuxing N. Rd.,</p>
		    		<p> Songshan Dist., Taipei City</p>
		    	</div>
		    	<div>
		    		<h4>hours</h4>
					<p>Sunday - Thursday</p>
					<p>11:30 am - 9:00 pm</p>
					
					<p>Friday-Saturday</p>
					<p>11:30 am - 10:00 pm</p>
		    	</div>
		    	<div>
		    		<h4>contact</h4>
					<p>02-4568989</p>
					<p>info@wcs.com</p>
		    	</div>
		    </div>
	    </footer> 
<%-- 	    <jsp:include page='/subviews/header.jsp' />  
		<%@include file='/subviews/nav.jsp' %> --%>
	    <%@include file='/subviews/footer.jsp' %> 
 
	</body>
</html>