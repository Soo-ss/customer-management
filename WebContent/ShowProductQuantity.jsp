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
<h1>제품 재고 현황입니다.</h1><br>
<tr><th>제품명<th>기준가<th>원가<th>재고</tr>

<%@ include file="ConnectDB.jsp" %>


<%
PreparedStatement stmt = con.prepareStatement
("select * from inventories natural join products where warehouse_id=?");
String warehouse_id = request.getParameter("warehouse_id");
stmt.setString(1, warehouse_id);
ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	String product_name = rs.getString("product_name");
	String standard_cost = rs.getString("standard_cost");
	String list_price = rs.getString("list_price");
	String quantity = rs.getString("quantity");
	%><tr><td><%=product_name%><td><%=standard_cost %><td><%=list_price %><td><%=quantity %>
	<%
}
rs.close();
stmt.close();
con.close();

%>
</table>
</body>
</html>