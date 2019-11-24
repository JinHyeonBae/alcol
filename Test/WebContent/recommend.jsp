<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="DataBase.DataBase"%>
<!DOCTYPE html>

<html>
<br>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>title</title>
    <center>
    <font size = 15 >추천</font>
    </center>

</head>
    <br>
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
<form name="Recommendform" action="recommend.jsp">
<table border=1>
<tr>
<td>당도</td>
<td>
<INPUT id ="0" TYPE="radio" NAME="sweet" value="0" checked="checked"> 0 
<INPUT id ="1" TYPE="radio" NAME="sweet" value="1" > 1
<INPUT id ="2" TYPE="radio" NAME="sweet" value="2" > 2
<INPUT id ="3" TYPE="radio" NAME="sweet" value="3" > 3
<INPUT id ="4" TYPE="radio" NAME="sweet" value="4" > 4
<INPUT id ="5" TYPE="radio" NAME="sweet" value="5" > 5
</td>
</tr>

<tr>
<td>탄산</td>
<td>
<INPUT id ="0" TYPE="radio" NAME="tansan" value="0" checked="checked"> 0 
<INPUT id ="1" TYPE="radio" NAME="tansan" value="1" > 1
<INPUT id ="2" TYPE="radio" NAME="tansan" value="2" > 2
<INPUT id ="3" TYPE="radio" NAME="tansan" value="3" > 3
<INPUT id ="4" TYPE="radio" NAME="tansan" value="4" > 4
<INPUT id ="5" TYPE="radio" NAME="tansan" value="5" > 5
</td>
</tr>

<tr>
<td>도수</td>
<td>
<INPUT id ="0" TYPE="radio" NAME="alcohol" value="0" checked="checked" > 0 ~ 5
<INPUT id ="1" TYPE="radio" NAME="alcohol" value="1" > 5 ~ 10
<INPUT id ="2" TYPE="radio" NAME="alcohol" value="2" > 10 ~ 15
<INPUT id ="3" TYPE="radio" NAME="alcohol" value="3" > 15 ~ 20
<INPUT id ="4" TYPE="radio" NAME="alcohol" value="4" > 20 ~ 25
<INPUT id ="5" TYPE="radio" NAME="alcohol" value="5" > 25 ~ 30
<INPUT id ="6" TYPE="radio" NAME="alcohol" value="6" > 30 ~ 35
<INPUT id ="7" TYPE="radio" NAME="alcohol" value="7" > 35 ~ 40
</td>
</tr>

<tr>
<td colspan=2 align=center>
<input type = "submit" value = "추천 ">
</td></tr>
</table>

</form>
<br><br>
<%
	DataBase db = new DataBase();

	int sweet = 0;
	if(request.getParameter("sweet") != null)
		sweet= Integer.parseInt(request.getParameter("sweet"));
	int tansan = 0;
	if(request.getParameter("tansan") != null)
		tansan = Integer.parseInt(request.getParameter("tansan"));
	int alcohol = 0;
	if(request.getParameter("alcohol") != null)
		alcohol = Integer.parseInt(request.getParameter("alcohol"));
	
	StringBuffer sb = db.GetRecommend(sweet, tansan, alcohol);


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