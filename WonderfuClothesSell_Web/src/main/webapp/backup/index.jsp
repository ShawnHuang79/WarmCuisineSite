<%@page pageEncoding='UTF-8'%>
<!DOCTYPE HTML>
<html>
	<head>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta charset="UTF-8">
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
			/*background-image:url(images/map.png);
			background-color:#666;*/
			margin:auto;
			}
			#imgs{
				position:relative;
				width:300vw;/*image width=753x5=3765px*/
				display: flex;
				opacity: 0.7;
			}
			#imgs:hover{
				/*寫入停止程式?*/
			}
			#imgs img{
				width:100vw;
				height:100vh;
			}
			#prev,#next{
				position:absolute;
				width:30px;
				height:40px;
				color: white;
				cursor:pointer;
				font-size: 3em;
				top: 150px;
				opacity: 0.5;
			}
			#prev{
				left:0px;
			}
			#next{
				right:0px;
			}
			#prev:hover,#next:hover{
				opacity: 0.9;
			}
			#dots{
				width: 130px; /*(16+5x2)x5=130px*/
				margin: auto;
				display: flex;
			}
			.dot{
				width: 16px;
				height: 16px;
				background-color: gray;
				border-radius: 50%;
				margin: 5px;
			}
			.dot:nth-child(1){
				background-color: white;
			}
			/*首頁輪撥*/
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
						$(".dot,#next,#prev").click(moveHandler);//run the same function
						myInterval = setTimeout(moveHandler, 8000);//initial timer
				});
				function moveHandler(e){
					clearInterval(myInterval);//reset timer
					myInterval = setTimeout(moveHandler, 8000);//set timeer
					//$(".dot:eq("+index+")").css("backgroundColor","gray");//reset dot color
					if(this==window){	index++;//setInterval
					//}else if($(this).attr("myIndex")){	index=Number($(this).attr("myIndex"));//.dot
					}else{	index+=Number($(this).attr("direction"));}// $#prev / #next
					if (index>2) index=0;//last image
					if (index<0) index=2;//first image
					//$(".dot:eq("+index+")").css("backgroundColor","white");//set dot color
					$("#imgs").stop().animate({"marginLeft":-index*100+"vw"},1000);
					//$("#imgs").stop().animate({"marginLeft":-index*753+"px"},1000);//image width=735px
					//$("#outer").stop().animate({"backgroundPositionX":-index*200+"px"},1000);//map width=1000px/5=200px
				}
			// 首頁輪播
		</script>
	</head>  
  	<body>

<!-- 		首頁輪播 -->
		<div id="outer">
	        <div id="imgs">
				<img src="/wcs/images/image1.jpg"></a>
<!-- 				留一張，其他用append上去，當頁fade in，比當頁高的頁面全部fade out -->
<!-- 				<img src="/wcs/images/image2.jpg"></a> -->
<!-- 				<img src="/wcs/images/image3.jpg"></a> -->
			</div>
	        <div id="prev" direction="-1">&ltdot;</div>
			<div id="next" direction="1">&gtdot;</div>
<!-- 			<div id="dots"> -->
<!-- 				<div class="dot" myIndex="0"></div> -->
<!-- 				<div class="dot" myIndex="1"></div> -->
<!-- 				<div class="dot" myIndex="2"></div> -->
<!-- 				<div class="dot" myIndex="3"></div> -->
<!-- 				<div class="dot" myIndex="4"></div> -->
<!-- 			</div> -->
   		</div>
<!-- 		首頁輪播 -->
		
	    <footer>
	    	<div class = 'indexFooter'>
		    	<div>
		    		<h4>address</h4>
		    		<p>809 W Randolph StChicago, IL</p>
		    	</div>
		    	<div>
		    		<h4>hours</h4>
					<p>Sunday - Thursday</p>
					<p>4:30 pm - 10:00 pm</p>
					
					<p>Friday-Saturday</p>
					<p>4:30 pm - 11:00 pm</p>
		    	</div>
		    	<div>
		    		<h4>contact</h4>
					<p>312.492.6262</p>
					<p>info@girlandthegoat.com</p>
		    	</div>
		    </div>
	    </footer> 
	    <jsp:include page='/subviews/header.jsp' /> 
		<%@include file='/subviews/nav.jsp' %> 
	    <%@include file='/subviews/footer.jsp' %> 
 
	</body>
</html>