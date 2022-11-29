<%@page import="com.wcs.entity.Product"%>
<%@page import="com.wcs.service.ProductService" %>
<%@ page pageEncoding="UTF-8"%>
<%--TODO考慮放header --%>
<%--這裡的css是用來控制product_data的，用在產品id查詢的ajax中 --%>
<style>
	#theProductPhoto{

		height: 300px;
		background-position: 50%;
		background-size: cover;
		border-radius: 10px 10px 0px 0px;
		
	}
	#theProductDetails{
		padding: 0px 30px 30px 30px;
	}
	#productDivUpper{
		margin: 0px 0px 15px 0px;
	}
	#sizesDivCtrl, #sizesDiv div{
		padding: 10px 0px;
	}
	

	#delListPrice{
		font-size: 14px;
		color: grey;
	}
	#productDivBottom{
		display:flex;
		flex-direction: column; 
		justify-content: space-between;
	}
	#productDivBottom div{
		/*height:40px;*/
	}
	#textareaDiv{
		padding:30px 0px;
	}
	textarea{
		resize: none;
		width: 100%;
		height:80px;
		border-color: rgba(0,0,0,0.2);
	}
	#theProductFooter{
		display:flex;
		flex-direction: row; 
		justify-content: space-between;
		border-top: 1px solid;
		padding:10px;
		border-color: rgba(0,0,0,0.1);
		user-select: none;
	}
	
	.quantityDiv {
		/*height: 85px;*/
		width: 30%;
		display:flex;
		flex-direction: row; 
		justify-content: center;
		/*border: 1px solid black;*/
		/*float: left;
		margin-right: 25px;*/
	}
	.quantityIncrease {
		width: 30%;
		height: 40px;
		line-height: 44px;
		text-align: center;
		font-size: 26px;
		/*color: #747474;*/
		font-weight: bold;
	}
	.quantityIncrease:hover {
		color: #747474;
		background: #E0E0E0;
		cursor: pointer;
	}
	.quantity {
		width: 40%;
		height: 40px;
		line-height: 40px;
		text-align: center;
		font-size: 22px;
		border:none;
		font-weight: bold;
		background-color:#fdf9f0;
	}
	.quantityDecrease {
		width: 30%;
		height: 40px;
		line-height: 40px;
		text-align: center;
		font-size: 30px;
		font-weight: bold;
	}
	.quantityDecrease:hover {
		color: #747474;
		background: #E0E0E0;
		cursor: pointer;
	}
	/* Chrome, Safari, Edge, Opera */
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
	}
	
	/* Firefox */
	input[type=number] {
	  -moz-appearance: textfield;
	}
	.addToCartBtn{
		border:none;
		border-radius:5px;
		margin: 0px 0px 0px 10px;
		color: white;
   		background-color: #984B4B;
   		font-size:18px;
		width: 150px;
   		height: 50px;
   		cursor:pointer;
	}

	
	
</style>

<!-- <a href='/wcs/member/cart.jsp'>購物車</a> -->
<!-- <span style='float:right' class='cartQuantitySpan' >  -->
<%-- 	${empty sessionScope.cart?"":String.format("(%d)",sessionScope.cart.totalQuantity)} --%>
<!-- </span>  -->
<%@include file='/subviews/product_data.jsp' %>
