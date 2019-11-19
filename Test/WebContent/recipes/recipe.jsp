<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../db.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>레시피</title>
</head>
<body>
<div id ="top">
<h1>레시피</h1>
<form action="" method="get">
	<input type ="text" size = "70" name="search_recipe"><input type="button" id="search_button">
</form>
</div><br><br><br><br>
<div id="middle"> <!-- 여기에서 다 하지말고 페이지 별로 jsp 문서를 다 만들어서 여기에 삽입하면 되는 거 아닙니까? -->
<jsp:include page ="PrintRecipe1.jsp" flush ="false"/>
<input type="button" value ="1)            " onclick="PageMove()" id="1"/>
<input type="button" value ="2)            " onclick="PageMove()" id="2"/>

</div> 
<br><br><br>
<div id="bottom">
<%
	String query ="select * from myrecipe"; //유저들의 레시피를 가져온다.
	stmt = conn.createStatement();
	rs = stmt.executeQuery(query); %>
	 
	<h2>내가 만든 레시피</h2>
	<form action="recipe_writing.jsp">
		<input type="submit" value="글쓰기">
	</form>
<table>	<% 
	while(rs.next()){	%>
	<tr>
		<td><%= rs.getString("id") %>
		</td>	
		<td><%= rs.getString("combine")%>
		</td>
		<td>
		<%= rs.getString("userDecs")%>
		</td>
		<td><% 
		int count = 0;
		String like = rs.getString("love");
		count = Integer.parseInt(like);
		%>
		<img src ="../image_recipe/like.png"><br> <!-- 버튼으로 만들어야 함 -->
		<% out.println("좋아요" + like+ "회");%>
		</td>
	</tr><% 
	} conn.close();
%></table>
</div>
</body>
</html>