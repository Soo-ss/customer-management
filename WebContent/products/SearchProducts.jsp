<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/form.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div>
		<h1 class="bigTitle">제품 조회</h1>
		<form action = "ShowProducts.jsp">
			<div class="input_box">
				<input type="text" name = "product_name" placeholder="제품명을 업력하세요"/>
			</div>
			<div class="input_box">
				<input class="submit_btn" type="submit" value="검색"></input>
			</div>
		</form>
	</div>
</div>
</body>
</html>