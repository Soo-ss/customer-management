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
<h1>��ǰ ���� ��ȸ</h1>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>��ǰ��ȣ</th>
			<th>��ǰ �̸�</th>
			<th>����</th>
			<th>���ذ�</th>
			<th>����</th>
			<th>ǰ�� ��ȣ</th>
			<th>���</th>
		</tr>		
	</thead>
	</table>
</div>
	
<div class="tableContent">
<table cellpadding="0" cellspacing="0" border="0">
<tbody>

<%@ include file="../ConnectDB.jsp" %>

<%

String searchProducts = request.getParameter("product_name");
PreparedStatement stmt;

String sqlStr = "select *from products";
if (searchProducts !=null && searchProducts.length()>1) {//��ǰ�� �ִ� ���
   stmt = con.prepareStatement("select * from products natural join inventories where product_name=?");
   stmt.setString(1, searchProducts);
} else {//��ǰ�� ���� ���
   stmt =con.prepareStatement("select * from products natural join inventories");
}


ResultSet rs = stmt.executeQuery();

while(rs.next()) {
   int product_id = rs.getInt("product_id");
   String product_name = rs.getString("product_name");
   String description = rs.getString("description"); //�÷��� ���ڷ� �־��� �� ����
   String standard_cost = rs.getString("standard_cost");
   String list_price = rs.getString("list_price");
   int category_id = rs.getInt("category_id");
   int quantity = rs.getInt("quantity");
   %>
   <tr>
   <td><%=product_id %></td>
   <td><%=product_name %></td>
   <td><%=description %> </td>
   <td><%=standard_cost %> </td>
   <td><%=list_price %></td>
   <td><%=category_id %></td>
   <td><%=quantity %></td>
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