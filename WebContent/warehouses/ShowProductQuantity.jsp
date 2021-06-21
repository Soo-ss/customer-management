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
<h1>제품 재고 현황입니다.</h1>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>제품명</th>
			<th>기준가</th>
			<th>원가</th>
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
("select * from inventories natural join products where warehouse_id=?");
String warehouse_id = request.getParameter("warehouse_id");
stmt.setString(1, warehouse_id);
ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	String product_name = rs.getString("product_name");
	String standard_cost = rs.getString("standard_cost");
	String list_price = rs.getString("list_price");
	String quantity = rs.getString("quantity");
	%>
	<tr>
	<td><%=product_name%></td>
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