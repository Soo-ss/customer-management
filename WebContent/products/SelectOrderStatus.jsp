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
<title>��ۻ��� ����â</title>
</head>
<body>

<section>
<h1>��� ���¸� �������ֽʽÿ�.</h1>
	<div class ="select_menu">
		<a href = "./ShowAllStatus.jsp">��ü ���</a>
	</div>
	<div class ="select_menu">
		<a href = "./ShowShipped.jsp">��� �Ϸ�</a>
	</div>
	<div class ="select_menu">
		<a href = "./ShowPending.jsp">��� ����</a>
	</div>
	<div class ="select_menu">
		<a href = "./ShowCanceled.jsp">��� ���</a>
	</div>
	
</section>

</body>
</html>