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
if (id.length()<1  || pwd.length()<1) {//�� ������ ���� ���
	script.println("<script>");
	script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�.')");
	script.println("history.back()");
	script.println("</script>");
} else if(id.length()>10 || pwd.length()>12) { //���ڼ��� �ʰ��� ���
	script.println("<script>");
	script.println("alert('���̵�� 10��, �н������ 12�� �̳��� �Է��� ���ֽñ� �ٶ��ϴ�.')");
	script.println("history.back()");
	script.println("</script>");
}  else {//�Է��� ��� �޾��� ���
		try {
			stmt =con.prepareStatement("insert into employee_user values(?, ?, 'employee')");
			stmt.setString(1, id);
			stmt.setString(2, pwd);
			ResultSet rs = stmt.executeQuery();
			rs.close();
			stmt.close();
			con.close();
			script.println("<script>");
			script.println("alert('ȸ�������� �Ϸ�Ǿ����ϴ�.')");
			script.println("location.href = 'Login.jsp'");
			script.println("</script>");
	} catch (Exception e) { //�̹� �����ϴ� ���̵��� ���
		script.println("<script>");
		script.println("alert('�̹� �����ϴ� ���̵� �Դϴ�.')");
		script.println("history.back()");
		script.println("</script>");
	}
}

%>
</body>
</html>