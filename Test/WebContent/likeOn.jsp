<%@page import="Drink.DrinkContent"%>
<%@page import="UserInfo.UserLogin"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	UserLogin userlogin = new UserLogin(request);

	if(!userlogin.isLogin()) { %>
	<script>
		self.window.alert("로그인 정보가 없습니다.");
		location.href = "login/login.html";
	</script>
	<% }

	DrinkContent drink = new DrinkContent();

	String tableName = request.getParameter("tableName");
	String contentName = request.getParameter("id");
	
	if(!drink.LikeUpdate(tableName, contentName, (String)session.getAttribute("id"))) {%>
	<script>
		self.window.alert("이미 눌렸습니다!");
		location.href = "test.jsp";
	</script>
	<% } %>
<script>
	self.window.alert("좋아요!");
	location.href = "test.jsp";
</script>
</body>
</html>