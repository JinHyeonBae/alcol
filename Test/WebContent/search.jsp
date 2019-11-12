<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ include file="./db.jsp"%>
    
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-KR">
<title>Insert title here</title>
</head>
<body>

<form action="search.jsp" method = "get">
	검색 : <input type ="text" size=20 name ="FindContentId">
	
	<select name="FindkindId">
		<option value="%" selected>ALL</option>
		<option value="맥주">맥주</option>
		<option value="소주">소주</option>
		<option value="막걸리">막걸리</option>
	</select>
	
	<input type="submit" value="Find"><br>
</form>

<%
	String FindId= request.getParameter("FindContentId");
	String FindKindId = request.getParameter("FindkindId");
	
	String query = "select * from alcol WHERE name LIKE '%"+FindId+"%' and kind LIKE '"+FindKindId+"'";
	
	stmt = conn.createStatement();
	rs = stmt.executeQuery(query); 
%> 
	<table>
		<tr>
			<td>이름</td>
			<td>종류</td>
			<td>도수</td>
		</tr>
	<%while(rs.next()) { %>
		<tr>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getString("kind") %></td>
			<td><%= rs.getFloat("alcohol") %></td>
		</tr>
	<% } %>
	</table>
</body>
</html>