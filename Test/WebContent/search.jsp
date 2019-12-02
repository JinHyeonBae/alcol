<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ page import="Drink.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/search.css" rel="stylesheet" type="text/css">
<title>검색 페이지</title>

<div class="frame">

<div class="header">

<form name="Searchform" action="search.jsp">
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

    <input type="hidden" class="button" name="pageNum_drink" value="1">
    <input type="submit" class="button" value="검색">
</form>
</div>

<%
    String FindId = request.getParameter("FindContentId");
    String FindKindId = request.getParameter("FindkindId");
    String PageNum_drink = request.getParameter("pageNum_drink");
    int count = 0;

    DrinkContent db = new DrinkContent();

    DrinkPaging sb_drink = db.getDrinkContent(FindId, FindKindId, PageNum_drink, 5);
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
   
   <div id="table"><%= sb_drink.getSb() %></div>
</div>


<div class="footer">
    <form name="Searchform" action="search.jsp">
        <%
        count = sb_drink.getCount();
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