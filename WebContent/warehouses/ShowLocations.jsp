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
<h1>��� ��ȸ�� ������ ������ �ֽʽÿ�</h1>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>�ּ�</th>
			<th>�����ȣ</th>
			<th>���ø�</th>
			<th>��</th>
			<th>â���̸�</th>
			<th>��ȸ</th>
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
	%>
	<tr>
	<td><%=address%></td>
	<td><%=postal_code%></td>
	<td><%=city%></td>
	<td><%=state%></td>
	<td><%=warehouse_name %></td>
	<td><a href = "ShowProductQuantity.jsp?warehouse_id=<%=warehouse_id%>">��� ��ȸ</a></td>
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