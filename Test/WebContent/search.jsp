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

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
	String FindId = request.getParameter("FindContentId");
	String FindKindId = request.getParameter("FindkindId");
	
	DataBase asd = new DataBase();
	
	StringBuffer sb = asd.GetFindContent(FindId, FindKindId);
	
%> 
	<table>
		<tr>
			<td>이름</td>
			<td>종류</td>
			<td>도수</td>
		</tr>
		<%=sb%>
	</table>
</body>
</html>