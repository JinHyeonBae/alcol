<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ page import="DataBase.DataBase"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
       <link href="./css/dictionary.css" rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>검색 페이지</title>

<div class="frame">

<div class="header">
<h1>Dictionary</h1>
</div>

<div class="middle">
<form name="Searchform" action="dictionary.jsp" method = "get">
 <input type ="text" size=20 name ="FindContentId" placeholder="Search.."> 
        <select name="FindkindId">
			<option value="%" selected>ALL</option>
			<option value="소주">소주</option>
			<option value="맥주">맥주</option>
			<option value="막걸리">막걸리</option>
			<option value="담금주">담금주</option>
		<option value="과실주">과실주</option>
		<option value="칵테일">칵테일</option>
	</select>
	<input type="submit" class="button" value="검색"><br>
 
</form>
</div>

<%
    String FindId = request.getParameter("FindContentId");
    String FindKindId = request.getParameter("FindkindId");
    String PageNum_drink = request.getParameter("pageNum_drink");
    String PageNum_recipe = request.getParameter("pageNum_recipe");
    int count = 0;

    DataBase db = new DataBase();

    StringBuffer sb_drink = db.GetFindContent(FindId, FindKindId, PageNum_drink, 5);
%>

<div class="container">
<div id="table">
			<div class="row">
			<span class="cell col1">이미지</span>		
			<span class="cell col2">종류</span>	
			<span class="cell col3">이름</span>	
			<span class="cell col4">용량(ml)</span>	
			<span class="cell col5">가격(원)</span>	
			<span class="cell col6">도수(도)</span>		
			<span class="cell col7">당도</span>	
			<span class="cell col8">탄산</span>		
			<span class="cell col9">칼로리(kcal)</span>	
			<span class="cell col10">좋아요 그림</span>		
			<span class="cell col11">좋아요 수</span>	
			</div>
	</div>
	
	<div id="table"><%= sb_drink %></div>
</div>


<div class="footer">
    <form name="Searchform" action="dictionary.jsp">
        <%
        count = db.GetMaxContent("alcol", "WHERE name LIKE '%"+FindId+"%' and kind LIKE '%"+FindKindId+"%'", 5);
        if(count != 0) {
        %>
            <input type="hidden" name="FindContentId" value="<%=FindId%>">
            <input type="hidden" name="FindkindId" value="<%=FindKindId%>">
            
            <%for(int i = 1; i < count + 1; i++) {%>
                <input type="submit" class="button" name="pageNum_drink" value="<%=i%>">
            <% } %>
        <% } %>
    </form>
   
</div>

</div>
</html>