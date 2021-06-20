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
<h1>재고를 조회할 지역을 선택해 주십시오</h1><br>
<tr><th>주소<th>우편번호<th>도시명<th>주<th>창고이름<th>조회</tr>

<%@ include file="ConnectDB.jsp" %>


<%
PreparedStatement stmt = con.prepareStatement
("select * from locations natural join warehouses where country_id=?");
String country_id = request.getParameter("country_id");
stmt.setString(1, country_id);
ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	String warehouse_id = rs.getString("warehouse_id");
	String location_id = rs.getString("location_id");
	String address = rs.getString("address");
	String postal_code = rs.getString("postal_code");
	String city = rs.getString("city");
	String state = rs.getString("state");
	String warehouse_name = rs.getString("warehouse_name");
	%><tr><td><%=address%><td><%=postal_code%><td><%=city%><td><%=state%><td><%=warehouse_name %>
	<td><a href = "ShowProductQuantity.jsp?warehouse_id=<%=warehouse_id%>">재고 조회</a>
	<%
}
rs.close();
stmt.close();
con.close();

%>
</table>
</body>
</html>