<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="Drink.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="recipe.css" rel="stylesheet" type="text/css">
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
   <form action="../recipes/recipe.jsp">
   <input type="text" size ="20"  name = "search"/>
   <input type="submit" class="button" value ="search"/>
   </form>   
   

   
   <form action="../index.jsp">
   		<input type="submit" class="testasd" value =""/>
   </form>   
</div>



<div class="content1">

   <%   
      DrinkContent db = new DrinkContent();
      int count = 0;
      String PageNum = request.getParameter("pageNum");
      String search = request.getParameter("search");
      if(search == null) search = "";
      if(PageNum == null) PageNum = "1"; //자꾸 null exception 뜨길래 넣은 조건문임
      DrinkPaging print_recipe = db.getRecipeContent("recipe", search, PageNum, 5); 
   %>
   <div id="table">
         <div class="row">    
         <span class="cell col2">이름</span>   
         <span class="cell col3">설명</span>      
         <span class="cell col4">조합 </span>   
         <span class="cell col5">좋아요</span> 
         <span class="cell col6">좋아요</span> 
         <span class="cell col7">아이디</span>
         <span class="cell col8">삭제</span>
         
         </div>
   <%= print_recipe.getSb() %>
</div>
</div>
<div class="footer1">
<form action="recipe.jsp">
   <% 
    count = print_recipe.getCount();
      if(count != 0) {   
         for(int i = 1; i < count + 1; i++) { %>
            <input type="submit" class="button" name="pageNum" value="<%=i%>">
      <% } //페이징 1) 2) .. 버튼
      } %>

</form>
</div>


<div class="header2">
<h1>내가 만든 레시피</h1>
   <form action="write_recipe.html">
      <input type="submit" class="button" value ="글쓰기"/>
   </form>
   </div>
   
   <div class="content2">
<form action="recipe.jsp">
<% 
   String PNum_user = request.getParameter("pageNum_user");
   if(PNum_user == null) PNum_user = "1"; //자꾸 null exception 뜨길래 넣은 조건문임
   DrinkPaging userRecipe = db.getRecipeContent("myrecipe", search, PNum_user, 5);
   //페이징하는 함수임
%>
   <div id="table">
         <div class="row">    
         <span class="cell col2">이름</span>   
         <span class="cell col3">설명</span>      
         <span class="cell col4">조합 </span>   
         <span class="cell col5">좋아요</span> 
         <span class="cell col6">좋아요</span> 
         <span class="cell col7">아이디</span>
         <span class="cell col8">삭제</span>
         </div>
   </div>
<div id="table">      
   <%= userRecipe.getSb() %>
</div>
</form>
</div>


<div class="footer2">
<form action="recipe.jsp">
   <% 
   count = userRecipe.getCount();
      if(count != 0) {   
         for(int i = 1; i < count + 1; i++) { %>
            <input type="submit" class="button" name="pageNum_user" value="<%=i%>"/>
      <% } 
      } %>
</form>  
       
</div>
</div>
</html>