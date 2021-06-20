<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border=1>
<h1>제품 카테고리</h1><br>
<tr><th>품명<th>조회</tr>

<%@ include file="ConnectDB.jsp" %>


<%
PreparedStatement stmt = con.prepareStatement
("select * from product_categories");

ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	String category_id = rs.getString("category_id");
	String category_name = rs.getString("category_name");	
	%><tr><td><%=category_name%>
	<td><a href = "ShowProduct_categories.jsp?category_id=<%=category_id%>">품목별 조회 </a>
	<%
}
rs.close();
stmt.close();
con.close();

%>
</table>
</body>
</html>