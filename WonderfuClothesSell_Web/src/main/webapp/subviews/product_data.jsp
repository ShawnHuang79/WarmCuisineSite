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
		$("#sizesDivCtrl").click(toggleSizesHandler);
		$(".quantityIncrease").click(quantityIncreaseHandler);
		$(".quantityDecrease").click(quantityDecreaseHandler);
		<%--<%if(request.getMethod().equals("POST")){%>
			//repopulateForm();
		<%}%> 用在點擊選項時更換圖片--%>
	}
	function quantityIncreaseHandler(){
		node = this.parentNode.getElementsByClassName('quantity')[0].childNodes[0];
		num = node.value;
		num++;
		node.value = num;
	}
	function quantityDecreaseHandler(){
		node = this.parentNode.getElementsByClassName('quantity')[0].childNodes[0];
		//console.log(this.parentNode);
		//console.log(node);
		num = node.value;
		if (num > 1) {
			num--;
		}
		node.value = num;
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
	function toggleSizesHandler() {
		var toggle = document.getElementById("sizesDiv");
		if (toggle.style.display === "none") {
			toggle.style.display = "block";
		}else{
			toggle.style.display = "none";
		}
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
	<div>
		<div id='theProductPhoto' style="background-image: url(<%=p.getPhotoUrl()%>)">

<%-- 			<img  src='<%=p.getPhotoUrl()+ "?width=400&height=400&quality=45"%>'> --%>
		</div>
		<div id='theProductDetails'>
			<div>

				<!-- 			右上角購物車小圖示 -->
				<a href='/wcs/member/cart.jsp' style='float:right'>
					<span style='float:right' class='cartQuantitySpan' > 
						${empty sessionScope.cart?"":String.format("(%d)",sessionScope.cart.totalQuantity)}
					</span>
					<img src='/wcs/images/shopping_cart.png'>
				</a>
				<h3><%= p.getName()%></h3>

	
			</div> 
			<div id='productDivUpper'>
				<%if(p instanceof Outlet){ %>
				<div id='delListPrice'>定價 <del id='listPriceSpan'><%= ((Outlet)p).getListPrice()%></del>  折扣<%= ((Outlet)p).getDiscount()%>%</div>
				<div>NT$<span id='unitPriceSpan'><%= ((Outlet)p).getUnitPrice()%></span></div>
				<%}else{ %>
				<div>NT$<span id='unitPriceSpan'><%= p.getUnitPrice()%></span>元</div>
				<%} %>
			</div>
			<form method='GET' action='/wcs/add_cart.do' id='cartForm' onsubmit="addToCart(event)"><%--希望能資料檢查，但不送出請求，event是預設全域變數? --%>
				<div id='productDivBottom'>
					<input type='hidden' name='productId' value='<%=productId%>'>
					
					<div id='sizesDivCtrl'><span style='float:right'>></span>容量:</div>
		 			<div id='sizesDiv'>
			 			<%for (Size size:p.getSizesList()){ 
						%> 
						<div>
							<label>
								<input class='productSizeRadio' type='radio' name='sizeName' value='<%=size.getSizeName() %>' data-photo='' required
								 data-listPrice='<%=size.getListPrice() %>' data-unitPrice='<%=size.getUnitPrice() %>'>
								<%=size.getSizeName() %>
							</label>
						</div>	
						<%}%>
					</div>
					<div id='textareaDiv'>
						餐點備註
						<textarea></textarea>
					</div>
					<div id='theProductFooter'>
						<div class="quantityDiv">
							<div class="quantityDecrease">-</div>
							<div class='quantity'><input type='number' class='quantity' value='1' min='1' max='15' name='quantity' required></div>
							<div class="quantityIncrease">+</div>
						</div>
						<div><input id='addToCartBtn' class='addToCartBtn' type='submit' value="加入購物車" onclick='ajax=true'></div>
						<div><input class='addToCartBtn' type='submit' value="直接結帳" onclick='ajax=false'></div>
					</div>
					
				</div>
			</form>
		</div>
	</div>
<% }%>
