<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../css/table.css" />
<title>��� ����</title>
</head>
<body>

<section>
<h1>��� ��� ��ǰ</h1>
<div class="menu">
     <i class="fa fa-home" aria-hidden="true"></i
     ><a href="../main.html">���� �������� ����</a>
</div>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>����</th>
			<th>����ó</th>
			<th>�ּ�</th>
			<th>��۳�¥</th>
			<th>��ۻ���</th>
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