<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../css/select.css" />
<title>제품 품목선택창</title>
</head>
<body>
<section>
<h1>품목을 선택해주세요.</h1>

<%@ include file="../ConnectDB.jsp" %>


<%
PreparedStatement stmt = con.prepareStatement
("select * from product_categories");

ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	String category_id = rs.getString("category_id");
	String category_name = rs.getString("category_name");	
	%>
		<div class="select_menu">
			<a href = "ShowProduct_categories.jsp?category_id=<%=category_id%>"><%=category_name%> </a>
		</div>
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