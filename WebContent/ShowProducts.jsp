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
<tr><th>��ǰ��ȣ<th>��ǰ �̸�<th>����<th>���ذ�<th>���� <th>ǰ�� ��ȣ<th>��ȸ</tr>

<h1>��ǰ ���� ��ȸ</h1><br>

<%@ include file="ConnectDB.jsp" %>

<%

String searchProducts = request.getParameter("product_name");
PreparedStatement stmt;

String sqlStr = "select *from products";
if (searchProducts !=null && searchProducts.length()>1) {//��ǰ�� �ִ� ���
	stmt = con.prepareStatement("select * from products product_name=?");
	stmt.setString(1, searchProducts);
} else {//��ǰ�� ���� ���
	stmt =con.prepareStatement("select * from products");
}


ResultSet rs = stmt.executeQuery();

while(rs.next()) {
	int product_id = rs.getInt("product_id");
	String product_name = rs.getString("product_name");
	String description = rs.getString("description"); //�÷��� ���ڷ� �־��� �� ����
	String standard_cost = rs.getString("standard_cost");
	String list_price = rs.getString("list_price");
	int category_id = rs.getInt("category_id");
	%><tr> <td><%=product_id %> 
	<td><%=product_name %><td><%=description %> <td><%=standard_cost %> 
	<td><%=list_price %>
	<td><%=category_id %>
	<td><a href = "ShowInventories.jsp?product_id=<%=product_id%>">��� ��Ȳ</a>
	<%
}
rs.close();
stmt.close();
con.close();

%>
</table>
</body>
</html>