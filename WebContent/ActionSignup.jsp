<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%@ page import="java.sql.*" %> 
<%@ page import= "java.io.PrintWriter" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "java.text.DateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%@ include file="ConnectDB.jsp" %>
<%

String employee_id = request.getParameter("employee_id");
String pwd = request.getParameter("pwd");
String first_name = request.getParameter("first_name");
String last_name = request.getParameter("last_name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String manager_id = request.getParameter("manager_id");
int int_manager_id = Integer.parseInt(manager_id);//getParameter값은 항상 String으로만 받기 때문에 
int int_employee_id = Integer.parseInt(employee_id);//DB에 정수값이 들어가야 하는id는 int로 형변환
int arg= int_employee_id+int_manager_id;
String role = "employee";
String job_title = request.getParameter("job_title");


DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");

Date date = new Date(); 
//System.out.println(dateFormat.format(date));
String dateNtime = dateFormat.format(date); //날짜 가져오기

PreparedStatement stmt;
PrintWriter script = response.getWriter();

//String sqlStr = "select *from contacts";
if (pwd.length()<1 || last_name.length()<1
		|| phone.length()<1 || job_title.length()<1) {//빈 문항이 있을 경우
	script.println("<script>");
	script.println("alert('입력이 안 된 문항이 있습니다.')");
	script.println("history.back()");
	script.println("</script>");
} else if(pwd.length()>12) { //글자수를 초과할 경우
	script.println("<script>");
	script.println("alert('아이디는 10자, 패스워드는 12자 이내로 입력을 해주시기 바랍니다.')");
	script.println("history.back()");
	script.println("</script>");
}  else {//입력을 모두 받았을 경우
		try {
			stmt =con.prepareStatement
					("insert into employees values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			stmt.setInt(1, int_employee_id);
			stmt.setString(2, first_name);
			stmt.setString(3, last_name);
			stmt.setString(4, email);
			stmt.setString(5, phone);
			stmt.setString(6, dateNtime);
			stmt.setInt(7, int_manager_id);
			stmt.setString(8, job_title);
			stmt.setString(9, role);
			stmt.setString(10, pwd);
			
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
		script.println("alert('이미 존재하는 ID거나 존재하지 않는 매니저 ID 입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
}

%>
</body>
</html>