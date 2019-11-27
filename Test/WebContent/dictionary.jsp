<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        
<%@ page import="java.sql.*"%>
<%@ page import="DataBase.DataBase"%>    
<!DOCTYPE html>
<html>
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
    <br><br><br><br>  
    
	<%  
    String PageNum_drink = request.getParameter("pageNum_drink");
	int count = 0;
	
	DataBase db = new DataBase();
	
    StringBuffer sb_drink = db.Dictionary(PageNum_drink, 5);
%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<center><b><font size ="15">술 사전</font></b></center>
</head>
<br>

<body>
<form name="Searchform" action="search.jsp" method = "get">

<center>
검색 : <input type ="text" size=20 name ="FindContentId">
        <select name="FindkindId">
			<option value="%" selected>ALL</option>
			<option value="소주">소주</option>
			<option value="맥주">맥주</option>
			<option value="막걸리">막걸리</option>
			<option value="담금주">담금주</option>
		<option value="과실주">과실주</option>
		<option value="칵테일">칵테일</option>
	</select>
	<input type="submit" value="검색"><br>
</center>
</form>

<br><br>

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
		<%= sb_drink %>
	</table>
	
		 <form name="Dictionaryform" action="dictionary.jsp">
        <%
        count = db.GetMaxContent("alcol", "", 5);
        if(count != 0) {
        %>
            <%for(int i = 1; i < count + 1; i++) {%>
                <input type="submit" name="pageNum_drink" value="<%=i%>">
            <% } %>
        <% } %>
    </form>

	
	

</body>
</html>