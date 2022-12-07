<%@page import="com.wcs.service.MailService"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='<%=request.getContextPath()%>/css/vgb.css' rel="stylesheet">
<title>測試email發送</title>
</head>
<body>
	<jsp:include page='/subviews/header.jsp'>
		<jsp:param value="測試email發送" name="subtitle" />		
	</jsp:include>
	<%@include file='/subviews/nav.jsp' %>
	<div>https://drive.google.com/file/d/1W16rcBsLGc8lSNw6dGAY4CEb3nZRMc_o/view?usp=sharing</div>
	<%
	String email = request.getParameter("email");
	String name = "黃先生";
	String seats = "A1, A2";
	String date = "2022-12-06";
	String time = "12:00AM";
			if (email!=null){
				MailService.sendHelloMailWithLogo(name, email, seats, date, time);
				//MailService.sendHelloMailWithLogo(email);
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