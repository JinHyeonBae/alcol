<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="Drink.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	DrinkContent dc = new DrinkContent();
	System.out.println("들어옴");
	String tableName = request.getParameter("tableName");
	String SignId = (String)session.getAttribute("id"); //현재 아이디 
	String id = request.getParameter("id"); //고유 id
	
	if(dc.DeleteRecipe(tableName, id, SignId) == true){%>
	<script>
		alert("삭제되었습니다!");
		location.href="recipes/recipe.jsp";
	</script>
	<%} else{ %>
	<script>
		alert("본인의 게시글이 아닙니다.");
		location.href="recipes/recipe.jsp";
	</script>
	<%}%>
</body>
</html>