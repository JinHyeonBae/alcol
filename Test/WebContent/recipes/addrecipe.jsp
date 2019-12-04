<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="Drink.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>레시피</title>
</head>
<body>
   
   <%
   DrinkContent DB = new DrinkContent();
   String Name = request.getParameter("username"); //유저가 입력한 알콜 조합 이름
   System.out.println(Name);
   String combName = request.getParameter("userAlcol"); //유저가 입력한 알콜 조합
   String content = request.getParameter("user_recipe"); //유저가 입력한 알콜 설명
   String id = (String)session.getAttribute("id"); // 유저의 세션에 있는 유저의 아이디 
   int count =0;
   
   count = DB.WriteRecipe("myrecipe", Name, content, combName, 0, id);
   if(count == 1)
      response.sendRedirect("recipe.jsp");
   %>
   

</body>
</html>