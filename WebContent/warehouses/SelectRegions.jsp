<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../css/table.css" />
<link rel="stylesheet" href="../css/select.css" />
<title>대륙 선택창</title>
</head>
<body>

<section>
<h1>재고를 조회할 대륙을 선택해 주십시오</h1>


<%@ include file="../ConnectDB.jsp" %>


<%
PreparedStatement stmt = con.prepareStatement("select * from regions");
ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	String region_id = rs.getString("region_id");
	String region_name = rs.getString("region_name");	
	%>
	<div class ="select_menu">
	<a href = "SelectCountries.jsp?region_id=<%=region_id%>">
	<%=region_name%> </a></div>
	<%
}
rs.close();
stmt.close();
con.close();

%>
</section>

</body>
</html>