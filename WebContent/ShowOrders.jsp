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
<tr><th>주문 번호<th>주문 상태<th>주문 날짜<th>수량<th>단가<th>주문 제품 상세보기</tr>

<%@ include file="ConnectDB.jsp" %>


<%
PreparedStatement stmt = con.prepareStatement
("select * from orders natural join order_items where customer_id=?");
String customer_id = request.getParameter("customer_id");
stmt.setString(1, customer_id);
ResultSet rs = stmt.executeQuery();

while(rs.next()) {
	String product_id = rs.getString("product_id");
	int order_id = rs.getInt("order_id");
	String status = rs.getString("status");
	String salesman_id = rs.getString("salesman_id");
	String order_date = rs.getString("order_date");
	int quantity = rs.getInt("quantity");
	double unit_price = rs.getDouble("unit_price");
	%><tr><td><%=order_id %><td><%=status %>
	<td><%=order_date %><td><%=quantity %><td><%=unit_price %>
	<td><a href = "ShowOrderItems.jsp?product_id=<%=product_id%>">제품 상세조회</a>
	 <%
}
rs.close();
stmt.close();
con.close();

%>
</table>
</body>
</html>