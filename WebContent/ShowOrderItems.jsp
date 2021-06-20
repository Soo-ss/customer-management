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
<tr><th>제품명<th>성능<th>기준가<th>권장소비자가격<th>재고</tr>

<%@ include file="ConnectDB.jsp" %>


<%
PreparedStatement stmt = con.prepareStatement
("select * from products natural join inventories where product_id=?");
String product_id = request.getParameter("product_id");
stmt.setString(1, product_id);
ResultSet rs = stmt.executeQuery();

while(rs.next()) {
	String product_name = rs.getString("product_name");
	String description = rs.getString("description");
	double standard_cost = rs.getDouble("standard_cost");
	double list_price = rs.getDouble("list_price");
	int quantity = rs.getInt("quantity");
	%><tr><td><%=product_name %><td><%=description %>
	<td><%=standard_cost %><td><%=list_price %><td><%=quantity %> <%
}
rs.close();
stmt.close();
con.close();

%>
</table>
</body>
</html>