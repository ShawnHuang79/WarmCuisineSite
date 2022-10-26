<%@page import="java.time.LocalDateTime"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<h2>
		<script>document.write(new Date());</script>
	</h2>
	<hr>
	<h2>
		<% out.println(LocalDateTime.now()); %>
	</h2>
	<%
		int stock = 15;
		if(stock>10){
	%>
	<p>庫存=<%=stock%> 充足</p>
	<%}else{%>
	<p>庫存=<%=stock%> 稀少</p>
	<%} %>
	
	
	
</body>
</html>