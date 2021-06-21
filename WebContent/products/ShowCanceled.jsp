<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../css/table.css" />
<title>배송 상태</title>
</head>
<body>

<section>
<h1>배송 취소 상품</h1>
<div class="menu">
     <i class="fa fa-home" aria-hidden="true"></i
     ><a href="../main.html">메인 페이지로 가기</a>
</div>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>고객명</th>
			<th>연락처</th>
			<th>주소</th>
			<th>배송날짜</th>
			<th>배송상태</th>
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
("select * from contacts natural join customers natural join orders where status='Canceled'");

ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	String first_name = rs.getString("first_name");
	String last_name = rs.getString("last_name");
	String phone = rs.getString("phone");
	String address = rs.getString("address");
	String order_date = rs.getString("order_date");
	String status = rs.getString("status");
	%>
	<tr>
	<td><%=first_name + last_name%></td>
	<td><%=phone %></td>
	<td><%=address%></td>
	<td><%=order_date %></td>
	<td><%=status %></td>
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