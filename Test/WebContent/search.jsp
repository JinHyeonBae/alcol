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

<form name="Searchform" action="search.jsp">
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

    <input type="hidden" name="PageNum" value="1">
    <input type="submit" value="Find"><br>
</form>

<%
    String FindId = request.getParameter("FindContentId");
    String FindKindId = request.getParameter("FindkindId");
    String PageNum_drink = request.getParameter("pageNum_drink");
    String PageNum_recipe = request.getParameter("pageNum_recipe");
    int count = 0;

    DataBase db = new DataBase();

    StringBuffer sb_drink = db.GetFindContent(FindId, FindKindId, PageNum_drink, 5);
    StringBuffer sb_recipe = db.GetFindRecipe(FindId, FindKindId, PageNum_recipe, 5);
%>
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
        </tr>
        <%= sb_drink %>
    </table>

    <form name="Searchform" action="search.jsp">
        <%
        count = db.GetMaxContent("alcol", "WHERE name LIKE '%"+FindId+"%' and kind LIKE '%"+FindKindId+"%'", 5);
        if(count != 0) {
        %>
            <input type="hidden" name="FindContentId" value="<%=FindId%>">
            <input type="hidden" name="FindkindId" value="<%=FindKindId%>">
            <%for(int i = 1; i < count + 1; i++) {%>
                <input type="submit" name="pageNum_drink" value="<%=i%>">
            <% } %>
        <% } %>
    </form>

    <table>
        <tr>
            <td>이름</td>
            <td>설명</td>
            <td>조합</td>
            <td>좋아요</td>
            <td>종류</td>
        </tr>
        <%= sb_recipe %>
    </table>
    <form name="Searchform" action="search.jsp">
        <%
        count = db.GetMaxContent("recipe", "WHERE combinealcol LIKE '%"+FindKindId+"%'", 5);
        if(count != 0) {
        %>
            <input type="hidden" name="FindContentId" value="<%=FindId%>">
            <input type="hidden" name="FindkindId" value="<%=FindKindId%>">
            <%for(int i = 1; i < count + 1; i++) {%>
                <input type="submit" name="pageNum_recipe" value="<%=i%>">
            <% } %>
        <% } %>
    </form>
</body>
</html>