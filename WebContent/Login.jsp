<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/form.css">

<meta charset="EUC-KR">
<title>로그인 페이지</title>
</head>
<body>
    <div class="container">
      <div>
        <h1>Soo-Hyun</h1>
        <p class="subTitle">Management System</p>
        <h2>로그인</h2>
        <form action="j_security_check" method="post">
          <div class="input_box">
            <input type="text" name="j_username" placeholder="ID" style="text-align:center" />
          </div>
          <div class="input_box">
            <input type="password" name="j_password" placeholder="Password" style="text-align:center"/>
          </div>
          <input class="submit_btn" type="submit" value="로그인" />
        </form>
        <a class="signup_btn" href="./Signup.html">아직 회원이 아니신가요? </a>
        <div class="copy">
          <p>
            &copy; 2021 Soo-Hyun Management System
            <br />
            All rights reserved.
          </p>
        </div>
      </div>
    </div>
  </body>
</html>