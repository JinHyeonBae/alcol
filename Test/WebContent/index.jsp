<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="Drink.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="index.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>

<%
   DrinkContent db = new DrinkContent();
   
   StringBuffer sb_recipe = db.getRanking("recipe");
   StringBuffer sb_drink = db.getRanking("alcol");
%>
<script>
	function changeRank(){
		var left= document.getElementsByClassName('middle-left')[0]; 
		var right= document.getElementsByClassName('middle-right')[0];
		if(left.style.display == "none") {
			left.style.display="inline";
			right.style.display="inline";
		}
		else
		{
			left.style.display="none";
        	right.style.display="none";
		}
}
</script>

<div class="header">
<form action="./login/logout.jsp">
   <input type="submit" value="logout" class="logout" style="float:right; width:100%"> 
</form>
<h1>ALCOL</h1>
</div>

<div class="middle_h">
   <form action="search.jsp">
		<input type="hidden" name="pageNum_drink" value="1">
		<input type="hidden" name="FindkindId" value="%">
		<input type="text" name="FindContentId" size="70" style="height:30px; text-align:center" class="search"/>
		<button type="submit" style="height:32px" class="search_img"></button>
   </form><br><br>
   <input type="button" value="인기 순위" onclick="changeRank();" 
      style="color:#C2DABC; background-color:white; border:0; font-size:20px"/>
<br><br>

<div class="middle-left">
 <table class="tb1" style="left: 30px">
      <tr>
         <th>이름(레시피)</th>
         <th>좋아요</th>
      </tr>
      <%= sb_recipe %>
   </table>
</div>

<form action="search.jsp">&emsp;&emsp;&emsp;
   <input type="hidden" name="FindContentId" value="%">
   <input type="hidden" name="FindkindId" value="%">
   <input type="hidden" name="pageNum_drink" value="1">
   <input type="submit" value="" class="dictionary_button"> 
</form>

<form action="recipes/recipe.jsp">&emsp;&emsp;&emsp;
   <input type="submit" value="" class="recipe_button">
</form>

<form action="recommend.jsp">
   <input type="submit" value="" class="recommend_button">
</form>

<div class="middle-right" style="display:none">
<table class="tb2" style="float:right; left: 85%">
      <tr>
         <th>이름(술 사전)</th>
         <th>좋아요</th>
      </tr>
      <%= sb_drink %>
   </table>
</div>

   
</div>

</body>
</html>