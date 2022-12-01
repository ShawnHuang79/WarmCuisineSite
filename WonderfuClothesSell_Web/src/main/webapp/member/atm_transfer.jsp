<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Warm Cuisine Site</title>
		<style>
			@import url(/wcs/css/wcs.css);
	    </style>
	</head>
	<body>
		<jsp:include page='/subviews/header.jsp' > 
			<jsp:param value="通知已轉帳" name="subtitle"/>
		</jsp:include>
		<%@include file='/subviews/nav.jsp' %> 
		<article>
			<form>
				<label>轉帳銀行:</label>
				<input> 
			</form>
		</article>
		<%@include file='/subviews/footer.jsp' %>
	</body>
</html>