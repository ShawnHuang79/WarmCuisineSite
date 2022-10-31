<%@page import="java.util.Date"%>
<%@page import="java.util.Random"%>
<%@page pageEncoding="UTF-8" buffer="1kb" autoFlush="true"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>隱含變數</title>
<style>
	p>label{color:blue}
</style>
</head>
<body>
	<h1>隱含變數 <sub>Implicit Variables</sub></h1>
	<hr>
	<h2>request</h2>
	<p><label>Method type:</label> <%= request.getMethod() %></p>
	<form action='implicit_variables.jsp' method='POST'>
		<input name='test' placehold='輸入任意資料'>
		<input type='submit' value="送POST請求給自己這個網頁">
	</form>
	<p><label>請求中的url:</label> <%= request.getRequestURL() %></p>
	<p><label>通訊協定(protocol):</label> <%= request.getProtocol() %></p>
	<p><label>server電腦名稱(host):</label> <%= request.getLocalName() %></p>
	<p><label>server ip address:</label> <%= request.getLocalAddr() %></p>
	<p><label>server port:</label> <%= request.getLocalPort() %></p>
	<p><label>context root:</label> <%= request.getContextPath() %></p>
	<p><label>uri:</label> <%= request.getRequestURI() %></p>	
	<p><label>query string:</label> <%= request.getQueryString() %></p>
	<p><label>form data:</label> <%= request.getParameter("test") %></p>
	<hr>
	<% 
		out.flush();
		Thread.sleep(500 + new Random().nextInt(300));
	%>	
	<p><label>client電腦名稱 :</label> <%= request.getRemoteHost() %></p>
	<p><label>client ip address :</label> <%= request.getRemoteAddr() %></p>
	<p><label>client port :</label> <%= request.getRemotePort() %></p>
	<p><label>User-Agent :</label> <%= request.getHeader("User-Agent") %></p>
	<p><label>Accept Language :</label> <%= request.getHeader("accept-language") %></p>
	<hr>
	<h2>response, out</h2>
	<p><label>response.getContentType():</label> <%=response.getContentType() %> </p>
	<p><label>response.getBufferSize():(default: 8KB)</label> <%=response.getBufferSize() %> </p>
	<p><label>out.getBufferSize():</label> <%=out.getBufferSize() %> </p>
	<hr>
	<h2>session</h2>
	<p><label>session id:</label><%= session.getId() %></p>
	<p><label>session逾時時間:</label><%= session.getMaxInactiveInterval() %></p>
	<p><label>session CreationTime:</label><%= new Date(session.getCreationTime()) %></p>
	<p><label>session AccessedTime:</label><%= new Date(session.getMaxInactiveInterval()) %></p>
	<hr>
	<h2>application(ServletContext)</h2>
	<p>暫無示範(拜訪人次)</p>
	<hr>
	<h2>config(this), pageContext, page</h2>
	<p><label>Servlet Name: </label><%= this.getServletName() %>
	<p><label>Servlet Name: </label><%= config.getServletName() %>
	<p><label>Servlet Name: </label><%= this.getInitParameter("a") %>
	<p><label>Servlet Name: </label><%= config.getInitParameter("a") %>
	<p><label>pageContext取得request的contextPath: </label><%= ((HttpServletRequest)pageContext.getRequest()).getContextPath() %></p>
	<p><label>page.getServletName()(==this.getServletName())</label><%= ((HttpServlet)page).getServletName() %>
	<p><label>page==this: </label><%= page==this %></p>
	<hr>
	<h2>exception(無法使用)</h2>
 	<p>暫無示範</p>
</body>
</html>