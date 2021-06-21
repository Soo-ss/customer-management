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
<h1>제품 정보 조회</h1>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>제품번호</th>
			<th>제품 이름</th>
			<th>설명</th>
			<th>기준가</th>
			<th>정가</th>
			<th>품목 번호</th>
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

String searchProducts = request.getParameter("product_name");
PreparedStatement stmt;

String sqlStr = "select *from products";
if (searchProducts !=null && searchProducts.length()>1) {//제품이 있는 경우
   stmt = con.prepareStatement("select * from products natural join inventories where product_name=?");
   stmt.setString(1, searchProducts);
} else {//제품이 없는 경우
   stmt =con.prepareStatement("select * from products natural join inventories");
}


ResultSet rs = stmt.executeQuery();

while(rs.next()) {
   int product_id = rs.getInt("product_id");
   String product_name = rs.getString("product_name");
   String description = rs.getString("description"); //컬럼을 숫자로 넣어줄 수 있음
   String standard_cost = rs.getString("standard_cost");
   String list_price = rs.getString("list_price");
   int category_id = rs.getInt("category_id");
   int quantity = rs.getInt("quantity");
   %>
   <tr>
   <td><%=product_id %></td>
   <td><%=product_name %></td>
   <td><%=description %> </td>
   <td><%=standard_cost %> </td>
   <td><%=list_price %></td>
   <td><%=category_id %></td>
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