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
<tr><th>제품번호<th>제품 이름<th>설명<th>기준가<th>정가 <th>품목 번호<th>조회</tr>

<h1>제품 정보 조회</h1><br>

<%@ include file="ConnectDB.jsp" %>

<%

String searchProducts = request.getParameter("product_name");
PreparedStatement stmt;

String sqlStr = "select *from products";
if (searchProducts !=null && searchProducts.length()>1) {//제품이 있는 경우
	stmt = con.prepareStatement("select * from products product_name=?");
	stmt.setString(1, searchProducts);
} else {//제품이 없는 경우
	stmt =con.prepareStatement("select * from products");
}


ResultSet rs = stmt.executeQuery();

while(rs.next()) {
	int product_id = rs.getInt("product_id");
	String product_name = rs.getString("product_name");
	String description = rs.getString("description"); //컬럼을 숫자로 넣어줄 수 있음
	String standard_cost = rs.getString("standard_cost");
	String list_price = rs.getString("list_price");
	int category_id = rs.getInt("category_id");
	%><tr> <td><%=product_id %> 
	<td><%=product_name %><td><%=description %> <td><%=standard_cost %> 
	<td><%=list_price %>
	<td><%=category_id %>
	<td><a href = "ShowInventories.jsp?product_id=<%=product_id%>">재고 현황</a>
	<%
}
rs.close();
stmt.close();
con.close();

%>
</table>
</body>
</html>