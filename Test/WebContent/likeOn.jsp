<%@page import="Drink.DrinkContent"%>
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
	DrinkContent dc = new DrinkContent();
	
	dc.LikeUpdate("recipe", "1");
%>
<script>
	self.window.alert("좋아요!");
	location.href = "test.jsp";
</script>
</body>
</html>