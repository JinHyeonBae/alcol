<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        
<%@ page import="java.sql.*"%>
<%@ page import="DataBase.DataBase"%>    
<!DOCTYPE html>
<html>

    <br><br><br><br>  
    
	<%  
    String PageNum_drink = request.getParameter("pageNum_drink");
	int count = 0;
	
	DataBase db = new DataBase();
	
    StringBuffer sb_drink = db.Dictionary(PageNum_drink, 5);
%>

<head>

	<link href="css/NewFile.css" rel="stylesheet" type="text/css">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<div>술 사전</div>
</head>
<br>

<body>
<form name="Searchform" action="search.jsp" method = "get">


<li>검색 : <input type ="text" size=20 name ="FindContentId">
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
</li>
</form>

<br><br>

	<table class = "dictionary">
	 <thead>
			<tr>
			<th scope="row">이미지</th>		
			<th scope="row">종류</th>
			<th scope="row">이름</th>
			<th scope="row">용량</th>
			<th scope="row">가격</th>
			<th scope="row">도수</th>
			<th scope="row">당도</th>
			<th scope="row">탄산</th>
			<th scope="row">칼로리</th>
			<th scope="row">좋아요</th>
			<th scope="row"></th>
		</tr>	
		</thead>
		
		 <tbody>
		<%= sb_drink %>
		</tbody>
		
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