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
<div class="menu">
          <i class="fa fa-home" aria-hidden="true"></i
          ><a href="../main.html">���� �������� ����</a>
</div>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>
			<a href="./ShowProducts.jsp?product_name=sort&standard=product_id">
			<i class="fa fa-sort" aria-hidden="true"></i></a>
				��ǰ��ȣ
			</th>
			<th><a href="./ShowProducts.jsp?product_name=sort&standard=product_name">
			<i class="fa fa-sort" aria-hidden="true"></i></a>
				��ǰ �̸�
			</th>
			<th><a href="./ShowProducts.jsp?product_name=sort&standard=description">
			<i class="fa fa-sort" aria-hidden="true"></i></a>
				����
			</th>
			<th><a href="./ShowProducts.jsp?product_name=sort&standard=standard_cost">
			<i class="fa fa-sort" aria-hidden="true"></i></a>
				���ذ�
			</th>
			<th><a href="./ShowProducts.jsp?product_name=sort&standard=list_price">
			<i class="fa fa-sort" aria-hidden="true"></i></a>
				����
			</th>
			<th><a href="./ShowProducts.jsp?product_name=sort&standard=category_id">
			<i class="fa fa-sort" aria-hidden="true"></i></a>
				ǰ�� ��ȣ
			</th>
			<th><a href="./ShowProducts.jsp?product_name=sort&standard=quantity">
			<i class="fa fa-sort" aria-hidden="true"></i></a>
				���
			</th>
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
String standard = request.getParameter("standard");
PreparedStatement stmt;

// sort
if(searchProducts != null && searchProducts.equals("sort")){
	String sql = "select * from products natural join inventories order by " + standard;
	stmt = con.prepareStatement(sql);
	System.out.println("Sorting...");
} else if (searchProducts !=null && searchProducts.length()>1) {//��ǰ�� �ִ� ���
   stmt = con.prepareStatement("select * from products natural join inventories where product_name=?");
   stmt.setString(1, searchProducts);
	System.out.println("Progress...");
} else {//��ǰ�� ���� ���
   stmt =con.prepareStatement("select * from products natural join inventories");
	System.out.println("Null...");
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