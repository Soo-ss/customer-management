<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../css/table.css" />
<title>Insert title here</title>
</head>
<body>
<section>
<h1>주문 상태 보기</h1>
<div class="menu">
     <i class="fa fa-home" aria-hidden="true"></i
     ><a href="../main.html">메인 페이지로 가기</a>
</div>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>주문 번호</th>
			<th>주문 상태</th>
			<th>주문 날짜</th>
			<th>수량</th>
			<th>단가</th>
			<th>주문 제품 상세보기</th>
		</tr>		
	</thead>
	</table>
</div>

<div class="tableContent">
<table cellpadding="0" cellspacing="0" border="0">
<tbody>

<%@ include file="../ConnectDB.jsp" %>


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
	%>
	<tr>
	<td><%=order_id %></td>
	<td><%=status %></td>
	<td><%=order_date %></td>
	<td><%=quantity %></td>
	<td><%=unit_price %></td>
	<td><a href = "ShowOrderItems.jsp?product_id=<%=product_id%>">제품 상세조회</a></td>
	</tr>
	 <%
}
rs.close();
stmt.close();
con.close();

%>
</tbody>
</table>
</div>
</section>

</body>
</html>