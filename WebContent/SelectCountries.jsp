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
<h1>나라를 선택해주십시오.</h1><br>
<tr><th>나라<th>조회</tr>

<%@ include file="ConnectDB.jsp" %>


<%
PreparedStatement stmt = con.prepareStatement("select * from countries where region_id=?");
String region_id = request.getParameter("region_id");
stmt.setString(1, region_id);
ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	String country_id = rs.getString("country_id");
	String country_name = rs.getString("country_name");	
	%><tr><td><%=country_name%>
	<td><a href = "ShowLocations.jsp?country_id=<%=country_id%>">창고 조회</a>
	<%
}
rs.close();
stmt.close();
con.close();

%>
</table>
</body>
</html>