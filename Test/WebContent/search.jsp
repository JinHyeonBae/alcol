<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="DataBase.DataBase"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
    
<!DOCTYPE html>
<html>
<head>
<style>
	table {
		font-family: arial, sans-serif;
		border-collapse: collapse;
		width: 100%;
	}

	td, th {
		border: 1px solid #dddddd;
		text-align: left;
		padding: 8px;
	}

	tr:nth-child(even) {
		background-color: #dddddd;
	}
</style>
<<<<<<< HEAD
=======

>>>>>>> Lee
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<form name="Searchform" action="search.jsp">
	검색 : <input type ="text" size=20 name ="FindContentId">
	
	<select name="FindkindId">
		<option value="%" selected>ALL</option>
		<option value="소주">레시피</option>
		<option value="소주">소주</option>
		<option value="맥주">맥주</option>
		<option value="막걸리">막걸리</option>
		<option value="담금주">담금주</option>
		<option value="과실주">과실주</option>
		<option value="칵테일">칵테일</option>
	</select>
	
	<input type="button" value="Find"><br>
</form>

<%
<<<<<<< HEAD
String query;
//이전 페이지의 url 값 받아오기
String PreUrl = request.getHeader("referer");
//dictionary.jsp에서 받은 값으로 검색한 결과 띄우고 싶은데 query 문이 하나밖에 안되네 ㅎ..우야지

//만약 전 페이지가 dictionary.jsp 였으면 거기서 입력한 값 받아와서 검색
	if(PreUrl=="http://localhost:8001/Test/WebContent/WEB-INF/dictionary.jsp"){
	String kind = request.getParameter("kind");
	String search = request.getParameter("search");
	query = "select * from alcol WHERE name LIKE '%"+search+"%' and kind LIKE '"+kind+"'";
	
	}
 
//만약 전 페이지가 레시피 페이지라면 ....
if(PreUrl =="http://localhost:8001/Test/recipes/recipe.jsp"){
	String search_recipe=request.getParameter("search_recipe");
	String kind = request.getParameter("kind");
	query = "select * from recipe WHERE name Like '%"+search_recipe+"%' and kind LIKE 레시피";
}

//만약 search.jsp 에서 검색하는 거라면 ...
else{
	String FindId= request.getParameter("FindContentId");
	String FindKindId = request.getParameter("FindkindId");
	 query = "select * from alcol WHERE name LIKE '%"+FindId+"%' and kind LIKE '"+FindKindId+"'";
}

	stmt = conn.createStatement();
	rs = stmt.executeQuery(query); 

	
	
	//만약 검색결과가 없으면 검색결과가 없다고 메시지 창 뜨게 하고 싶었어...
%>


=======
	String FindId = request.getParameter("FindContentId");
	String FindKindId = request.getParameter("FindkindId");
	
	DataBase asd = new DataBase();
	
	StringBuffer sb = asd.GetFindContent(FindId, FindKindId);
	
%> 
>>>>>>> Lee
	<table>
			<tr>
			<td>이미지</td>		
			<td>종류</td>
			<td>이름</td>
			<td>용량</td>
			<td>가격</td>
			<td>도수</td>
			<td>당도</td>
			<td>탄산</td>
			<td>칼로리</td>
			<td>좋아요</td>
			<td></td>
			
		</tr>
<<<<<<< HEAD
	<%while(rs.next()) { %>
		<tr>
			<td><Image src="<%= rs.getString("url") %>" width = "150" height="150"></td>
			<td><%= rs.getString("kind") %></td>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getString("volume") %></td>
			<td><%= rs.getString("price") %></td>		
			<td><%= rs.getString("alcohol") %></td>
			<td><%= rs.getString("sweet") %></td>
			<td><%= rs.getString("tansan") %></td>
			<td><%= rs.getString("calories") %></td>
			<td><Image src="<%= rs.getString("likeimage") %>" width = "50" height="50"></td>
			<td><%= rs.getString("love") %></td>
			
		</tr>
=======
		<%=sb%>
>>>>>>> Lee
	</table>
<%} 
	   if(rs.next()==false)
		   out.println("검색결과가 없습니다.");
	
	rs.close();
	stmt.close();
	conn.close();
%>
</body>
</html>