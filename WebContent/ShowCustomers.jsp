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
<table border=1 font size=8>
<tr><th>고객명<th>이메일<th>연락처<th>이름<th>주소<th>웹 사이트<th>신용 한도 <th>구매 정보</tr>

<%@ include file="ConnectDB.jsp" %>
<%

String first_name = request.getParameter("first_name");
String last_name = request.getParameter("last_name");
PreparedStatement stmt;

//String sqlStr = "select *from contacts";
if ((first_name !=null && first_name.length()>1) || (last_name !=null && last_name.length()>1)) {//고객이 있는 경우
	stmt = con.prepareStatement
	("select * from contacts natural join customers where first_name=? and last_name=?");
	stmt.setString(1, first_name);
	stmt.setString(2, last_name);
} else {//없는 경우
	stmt = con.prepareStatement("select * from contacts natural join customers");
}


ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	int customer_id = rs.getInt("customer_id");
	String email = rs.getString("email");
	String phone = rs.getString("phone");
	String name = rs.getString("name");
	String address = rs.getString("address");
	String website = rs.getString("website");
	
	first_name = rs.getString("first_name");
	last_name = rs.getString("last_name");
	
	int credit_limit = rs.getInt("credit_limit");
	
	System.out.println("이름 값: "+first_name + " " + last_name);
	
	%><tr><td><%=first_name + " " + last_name %><td><%=email %><td><%=phone %>
	<td><%=name %><td><%=address %> <td><%=website %>  
	<td><%=credit_limit %> <td><a href = "ShowOrders.jsp?customer_id=<%=customer_id%>">구매 내역</a><%
}
rs.close();
stmt.close();
con.close();

%>
</table>
</body>
</html>