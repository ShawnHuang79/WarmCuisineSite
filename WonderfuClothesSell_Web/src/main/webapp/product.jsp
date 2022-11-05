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
		<%@include file='/subviews/nav.jsp' %> 
		
		<article>
			<%@include file='/subviews/product_data.jsp' %> 
		</article>
		<%@include file='/subviews/footer.jsp' %>   
	</body>
</html>