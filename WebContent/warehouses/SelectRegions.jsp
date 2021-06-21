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
<h1>��� ��ȸ�� ����� ������ �ֽʽÿ�</h1>
<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>���</th>
			<th>��ȸ</th>
		</tr>		
	</thead>
	</table>
</div>
	
<div class="tableContent">
<table cellpadding="0" cellspacing="0" border="0">
<tbody>
	

<%@ include file="../ConnectDB.jsp" %>


<%
PreparedStatement stmt = con.prepareStatement("select * from regions");
ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	String region_id = rs.getString("region_id");
	String region_name = rs.getString("region_name");	
	%>
	<tr>
	<td><%=region_name%></td>
	<td><a href = "SelectCountries.jsp?region_id=<%=region_id%>">���� ��ȸ </a></td>
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