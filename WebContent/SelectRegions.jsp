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
<h1>��� ��ȸ�� ����� ������ �ֽʽÿ�</h1><br>
<tr><th>���<th>��ȸ</tr>

<%@ include file="ConnectDB.jsp" %>


<%
PreparedStatement stmt = con.prepareStatement("select * from regions");
ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	String region_id = rs.getString("region_id");
	String region_name = rs.getString("region_name");	
	%><tr><td><%=region_name%>
	<td><a href = "SelectCountries.jsp?region_id=<%=region_id%>">���� ��ȸ </a>
	<%
}
rs.close();
stmt.close();
con.close();

%>
</table>
</body>
</html>