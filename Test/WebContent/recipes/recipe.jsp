<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="DataBase.DataBase"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>레시피</title>
</head>
<style>

</style>

<body>

<div id ="top">
<h1>레시피</h1>
	<form action="../login/logout.jsp">
		<input type="submit" value="로그아웃" />
	</form>
	<input type="text" size ="20" /> <input type="button"/>	
</div><br><br><br>

<div id ="middle">

<form action="PrintRecipe1.jsp">
	<input type ="submit" value="1)        ">
	<input type ="submit" value="2)        ">
</form>
</div><br><br><br>

<div id="bottom">



</div>

</body>
</html>