<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="DataBase.DataBase"%>
<!DOCTYPE html>

<html>

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
       <link href="./css/recommend.css" rel="stylesheet" type="text/css">
    <title>추천 페이지</title>
</head>
<%
   DataBase db = new DataBase();

   int sweet = 0;
   if(request.getParameter("sweet") != null)
      sweet= Integer.parseInt(request.getParameter("sweet"));
   int tansan = 0;
   if(request.getParameter("tansan") != null)
      tansan = Integer.parseInt(request.getParameter("tansan"));
   int alcohol = 0;
   if(request.getParameter("alcohol") != null)
      alcohol = Integer.parseInt(request.getParameter("alcohol"));
   
   StringBuffer sb = db.GetRecommend(sweet, tansan, alcohol);


%>


    <div class="frame">
   <div class="header">
   <h1>Recommend</h1>
   </div>


<div class="container">
<form name="Recommendform" action="recommend.jsp">
<div id="table">
<span class="row">
<span class="cell col1">당도(level)</span>
<span class="cell col2">
<INPUT id ="0" TYPE="radio" NAME="sweet" value="0" checked="checked"> 0 
<INPUT id ="1" TYPE="radio" NAME="sweet" value="1" > 1
<INPUT id ="2" TYPE="radio" NAME="sweet" value="2" > 2
<INPUT id ="3" TYPE="radio" NAME="sweet" value="3" > 3
<INPUT id ="4" TYPE="radio" NAME="sweet" value="4" > 4
<INPUT id ="5" TYPE="radio" NAME="sweet" value="5" > 5
</span>
</span>

<span class="row">
<span class="cell col1">탄산(level)</span>
<span class="cell col2">
<INPUT id ="0" TYPE="radio" NAME="tansan" value="0" checked="checked"> 0 
<INPUT id ="1" TYPE="radio" NAME="tansan" value="1" > 1
<INPUT id ="2" TYPE="radio" NAME="tansan" value="2" > 2
<INPUT id ="3" TYPE="radio" NAME="tansan" value="3" > 3
<INPUT id ="4" TYPE="radio" NAME="tansan" value="4" > 4
<INPUT id ="5" TYPE="radio" NAME="tansan" value="5" > 5
</span>
</span>

<span class="row">
<span class="cell col1">도수(도)</span>
<span class="cell col2">
<INPUT id ="0" TYPE="radio" NAME="alcohol" value="0" checked="checked" > 0 ~ 5
<INPUT id ="1" TYPE="radio" NAME="alcohol" value="1" > 5 ~ 10
<INPUT id ="2" TYPE="radio" NAME="alcohol" value="2" > 10 ~ 15
<INPUT id ="3" TYPE="radio" NAME="alcohol" value="3" > 15 ~ 20
<INPUT id ="4" TYPE="radio" NAME="alcohol" value="4" > 20 ~ 25
<INPUT id ="5" TYPE="radio" NAME="alcohol" value="5" > 25 ~ 30
<INPUT id ="6" TYPE="radio" NAME="alcohol" value="6" > 30 ~ 35
<INPUT id ="7" TYPE="radio" NAME="alcohol" value="7" > 35 ~ 40
</span>
</span>

</div>
</div>
<div class="middle">
<input type = "submit" class="button" value="추천 ">
</div>
</form>


<div class="footer">

<div id="table">
<span class="row">   
<span class="cell col1">이름</span>
<span class="cell col1">당도(level)</span>
<span class="cell col1">탄산(level)</span>
<span class="cell col1">도수(level)</span>
<span class="cell col1">오차범위</span>
</span>
</div>

      <div id="table"><%= sb %></div>
   
   
</div>
</div>
</html>