<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.util.*"%>  
<%@ page import="DataBase.DataBase"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그아웃</title>
</head>
<body>
<%
	session.invalidate();
%>	
<script>alert("로그아웃되었습니다."); location.href="login.html";</script>

</body>
</html>