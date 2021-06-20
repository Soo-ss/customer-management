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
<h1>재고를 조회할 대륙을 선택해 주십시오</h1><br>
<tr><th>대륙<th>조회</tr>

<%@ include file="ConnectDB.jsp" %>


<%
PreparedStatement stmt = con.prepareStatement("select * from regions");
ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	String region_id = rs.getString("region_id");
	String region_name = rs.getString("region_name");	
	%><tr><td><%=region_name%>
	<td><a href = "SelectCountries.jsp?region_id=<%=region_id%>">나라 조회 </a>
	<%
}
rs.close();
stmt.close();
con.close();

%>
</table>
</body>
</html>