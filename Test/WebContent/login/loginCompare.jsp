<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="DataBase.DataBase"%>
<%@ include file="./loginCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인</title>
</head>
<% 
	String LoginId = request.getParameter("SignInId");
	String LoginPw = request.getParameter("SignInPw");
	int result =0;

	DataBase LC = new DataBase();
	result = LC.LoginCompare(LoginId, LoginPw, session);
	
	
	if(result == -1) {%>
		<script> alert("로그인에 실패했습니다."); location.href="login.html";</script>
	<%} else if(result == -2){%>	
		<script>alert("정보를 기입해주세요"); location.href="login.html";</script>
	<%} else { %>
		<script> location.href="../recipes/recipe.jsp";</script>
	<%}%>
	
<body>
</body>
</html> 