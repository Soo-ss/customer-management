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
<h1>�ֹ� ���� ����</h1>
<div class="menu">
     <i class="fa fa-home" aria-hidden="true"></i
     ><a href="../main.html">���� �������� ����</a>
</div>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>�ֹ� ��ȣ</th>
			<th>�ֹ� ����</th>
			<th>�ֹ� ��¥</th>
			<th>����</th>
			<th>�ܰ�</th>
			<th>�ֹ� ��ǰ �󼼺���</th>
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
("select * from orders natural join order_items where customer_id=?");
String customer_id = request.getParameter("customer_id");
stmt.setString(1, customer_id);
ResultSet rs = stmt.executeQuery();

while(rs.next()) {
	String product_id = rs.getString("product_id");
	int order_id = rs.getInt("order_id");
	String status = rs.getString("status");
	String salesman_id = rs.getString("salesman_id");
	String order_date = rs.getString("order_date");
	int quantity = rs.getInt("quantity");
	double unit_price = rs.getDouble("unit_price");
	%>
	<tr>
	<td><%=order_id %></td>
	<td><%=status %></td>
	<td><%=order_date %></td>
	<td><%=quantity %></td>
	<td><%=unit_price %></td>
	<td><a href = "ShowOrderItems.jsp?product_id=<%=product_id%>">��ǰ ����ȸ</a></td>
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