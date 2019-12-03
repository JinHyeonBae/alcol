<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="DataBase.DataBase"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link href="index.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>

<%
   DataBase db = new DataBase();
   
   StringBuffer sb_recipe = db.GetFindRanking("recipe");
   StringBuffer sb_drink = db.GetFindRanking("alcol");
%>
<script>
	function changeRank(){
		var left= document.getElementsByClassName('middle-left')[0]; 
		var right= document.getElementsByClassName('middle-right')[0];
		left.style.display="inline";
		right.style.display="inline";

}
</script>

<div class="header">
<form action="./login/logout.jsp">
	<input type="submit" value="logout" class="logout" style="float:right; width:100%"> 
</form>
<h1>ALCOL</h1>
</div>

<div class="middle_h">
	<form action="./search.jsp">
		<input type="text" size="70" style="height:30px; text-align:center" class="search"/>
		<input type="button" style="height:32px" class="search_img"/>
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

<form action="dictionary.jsp">&emsp;&emsp;&emsp;
	<input type="button" class="dictionary_button"> 
</form>

<form action="./recipe.jsp">&emsp;&emsp;&emsp;
	<input type="button" class="recipe_button">
</form>

<form action="recommend.jsp">
	<input type="button" class="recommend_button">
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