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
<h1>품목별 제품 정보</h1>
<div class="menu">
     <i class="fa fa-home" aria-hidden="true"></i
     ><a href="../main.html">메인 페이지로 가기</a>
</div>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>품목</th>
			<th>제품명</th>
			<th>성능</th>
			<th>기준가</th>
			<th>권장소비자가격</th>
		</tr>		
	</thead>
	</table>
</div>
	
<div class="tableContent">
<table cellpadding="0" cellspacing="0" border="0">
<tbody>

<%@ include file="../ConnectDB.jsp" %>


<%
PreparedStatement stmt = con.prepareStatement("select * from products natural join product_categories where category_id=?");
String category_id = request.getParameter("category_id");
stmt.setString(1, category_id);
ResultSet rs = stmt.executeQuery();

while(rs.next()) {
	int product_id = rs.getInt("product_id");
	String product_name = rs.getString(3); //컬럼을 숫자로 넣어줄 수 있음
	String description = rs.getString(4);
	double standard_cost = rs.getDouble(5);
	double list_price = rs.getDouble(6);
	String category_name = rs.getString(7);
	%>
	<tr>
	<td> <%=category_name %></td>
	<td><%=product_name %></td> 
	<td><%=description %></td>
	<td><%=standard_cost %></td> 
	<td><%=list_price %></td>
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