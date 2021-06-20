<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%@ page import="java.sql.*" %> 
<%@ page import= "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%@ include file="ConnectDB.jsp" %>
<%

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

PreparedStatement stmt;
PrintWriter script = response.getWriter();

//String sqlStr = "select *from contacts";
if (id.length()<1  || pwd.length()<1) {//빈 문항이 있을 경우
	script.println("<script>");
	script.println("alert('입력이 안 된 문항이 있습니다.')");
	script.println("history.back()");
	script.println("</script>");
} else if(id.length()>10 || pwd.length()>12) { //글자수를 초과할 경우
	script.println("<script>");
	script.println("alert('아이디는 10자, 패스워드는 12자 이내로 입력을 해주시기 바랍니다.')");
	script.println("history.back()");
	script.println("</script>");
}  else {//입력을 모두 받았을 경우
		try {
			stmt =con.prepareStatement("insert into employee_user values(?, ?, 'employee')");
			stmt.setString(1, id);
			stmt.setString(2, pwd);
			ResultSet rs = stmt.executeQuery();
			rs.close();
			stmt.close();
			con.close();
			script.println("<script>");
			script.println("alert('회원가입이 완료되었습니다.')");
			script.println("location.href = 'Login.jsp'");
			script.println("</script>");
	} catch (Exception e) { //이미 존재하는 아이디일 경우
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
}

%>
</body>
</html>