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
<script>

</script>

<body>

<div id ="top">
<h1>레시피</h1>
	<form action="../login/logout.jsp">
		<input type="submit" value="로그아웃" />
	</form>
	<%
	DataBase db = new DataBase();
	%>
	<input type="text" size ="20" /> <input type="button" value ="검색"/>	
</div><br><br><br>

<div id="middle">
<form action="recipe.jsp">
	<%	
		int count =0;
		count = db.GetMaxContent("recipe", "", 5);
		String PageNum = request.getParameter("pageNum");
		if(PageNum == null) PageNum = "1";
		DataBase DB = new DataBase();
		StringBuffer print_recipe = DB.ShowRecipe(PageNum); 
	%>
<table>		
	<%= print_recipe %>
</table>
	<% 
		if(count != 0) {	
			for(int i = 1; i < count + 1; i++) { %>
				<input type="submit" name="pageNum" value="<%=i%>">
		<% } 
		} %>

</form>
</div><br><br><br>

<div id="bottom">



</div>

</body>
</html>