<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../css/select.css" />
<title>국가 선택</title>
</head>
<body>

<section>
<h1>국가를 선택해주십시오.</h1>



<%@ include file="../ConnectDB.jsp" %>


<%
PreparedStatement stmt = con.prepareStatement("select * from countries where region_id=?");
String region_id = request.getParameter("region_id");
stmt.setString(1, region_id);
ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	String country_id = rs.getString("country_id");
	String country_name = rs.getString("country_name");	
	%>
		<div class="select_menu">
		<a href = "ShowLocations.jsp?country_id=<%=country_id%>">
		<%=country_name%></a></div>
	<%
}
rs.close();
stmt.close();
con.close();

%>

</section>

</body>
</html>