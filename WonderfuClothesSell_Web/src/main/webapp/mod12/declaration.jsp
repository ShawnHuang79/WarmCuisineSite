<%@ page pageEncoding="UTF-8"%>
<%! 
	public int i = 200; //成員變數, 屬性	
	
	public void jspInit(){
		String i = this.getInitParameter("i");
		if (i!=null && i.matches("\\d+")){
			this.i = Integer.parseInt(i);
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP宣告</title>
</head>
<body>
	<% int i = 100; //區域變數 %>
	<p>區域變數i: <%=i %></p>
	<p>屬性i: <%=this.i %></p>
	<p>initial parameter i : <%=config.getInitParameter("i")%></p>
</body>
</html>