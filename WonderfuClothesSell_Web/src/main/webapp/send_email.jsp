<%@page import="com.wcs.service.MailService"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='<%= request.getContextPath() %>/css/vgb.css' rel="stylesheet">
<title>測試email發送</title>
</head>
<body>
	<jsp:include page='/subviews/header.jsp'>
		<jsp:param value="測試email發送" name="subtitle" />		
	</jsp:include>
	<%@include file='/subviews/nav.jsp' %>
<!-- 	<div>https://drive.google.com/file/d/1dw_uW7qm1hB2xMIN8lLAj2TI1rTS72NK/view?usp=sharing</div> -->
	<%
		String email = request.getParameter("email");
		if (email!=null){
			MailService.sendHelloMailWithLogo(email);
		}
	
	%>
	<article>
		<form method='POST'>
			<input type='email' required name='email' placeholder="請輸入有效的email">
			<input type="submit" value="send email"> 
		</form>
	</article>
	<%@include file='/subviews/footer.jsp' %>
</body>
</html>