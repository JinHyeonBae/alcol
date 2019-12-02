<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="UserInfo.UserLogin"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인</title>
</head>

<body>
<% 

   String LoginId = request.getParameter("SignInId");
   String LoginPw = request.getParameter("SignInPw");
   int result =0;
   
   UserLogin logincompare = new UserLogin(request);
   result = logincompare.Login(LoginId, LoginPw);
   
   if(result == 0) {%>
      <script> alert("로그인에 실패했습니다."); history.go(-1);</script>
   <%} else if(result == -1){%>   
      <script>alert("정보를 기입해주세요"); history.go(-1);</script>
   <%} else { %>
      <script> location.href="../login/login.html";</script>
   <%}%>
   
</body>
</html> 