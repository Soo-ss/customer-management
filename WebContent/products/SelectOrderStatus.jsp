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
<title>배송상태 선택창</title>
</head>
<body>

<section>
<h1>배송 상태를 선택해주십시오.</h1>
	<div class ="select_menu">
		<a href = "./ShowAllStatus.jsp">전체 배송</a>
	</div>
	<div class ="select_menu">
		<a href = "./ShowShipped.jsp">배송 완료</a>
	</div>
	<div class ="select_menu">
		<a href = "./ShowPending.jsp">배송 보류</a>
	</div>
	<div class ="select_menu">
		<a href = "./ShowCanceled.jsp">배송 취소</a>
	</div>
	
</section>

</body>
</html>