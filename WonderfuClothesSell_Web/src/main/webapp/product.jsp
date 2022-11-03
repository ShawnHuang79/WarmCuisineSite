<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>產品明細</title>
		<style>
			@import url(/wcs/css/wcs.css);
	    </style>
	</head>
	<body>
		<jsp:include page='/subviews/header.jsp' > 
			<jsp:param value="Book Shop" name="subtitle"/>
		</jsp:include>
		<article>
			<div class='productDetails'>
				<img src='https://images.deliveryhero.io/image/fd-tw/LH/b2ql-hero.jpg?width=400&height=400&quality=45'>
				<h3>招牌甘泉魚麵</h3>
				<div>定價:100</div>
				<div>折扣:21%</div>
				<div>售價:79</div>
				<div>庫存: 1</div>
				<form>
					<label>數量:</label>
					<input type='number' min='1' max='12' required>
					<input type='submit' value="加入購物車">
				</form>
				
			</div>
		</article>
	</body>
</html>