<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>404錯誤</title>
		<style>
			@import url(/wcs/css/wcs.css);
	    </style>
	</head>
	<body>
		<jsp:include page='/subviews/header.jsp' > 
			<jsp:param value="Can't find page!錯誤" name="subtitle"/>
		</jsp:include>
		<article>
			<h1>404</h1>
			<h3>找不到的網址為:<%=request.getAttribute("javax.servlet.error.request_uri") %></h3>
		</article>
	</body>
</html>