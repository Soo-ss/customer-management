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
<tr><th>��ǰ��<th>����<th>���ذ�<th>����Һ��ڰ���<th>ǰ��</tr>

<%@ include file="ConnectDB.jsp" %>


<%
PreparedStatement stmt = con.prepareStatement("select * from products natural join product_categories where category_id=?");
String category_id = request.getParameter("category_id");
stmt.setString(1, category_id);
ResultSet rs = stmt.executeQuery();

while(rs.next()) {
	int product_id = rs.getInt("product_id");
	String product_name = rs.getString(3); //�÷��� ���ڷ� �־��� �� ����
	String description = rs.getString(4);
	double standard_cost = rs.getDouble(5);
	double list_price = rs.getDouble(6);
	String category_name = rs.getString(7);
	%><tr><td><%=product_name %> 
	<td><%=description %> <td><%=standard_cost %> <td><%=list_price %>
	<td> <%=category_name %> 
	<%	
}
rs.close();
stmt.close();
con.close();

%>
</table>
</body>
</html>