<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
	#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  background-color: #04AA6D;
  color: white;
}
</style>
</head>
<body>
	<table border='1' cellpadding='5'>		
		<tr>			
			<td>1 * 1 = 1</td>			
			<td>1 * 2 = 2</td>			
			<td>1 * 3 = 3</td>
		</tr>		
		<tr>			
			<td>2 * 1 = 2</td>			
			<td>2 * 2 = 4</td>			
			<td>2 * 3 = 6</td>			
		</tr>
		<tr>			
			<td>3 * 1 = 3</td>			
			<td>3 * 2 = 6</td>			
			<td>3 * 3 = 9</td>			
		</tr>		
	</table>
<hr>
	<table id='customers'>
		<tr><th colspan="9">九九乘法表</th></tr>
		<% for(int i=1;i<10;i++){%>
		<tr>
			<% for(int j=1;j<10;j++) {%>
			<td><%= i %> * <%= j %> = <%= i*j %></td>
			<%  } %>
		</tr>
		<% } %>
	</table>
	<img src='https://www.w3schools.com/html/pic_trulli.jpg'>
</body>
</html>