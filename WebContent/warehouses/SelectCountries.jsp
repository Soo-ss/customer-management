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
<h1>���� �������ֽʽÿ�.</h1>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>����</th>
		</tr>		
	</thead>
	</table>
</div>
	
<div class="tableContent">
<table cellpadding="0" cellspacing="0" border="0">
<tbody>


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
	<tr>
	<td><a class="menu_items" href = "ShowLocations.jsp?country_id=<%=country_id%>"><%=country_name%></a></td>
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