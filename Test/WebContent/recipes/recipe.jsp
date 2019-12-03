<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="DataBase.DataBase"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="./recipe.css" rel="stylesheet" type="text/css">
<title>레시피</title>
</head>

<div class="frame">

<div class="header1">
<h1>레시피</h1>
</div>

<div class="logout">
   <form action="../login/logout.jsp">
      <input type="submit" class="button" value="로그아웃" />
   </form>
   </div>
   
   <div class="middle">
   <input type="text" size ="20"  placeholder="Search.."/> <input type="button" class="button" value ="검색"/>   
</div>


<div class="content1">

   <%   
   DataBase db = new DataBase();
      int count =0;
      count = db.GetMaxContent("recipe", "", 5);
      String PageNum = request.getParameter("pageNum");
      if(PageNum == null) PageNum = "1"; //자꾸 null exception 뜨길래 넣은 조건문임
      DataBase DB = new DataBase();
      StringBuffer print_recipe = DB.ShowRecipe(PageNum); 
   %>
   <div id="table">
         <div class="row">
         <span class="cell col1">이미지</span>      
         <span class="cell col2">이름</span>   
         <span class="cell col3">설명</span>      
         <span class="cell col4">조합 </span>   
         <span class="cell col5">좋아요</span>   
         
         </div>
   <%= print_recipe %>
</div>
</div>
<div class="footer1">
<form action="recipe.jsp">
   <% 
      if(count != 0) {   
         for(int i = 1; i < count + 1; i++) { %>
            <input type="submit" class="button" name="pageNum" value="<%=i%>">
      <% } //페이징 1) 2) .. 버튼
      } %>

</form>
</div>


<div class="header2">
<h1>내가 만든 레시피</h1>
   <form action="recipe_writing.html">
      <input type="submit" class="button" value ="글쓰기"/>
   </form>
   </div>
   
   <div class="content2">
<form action="recipe.jsp">
<% 
   int count2 =0;
   count2 = db.GetMaxContent("myrecipe", "", 5); 
   String PNum_user = request.getParameter("pageNum_user");
   if(PNum_user == null) PNum_user = "1"; //자꾸 null exception 뜨길래 넣은 조건문임
   StringBuffer userRecipe = DB.UserRecipe(PNum_user); 
   //페이징하는 함수임
%>
   <div id="table">
         <div class="row">
         <span class="cell co1">아이디</span>   
         <span class="cell co2">이름</span>   
         <span class="cell co3">조합</span>   
         <span class="cell co4">설명</span>      
         <span class="cell co5">좋아요</span>
         <span class="cell co6">삭제</span>    
         </div>
   </div>
<div id="table">      
   <%= userRecipe %>
</div>
</form>
</div>


<div class="footer2">
<form action="recipe.jsp">
   <% 
      if(count2 != 0) {   
         for(int i = 1; i < count2 + 1; i++) { %>
            <input type="submit" class="button" name="pageNum_user" value="<%=i%>"/>
      <% } 
      } %>
</form>  
       
</div>
</div>
</html>