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
int int_manager_id = Integer.parseInt(manager_id);//getParameter���� �׻� String���θ� �ޱ� ������ 
int int_employee_id = Integer.parseInt(employee_id);//DB�� �������� ���� �ϴ�id�� int�� ����ȯ
int arg= int_employee_id+int_manager_id;
String role = "employee";
String job_title = request.getParameter("job_title");


DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");

Date date = new Date(); 
//System.out.println(dateFormat.format(date));
String dateNtime = dateFormat.format(date); //��¥ ��������

PreparedStatement stmt;
PrintWriter script = response.getWriter();

//String sqlStr = "select *from contacts";
if (pwd.length()<1 || last_name.length()<1
		|| phone.length()<1 || job_title.length()<1) {//�� ������ ���� ���
	script.println("<script>");
	script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�.')");
	script.println("history.back()");
	script.println("</script>");
} else if(pwd.length()>12) { //���ڼ��� �ʰ��� ���
	script.println("<script>");
	script.println("alert('���̵�� 10��, �н������ 12�� �̳��� �Է��� ���ֽñ� �ٶ��ϴ�.')");
	script.println("history.back()");
	script.println("</script>");
}  else {//�Է��� ��� �޾��� ���
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
			script.println("alert('ȸ�������� �Ϸ�Ǿ����ϴ�.')");
			script.println("location.href = 'Login.jsp'");
			script.println("</script>");
	} catch (Exception e) { //�̹� �����ϴ� ���̵��� ���
		script.println("<script>");
		script.println("alert('�̹� �����ϴ� ID�ų� �������� �ʴ� �Ŵ��� ID �Դϴ�.')");
		script.println("history.back()");
		script.println("</script>");
	}
}

%>
</body>
</html>