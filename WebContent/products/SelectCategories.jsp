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
<h1>제품 카테고리</h1>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>품명</th>
			<th>조회</th>
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
("select * from product_categories");

ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	String category_id = rs.getString("category_id");
	String category_name = rs.getString("category_name");	
	%>
	<tr>
	<td><%=category_name%></td>
	<td><a href = "ShowProduct_categories.jsp?category_id=<%=category_id%>">품목별 조회 </a></td>
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