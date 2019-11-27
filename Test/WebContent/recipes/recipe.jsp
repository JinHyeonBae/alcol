<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="DataBase.DataBase"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>레시피</title>
</head>
<!-- <script>
    function addHeart(e){ //좋아요 버튼 자체를 가져왔다.
      var location_div1 = document.getElementById("top");
      var location_div2 = document.getElementById("middle";)
      var location_btn = document.getElementById(e.getAttribute('id')).getAttribute('id');
   
   }
</script> -->
<body>

<div id="top">
<h1>레시피</h1>
   <form action="../login/logout.jsp">
      <input type="submit" value="로그아웃" />
   </form>
   <input type="text" size ="20" /> <input type="button" value ="검색"/>   
</div><br><br><br>
<%  DataBase db = new DataBase(); %>
<div id="middle">
<form action="recipe.jsp">
   <%   
      
      int count =0;
      count = db.GetMaxContent("recipe", "", 5);
      String PageNum = request.getParameter("pageNum");
      if(PageNum == null) PageNum = "1"; //자꾸 null exception 뜨길래 넣은 조건문임
      DataBase DB = new DataBase();
      StringBuffer print_recipe = DB.ShowRecipe(PageNum); 
   %>
<table>      
   <%= print_recipe %>
</table>
   <% 
      if(count != 0) {   
         for(int i = 1; i < count + 1; i++) { %>
            <input type="submit" name="pageNum" value="<%=i%>">
      <% } //페이징 1) 2) .. 버튼
      } %>

</form>
</div><br><br><br>

<div id="bottom">
<h1>내가 만든 레시피</h1>
   <form action="recipe_writing.html">
      <input type="submit" value ="글쓰기"/>
   </form>
<form action="recipe.jsp">
<% 
   int count2 =0;
   count2 = db.GetMaxContent("myrecipe", "", 5); 
   String PNum_user = request.getParameter("pageNum_user");
   if(PNum_user == null) PNum_user = "1"; //자꾸 null exception 뜨길래 넣은 조건문임
   StringBuffer userRecipe = DB.UserRecipe(PNum_user); 
   //페이징하는 함수임
%>
<table>      
   <%= userRecipe %>
</table>
   <% 
      if(count2 != 0) {   
         for(int i = 1; i < count2 + 1; i++) { %>
            <input type="submit" name="pageNum_user" value="<%=i%>"/>
      <% } 
      } %>
</form>         
</div>
</body>
</html>