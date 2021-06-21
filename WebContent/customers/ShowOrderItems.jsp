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
<h1>주문한 상품 보기</h1>
<div class="menu">
     <i class="fa fa-home" aria-hidden="true"></i
     ><a href="../main.html">메인 페이지로 가기</a>
</div>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>제품명</th>
			<th>성능</th>
			<th>기준가</th>
			<th>권장소비자가격</th>
			<th>재고</th>
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
	%>
	<tr>
	<td><%=product_name %></td>
	<td><%=description %></td>
	<td><%=standard_cost %></td>
	<td><%=list_price %></td>
	<td><%=quantity %></td>
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