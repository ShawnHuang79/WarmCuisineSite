<%@page import="com.wcs.service.ProductService"%>
<%@page import="java.util.List"%>
<%@page import="com.wcs.entity.Size"%>
<%@ page pageEncoding="UTF-8" contentType="application/json"%>
<%
	String productId = "13";
	List<Size> sizeList = null;
 	ProductService service = new ProductService();
	/*if(productId!=null){
		sizeList = service.getSizeList(productId, colorName);
	}*/
%>

{
	"productId":<%=productId %>,
<%-- 	"sizeName":"<%=sizeName %>" --%>
	"sizeArray": 
	<%if(sizeList==null || sizeList.isEmpty()){%>
		null
	<%}else{%>
		[
<%-- 		<% for(int i=0;i<sizeList.size();i++){ --%>
// 			Size size = sizeList.get(i);
<%-- 		%> --%>
		{
<%-- 			"sizeName": "<%=size.getSizeName()%>", --%>
<%-- 			"listPrice": <%=size.getListPrice() %>, --%>
<%-- 			"unitPrice": <%=size.getUnitPrice() %>, --%>
<%-- 		<%-- --%> --%>
<%-- 		}<%= i<sizeList.size()-1?",":""--%> --%>
<%-- 		<%}%> --%>
	
	]
	
<%}%>
}