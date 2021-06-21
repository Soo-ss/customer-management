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
<h1>고객 전체 보기</h1>
<ul class="menu">
        <li>
          <i class="fa fa-home" aria-hidden="true"></i
          ><a href="../main.html">메인 페이지로 가기</a>
        </li>
        <li>
          <i class="fa fa-sort" aria-hidden="true"></i
          ><a href="./ShowCustomers.jsp?first_name=sort&last_name=name">이름으로 정렬</a>
        </li>
      </ul>

<div class="tableHeader">
<table cellpadding="0" cellspacing="0" border="0" >
	<thead>
		<tr>
			<th>고객명</th>
			<th>이메일</th>
			<th>연락처</th>
			<th>이름</th>
			<th>주소</th>
			<th>웹 사이트</th>
			<th>신용 한도</th>
			<th>구매 정보</th>
		</tr>		
	</thead>
	</table>
</div>
	
<div class="tableContent">
<table cellpadding="0" cellspacing="0" border="0">
<tbody>
	
<%@ include file="../ConnectDB.jsp" %>
<%

String first_name = request.getParameter("first_name");
String last_name = request.getParameter("last_name");
PreparedStatement stmt;

//sort
if (first_name != null && first_name.equals("sort")) {
	stmt = con.prepareStatement("select * from contacts natural join customers order by name");
	
//고객이 있는 경우
} else if ((first_name !=null && first_name.length()>1) || (last_name !=null && last_name.length()>1)) {
	stmt = con.prepareStatement("select * from contacts natural join customers where first_name=? and last_name=?");
	stmt.setString(1, first_name);
	stmt.setString(2, last_name);

} else{
	stmt = con.prepareStatement("select * from contacts natural join customers");
}


ResultSet rs = stmt.executeQuery();


while(rs.next()) {
	int customer_id = rs.getInt("customer_id");
	String email = rs.getString("email");
	String phone = rs.getString("phone");
	String name = rs.getString("name");
	String address = rs.getString("address");
	String website = rs.getString("website");
	
	first_name = rs.getString("first_name");
	last_name = rs.getString("last_name");
	
	int credit_limit = rs.getInt("credit_limit");
	
	System.out.println("이름 값: "+first_name + " " + last_name);
	
	%>
	
	<tr>
	<td><%=first_name + " " + last_name %></td>
	<td><%=email %></td>
	<td><%=phone %></td>
	<td><%=name %></td>
	<td><%=address %></td>
	<td><%=website %></td>
	<td><%=credit_limit %></td> 
	<td><a href = "ShowOrders.jsp?customer_id=<%=customer_id%>">구매 내역</a></td>
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