<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%!
	//Java Comment
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP註解</title>
	<style>
		/* CSS 註解 */
	</style>
	<script>
		<% 
			int i=100;
			String s = "Hello";
		%>
		//js in-line 註解
<%-- 		var j = <%=i/0%>; //會出現後端的ArithmeticException   --%>
  		//var s = <%=s%>; //var s = Hello; , 會發生前端js的錯誤 
 		var s = '<%=s%>';
		
		/*js block 註解 */
		alert(s);
	</script>
</head>
<body>
	
	<p>以下為HTML 註解</p>
	<!-- HTML 註解 -->
	
	<p>以下為JSP 註解</p>
	<%-- JSP 註解 --%>
	
</body>
</html>