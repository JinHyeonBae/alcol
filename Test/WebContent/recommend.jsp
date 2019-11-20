<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="DataBase.DataBase"%>
<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>title</title>
</head>
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
<body>
<%
	DataBase db = new DataBase();

	StringBuffer sb = db.GetRecommend(2.0f, 0.0f, 3.0f);
%>
	<table>
		<tr>		
			<td>이름</td>
			<td>당도</td>
			<td>탄산</td>
			<td>도수</td>
			<td>크기</td>
		</tr>
		<%= sb %>
	</table>
	
</body>
</html>