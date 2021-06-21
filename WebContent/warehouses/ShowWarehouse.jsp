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
<h1>창고 정보</h1>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>창고명</th>
			<th>주소</th>
			<th>우편번호</th>
			<th>도시명</th>
			<th>주</th>
			<th>국가</th>
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
("select * from warehouses natural join locations natural join countries where warehouse_name=?");
String warehouse_id = request.getParameter("warehouse_name");
stmt.setString(1, warehouse_id);
ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	String warehouse_name = rs.getString("warehouse_name");
	String address = rs.getString("address");
	String postal_code = rs.getString("postal_code");
	String country_name = rs.getString("country_name");
	String city = rs.getString("city");
	String state = rs.getString("state");
	%>
	<tr>
	<td><%=warehouse_name%></td>
	<td><%=address %></td>
	<td><%=postal_code%></td>
	<td><%=country_name %></td>
	<td><%=city%></td>
	<td><%=state%></td>
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