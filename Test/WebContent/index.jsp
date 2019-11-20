<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="DataBase.DataBase"%>

<!DOCTYPE html>
<html>
<head>
<style>
	* {
		box-sizing : border-box;
	}
	
	body {
		margin: 0;
		font-family : Arial, Helvetica, sans-serif;
	}
	
	.header {
		grid-area : header;
		padding : 30px;
		text-align : center;
		font-size : 35px;
	}
	
	table {
		border-collapse: collapse;
		width: 100%;
	}
	
	th, td {
		text-align: left;
		padding: 8px;
	}
	
	tr:nth-child(even){
		background-color: #f2f2f2;
	}
	
	th {
		background-color: #4CAF50;
		color: white;
	}
	
</style>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Insert title here</title>
</head>
<body>
	<div class="header">
		<h2>술 사전</h2>
	</div>
<%
	DataBase db = new DataBase();
	
	StringBuffer sb_recipe = db.GetFindRanking("recipe");
	StringBuffer sb_drink = db.GetFindRanking("alcol");
%>
	<table>
		<tr>
			<th>이름</th>
			<th>좋아요</th>
		</tr>
		<%= sb_recipe %>
	</table>
	
	<table>
		<tr>
			<th>이름</th>
			<th>좋아요</th>
		</tr>
		<%= sb_drink %>
	</table>
</body>
</html>