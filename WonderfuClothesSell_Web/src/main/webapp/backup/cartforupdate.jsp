<%@page import="com.wcs.entity.CartItem"%>
<%@page import="com.wcs.entity.ShoppingCart"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		<style>
			@import url(/wcs/css/wcs.css);
			* {
				margin: 0;
				padding: 0;
				list-style: none;
				color: #666;
				text-decoration: none;
				font-size: 14px;
			}
			
			body {
				background: #f5f5f5;
				height: 100%;
			}	
			.hide {
				overflow: hidden;
			}
			
			.left {
				float: left;
			}
			
			.moreProductBoxHead {
				position: relative;
				margin: 0;
				height: 50px;
				font-size: 30px;
				font-weight: 400;
				color: #757575;
				border-top: 1px solid #e0e0e0;
			}
			
			.moreProductBoxHead span {
				position: absolute;
				top: -20px;
				left: 372px;
				height: 40px;
				width: 482px;
				line-height: 40px;
				text-align: center;
				display: block;
				background-color: #f5f5f5;
				font-size: 30px;
			}
			
			#moreProductBox {
				width: 1240px;
				margin: 20px auto;
			}
			
			#moreProductBox ul {
				margin-right: -14px;
				overflow: hidden;
			}
			
			#moreProductBox li {
				width: 234px;
				float: left;
				margin-right: 14px;
				padding: 24px 0 20px;
				background: #FFF;
				text-align: center;
				position: relative;
				cursor: pointer;
				margin-bottom: 14px;
			}
			
			.productImg {
				width: 150px;
				height: 150px;
				margin: 0 auto 18px;
			}
			
			.productName {
				display: block;
				text-overflow: ellipsis;
				white-space: nowrap;
				overflow: hidden;
				font-weight: 400;
			}
			
			.productName a {
				color: #333;
			}
			
			.productPrice {
				color: #ff6700;
				margin: 10px;
			}
			
			
			#moreProductBox li:hover .addBtn {
				display: block;
			}
			
			#moreProductBox li:hover .addBtnrank {
				opacity: 0;
			}
			
			#moreProductBox li .addBtn:hover {
				background-color: #f60;
				color: white;
			}
			
			.addBtn {
				height: 22px;
				position: absolute;
				width: 122px;
				bottom: 5px;
				left: 50%;
				margin-left: -61px;
				line-height: 22px;
				display: none;
				color: #F60;
				font-size: 12px;
				border: 1px solid #f60;
			}
			
			.cart {
				width: 1240px;
				margin: 20px auto;
				background: #FFF;
			}
			
			.cart .check {
				width: 50px;
			}
			
			.cart .check i {
				color: #fff;
				display: inline-block;
				width: 18px;
				height: 18px;
				line-height: 18px;
				border: 1px solid #e0e0e0;
				margin-left: 24px;
				background-color: #fff;
				font-size: 16px;
				text-align: center;
				vertical-align: middle;
				position: relative;
				top: -1px;
				cursor: pointer;
				font-family: "iconfont";
			}
			
			.tick {
				border-color: #ff6700 !important;
				background-color: #ff6700 !important;
			}
			
			.cart .img {
				width: 190px;
			}
			
			.cart .img img {
				display: block;
				width: 80px;
				height: 80px;
				margin: 3px auto;
			}
			
			.cart .name {
				width: 300px;
			}
			
			.cart .name span {
				line-height: 1;
				margin-top: 8px;
				margin-bottom: 8px;
				font-size: 18px;
				font-weight: normal;
				text-overflow: ellipsis;
				white-space: nowrap;
				overflow: hidden;
			}
			
			.cart .price {
				width: 144px;
				text-align: right;
				padding-right: 84px;
			}
			
			.cart .price span {
				color: #ff6700;
				font-size: 16px;
			}
			
			.cart .number {
				width: 150px;
			}
			
			.cart .subtotal {
				width: 130px;
			}
			
			.cart .ctrl {
				width: 105px;
				padding-right: 25px;
				text-align: center;
			}
			
			.cart .ctrl a {
				font-size: 20px;
				cursor: pointer;
				display: block;
				width: 26px;
				height: 26px;
				margin: 30px auto;
				line-height: 26px;
			}
			
			.cart .ctrl a:hover {
				color: #FFF;
				background: #ff6700;
				border-radius: 50%;
			}
			
			.cartHead {
				height: 70px;
				line-height: 70px;
			}
			
			.cartHead, .row {
				border-bottom: solid 1px #e0e0e0;
			}
			
			.row {
				height: 86px;
				line-height: 86px;
				padding: 15px 0;
				margin: 0px;
			}
			
			#sumArea {
				width: 1240px;
				height: 60px;
				background: white;
				margin: 20px auto;
			}
			
			#sumArea #checkOutBtn {
				width: 250px;
				height: 60px;
				text-align: center;
				float: right;
				line-height: 60px;
				font-size: 19px;
				background: #FF4B00;
				color: white;
			}
			
			#checkOutBtn {
				cursor: pointer;
			}
			
			
			#sumArea #checkOutAmountDiv {
				width: 250px;
				height: 60px;
				text-align: center;
				float: right;
				line-height: 60px;
				font-size: 16px;
				color: #FF4B00;
			}
			
			#sumArea #checkOutAmountDiv #checkOutAmount {
				width: 100px;
				height: 60px;
				font-size: 25px;
				color: #FF4B00;
				/*	float: left;*/
			}
			
			.quantityDiv {
				height: 85px;
				width: 10%;
				/*border: 1px solid black;*/
				float: left;
				margin-right: 25px;
			}
			
			.quantityInnerDiv {
				width: 150px;
				height: 40px;
				border: 1.2px solid #E0E0E0;
				float: right;
				margin-top: 21px;
			}
			
			.quantityIncrease {
				width: 30%;
				height: 40px;
				line-height: 40px;
				float: left;
				text-align: center;
				font-size: 21px;
				color: #747474;
			}
			
			.quantityIncrease:hover {
				width: 30%;
				height: 40px;
				line-height: 40px;
				float: left;
				text-align: center;
				font-size: 21px;
				color: #747474;
				background: #E0E0E0;
				cursor: pointer;
			}
			
			.quantity {
				width: 40%;
				height: 40px;
				line-height: 40px;
				float: left;
				text-align: center;
				font-size: 16px;
				color: #747474;
			}
			
			.quantityDecrease {
				width: 30%;
				height: 40px;
				line-height: 40px;
				float: left;
				text-align: center;
				font-size: 25px;
				color: #747474;
			}
			
			.quantityDecrease:hover {
				width: 30%;
				height: 40px;
				line-height: 40px;
				float: left;
				text-align: center;
				font-size: 25px;
				color: #747474;
				background: #E0E0E0;
				cursor: pointer;
			}
			
			.tick2 {
				border-color: #ff6700 !important;
				background-color: #ff6700 !important;
			}
	    </style>

	    <script>
			window.onload = function() {
				//??????????????????
				var productData = [{
						"imgUrl": "https://images.deliveryhero.io/image/fd-tw/Products/40237680.jpg",
						"proName": " ????????????4 NFC??? ",
						"proPrice": "229",
						"proComm": "1"
					},
					{
						"imgUrl": "https://images.deliveryhero.io/image/fd-tw/LH/p6lj-hero.jpg",
						"proName": " Redmi AirDots????????????????????? ",
						"proPrice": "99.9",
						"proComm": "9.7"
					},
					{
						"imgUrl": "https://images.deliveryhero.io/image/fd-tw/Products/40237680.jpg",
						"proName": " ????????????????????? ",
						"proPrice": "65",
						"proComm": "1.3"
					},
					{
						"imgUrl": "https://images.deliveryhero.io/image/fd-tw/LH/p6lj-hero.jpg",
						"proName": " ?????????????????? ",
						"proPrice": "149",
						"proComm": "1.1"
					},
					{
						"imgUrl": "https://images.deliveryhero.io/image/fd-tw/Products/40237680.jpg",
						"proName": "?????????????????????Pro  ",
						"proPrice": "750",
						"proComm": "0.3"
					},
					{
						"imgUrl": "https://images.deliveryhero.io/image/fd-tw/LH/p6lj-hero.jpg",
						"proName": " ????????????3 NFC??? Pro  ",
						"proPrice": "199",
						"proComm": "3.3"
					},
					{
						"imgUrl": "img/03-car-07.png",
						"proName": " ????????????3 / 4 ????????????",
						"proPrice": "19.9",
						"proComm": "1.2"
					},
					{
						"imgUrl": "img/03-car-08.png",
						"proName": "  ?????????????????? ",
						"proPrice": "45",
						"proComm": "0.6"
					},
					{
						"imgUrl": "img/03-car-09.png",
						"proName": "  ????????????????????????Pro 3???  ",
						"proPrice": "207",
						"proComm": "0.3"
					},
					{
						"imgUrl": "img/03-car-10.png",
						"proName": " ????????????3 ",
						"proPrice": "199",
						"proComm": "7.2"
					}
				];
				var productBox = document.getElementById("moreProductBox");
				var cart = document.getElementById("cart");
				var productUl = document.getElementsByTagName("ul")[0];
				//??????li????????????????????????	
				for (var i = 0; i < productData.length; i++) {
					var productLi = document.createElement("li");
					var data = productData[i];

					productLi.innerHTML += '<div class="productImg"><img src="' + data["imgUrl"] + '" width="150" height="150"></div>';
					productLi.innerHTML += '<h3 id="h3" class="productName"><a rel="nofollow" href="#">' + data["proName"] + '</a></h3>';
					productLi.innerHTML += '<p class="productPrice">' + data["proPrice"] + '???</p>';
					productLi.innerHTML += '<div class="addBtn">???????????????</div>';
					productUl.appendChild(productLi);

				}
				var aBtn = getClass(productBox, "addBtn");//??????box?????????????????????????????????
				var number = 0;//?????????????????????
				//??????div????????????????????????????????????????????????????????????????????????????????????
				for (var i = 0; i < aBtn.length; i++) {
					number++;
					aBtn[i].index = i;
					aBtn[i].onclick = function() {
						var createDiv = document.createElement("div");
						var data = productData[this.index];
						createDiv.className = "row hide";
						createDiv.innerHTML += '<div class="check left"> <i class="i_check" id="i_check" onclick="i_check()" >???</i></div>';
						createDiv.innerHTML += '<div class="img left"><img src="' + data["imgUrl"] + '" width="80" height="80"></div>';
						createDiv.innerHTML += '<div class="name left"><span>' + data["proName"] + '</span></div>';
						createDiv.innerHTML += '<div class="price left"><span>' + data["proPrice"] + '???</span></div>';
						createDiv.innerHTML +=' <div class="quantityDiv"><div class="quantityInnerDiv"><div class="quantityDecrease">-</div><div class="quantity">1</div><div class="quantityIncrease">+</div></div> </div>'
						createDiv.innerHTML += '<div class="subtotal left"><span>' + data["proPrice"] + '???</span></div>'
						createDiv.innerHTML += '<div class="ctrl left"><a rel="nofollow" href="javascript:;">??</a></div>';
						cart.appendChild(createDiv);
						var check = createDiv.firstChild.getElementsByTagName("i")[0];
						check.onclick = function() {
							// console.log(check.className);
							if (check.className == "i_check tick") {
								check.classList.remove("tick");

							} else {
								check.classList.add("tick");
							}
							getAmount();
						}
						var delBtn = createDiv.lastChild.getElementsByTagName("a")[0];
						delBtn.onclick = function() {
							var result = confirm("????????????????");
							if (result) {
								cart.removeChild(createDiv);
								number--;
								getAmount();
							}
						}
						var increaseBtn = document.getElementsByClassName("quantityIncrease");
						for (var i = 0; i < increaseBtn.length; i++) {
							increaseBtn[i].onclick = function() {
								bt = this;
								//??????????????????
								//???????????????
								node = this.parentNode.childNodes[1];
								console.log(node);
								num = node.innerText;
								num = parseInt(num);
								num++;
								node.innerText = num;
							}
						}
						//?????????????????????????????????
						var decreaseBtn = document.getElementsByClassName("quantityDecrease");
						for (i = 0; i < decreaseBtn.length; i++) {
							decreaseBtn[i].onclick = function() {
								bt = this;
								//??????quantity??????
								node = this.parentNode.childNodes[1];
								num = node.innerText;
								num = parseInt(num);
								if (num > 1) {
									num--;
								}
								node.innerText = num;
							}
						}

						delBtn.onclick = function() {
							var result = confirm("????????????????");
							if (result) {
								cart.removeChild(createDiv);
								number--;
								getAmount();
							}
						}

					}
				}

			}

			function getClass(oBox, tagname) {
				var aTag = oBox.getElementsByTagName("*");
				var aBox = [];
				for (var i = 0; i < aTag.length; i++) {
					if (aTag[i].className == tagname) {
						aBox.push(aTag[i]);
					}
				}
				return aBox;
			}


			var index = false;
			function checkAll() {
				var choose = document.getElementById("cart").getElementsByTagName("i");
				if (choose.length != 1) {
					for (i = 1; i < choose.length; i++) {
						if (!index) {
							choose[0].classList.add("tick2")
							choose[i].classList.add("tick");
						} else {
							choose[i].classList.remove("tick");
							choose[0].classList.remove("tick2")
						}
					}
					index = !index;
				}
				getAmount();
			}



			//??????????????????
			function getAmount() {
				// console.log(ys);
				ns = document.getElementsByClassName("tick");
				sum = 0;
				//?????????
				document.getElementById("checkOutAmount").innerText = sum;
				for (y = 0; y < ns.length; y++) {
					//??????
					amount_info = ns[y].parentElement.parentElement.lastElementChild.previousElementSibling;
					num = parseInt(amount_info.innerText);
					sum += num;
					document.getElementById("checkOutAmount").innerText = sum;
				}
			}
		</script>
	</head>
	<body>
		<jsp:include page='/subviews/header.jsp' > 
			<jsp:param value="?????????" name="subtitle"/>
		</jsp:include>
		<%@include file='/subviews/nav.jsp' %> 

		<%
			ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		%>
		<article>
			<%if(cart==null || cart.isEmpty()){ %>
				<div>???????????????????????????</div>
			<%}else{

			%>
				<div>???<%= cart.size() %>??? <%=cart.getTotalQuantity() %>???, 
			?????????: <%=cart.getTotalAmount() %>???
			<%}  %>
			<form action='update_cart.do'>
			<div id="cart" class="cart">
		
				<div class="cartHead hide">
					<div class="check left">
						<i onclick="checkAll()">???</i>
					</div>
					<div class="img left">??????</div>
					<div class="name left">????????????</div>
					<div class="price left">??????</div>
					<div class="number left">??????</div>
					<div class="size left">??????</div>
					<div class="subtotal left">??????</div>
					<div class="ctrl left">??????</div>
				</div>
		
		
			</div>
			<div id="sumArea">
				<div><button type='submit' id="checkOutBtn" name='submitPath' value='check_out.jsp'>?????????</button></div>
				<div id="checkOutAmountDiv">
					?????????<span id="checkOutAmount">0</span>???
				</div>
			</div>
			</form>
		
		
			<div id="moreProductBox">
				<h2 class="moreProductBoxHead">
					<span>????????????????????????????????????</span>
				</h2>
				<ul>
				</ul>
			</div>
		</article>
<!-- 		?????????????????? -->
		<article>
	<%-- 		<%=cart %> --%>
			<%if(cart==null || cart.isEmpty()) {%>
				<div>??????????????????????????????????????????</div>
			<%}else{ 

			%>
				<form action='update_cart.do' id='cartForm' method='POST'>
				<table id='cartTable'>
					<caption>????????????</caption>
					<tfoot>
						<tr>
							<td colspan='4'>
							???<%= cart.size() %>??? <%=cart.getTotalQuantity() %>???, 
							?????????: <%=cart.getTotalAmount() %>???						
							</td>						
						</tr>
						<tr>
							<td colspan='4' class='buttonsTd'>
							<span><input type='button' value='????????????' onclick='location.href="../products_list.jsp";'></span>
							<span><input type='submit' value='???????????????'></span>
							<span><button type='submit' name='submitPath' value='check_out.jsp'>????????????</button></span>
							</td>
						</tr>
					</tfoot>
					<thead>
						<tr>
							<th>??? ???</th>
							<th>??? ???</th>
							<th>??? ???</th>
							<th>??????</th>
						</tr>
					</thead>
					<tbody>
						<% for(CartItem cartItem:cart.getCartItemsSet()) {%>
						<tr>
							<td>
								<img src='<%= cartItem.getPhotoUrl() %>'>
								<div><%= cartItem.getProductName() %></div>
								<div>
									<span class='colorSizeSpan'>
										<%= cartItem.getSizeName() %>
									</span> 
									<span style='font-size:small'>
										??????:<span class='stockSpan'></span>
									</span>
								</div>
							</td>
							<td>
							<div>??????: <%=cart.getUnitPrice(cartItem) %>???</div>
							<div style='font-size: smaller'>
								<span style='text-decoration:line-through;color:gray'>??????: <%=cartItem.getListPrice() %>???</span>, 
								<span style='color:blue'><%=cart.getDiscountString(cartItem) %></span>
							</div>							
						</td>
						<td>
							<div>??????:
								<input type='number' value='<%=cart.getQuantity(cartItem) %>' 
									name='quantity<%=cartItem.hashCode() %>' min='0' max='10' required> 
							</div>
							<div style='font-size: smaller'>??????: <%=cart.getAmount(cartItem) %>???</div>
						</td>
						<td style='text-align: center'>
							<input type='checkbox' name='delete<%=cartItem.hashCode() %>'>
						</td>
					</tr>	
					<% } %>	
					</tbody>	
				</table>
				</form>
			<%} %>
		</article>
		
		<%@include file='/subviews/footer.jsp' %>   
	</body>
</html>