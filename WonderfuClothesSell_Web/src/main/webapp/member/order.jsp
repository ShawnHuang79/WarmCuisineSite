<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		<style>
			@import url(/wcs/css/wcs.css);
	    </style>
	</head>
	<body>
		<jsp:include page='/subviews/header.jsp' > 
			<jsp:param value="修改成本頁需要的內容" name="subtitle"/>
		</jsp:include>
		<%@include file='/subviews/nav.jsp' %> 
		<article>
		</article>
		<%@include file='/subviews/footer.jsp' %>
	</body>
</html>