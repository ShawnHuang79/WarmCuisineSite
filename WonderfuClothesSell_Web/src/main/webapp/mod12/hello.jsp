<%@page import="java.time.LocalDateTime"%>
<jsp:directive.page pageEncoding="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>hello</title>
</head>
<body>
	<h2>
		Hello, Client現在是:<script>document.write(new Date());</script>
	</h2>
	<hr>
	<h2>
		Hello, Server現在是:<% out.println(LocalDateTime.now()); %>
	</h2>
	<%
		System.out.println(request);
		int i = 5;	
		if(i>10){
	%>	
	<p>i=<% out.print(i); //將i的值輸出到網頁上 %> 大於 10.</p>
	<%}else{ %>	
	<p>i=<%= i /*將i的值輸出到網頁上*/ %> 小於等於 10.</p>
	<%} %>
	<hr>
	
	<%
		int stock = 5;	
		if(stock>10){
	%>	
	<p>庫存=<% out.print(stock); //將i的值輸出到網頁上 %> 充足</p>
	<%}else{ %>	
	<p>庫存=<%= stock /*將i的值輸出到網頁上*/ %> 稀少，請趕快結帳.</p>
	<%} %>
	
	
	<p>庫存=<%= stock%>, <%= stock>10?"充足":"稀少，請趕快結帳" %></p>
	
</body>
</html>