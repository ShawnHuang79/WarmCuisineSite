<%@page import="java.util.Random"%>
<%@ page pageEncoding="UTF-8" buffer='1kb'%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>implicit variable</title>
	</head>
	<body>
		
		<h1><%= request.getMethod() %></h1>
		<p><%=request.getRequestURL() %></p>
		<p><%=request.getProtocol() %></p>
		<p><%=request.getLocalName() %></p>
		<p><%=request.getLocalAddr() %></p>
		<p><%=request.getLocalPort() %></p>
		<p><%=request.getContextPath() %></p>
		<p><%=request.getRequestURI() %></p>
		<p><%=request.getQueryString() %></p>
		<p><%=request.getParameter("test") %></p>
		<hr>
		<p><%=request.getRemoteHost() %></p>
		<p><%=request.getRemoteAddr() %></p>
		<p><%=request.getRemotePort() %></p>
		<p><%=request.getHeader("user-agent") %></p>
		<p><%=request.getHeader("accept-language") %></p>
		
		<hr>
		<%
			out.flush();
			Thread.sleep(500 + new Random().nextInt(300));
		%>
		<p><%=response.getContentType() %></p>
		<p><%=response.getBufferSize() %></p>
		<p><%=session.getId() %></p>
		
		<p><%=this.getServletName() %></p>
		

</html>