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
<h1>��� ��ȸ�� ������ ������ �ֽʽÿ�</h1><br>
<tr><th>�ּ�<th>�����ȣ<th>���ø�<th>��<th>â���̸�<th>��ȸ</tr>

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
	<td><a href = "ShowProductQuantity.jsp?warehouse_id=<%=warehouse_id%>">��� ��ȸ</a>
	<%
}
rs.close();
stmt.close();
con.close();

%>
</table>
</body>
</html>