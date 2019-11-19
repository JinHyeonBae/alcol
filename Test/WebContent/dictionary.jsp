<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ include file="./db.jsp"%>
    
<!DOCTYPE html>
<html>
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


<script>
//검색어 입력 안했으면 안 입력하라하고 안넘어가게 하고싶은데 넘어가네 ㅎ
function check(){
	//검색창에 아무 글귀도 안 치고 검색버튼 누르면
	search = document.Searchform.elements[0].value;
	  if(search =="")
	  {
	      alert("검색어를 입력하세요.");	
	  }  
	  else{
		// window.open("http://localhost:8001/Test/search.jsp","search.jsp","");
		location.href = "http://localhost:8001/Test/search.jsp";
		 //response.sendRedirect("search.jsp");
	  }
	
}
</script>

    <br><br><br><br>
    
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    
<center><b><font class = "btn btn-warning" size ="15">술 사전</font></b></center>
</head>
<br>

<body>
<form name="Searchform" action="search.jsp" method = "get">
<center>
        <input class = "btn btn-info" type="text"  size = "50"  name="search" placeholder="검색">
        <select name="kind">
		<option value="%" selected>ALL</option>
		<option value="소주">소주</option>
		<option value="맥주">맥주</option>
		<option value="막걸리">막걸리</option>
		<option value="담금주">담금주</option>
		<option value="과실주">과실주</option>
		<option value="칵테일">칵테일</option>
	</select>
	<input type="button" class = "btn btn-danger" value="검색" onClick="check()"><br>
</center>
</form>

<br><br>

<%
	stmt = conn.createStatement();
	String query = "SELECT * from alcol";
	rs=stmt.executeQuery(query);
	
%> 
	<table class = "btn btn-success">
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
			<td></td>
		</tr>
	<%while(rs.next()) { %>
		<tr>
			<td><Image src="<%= rs.getString("url") %>" width = "150" height="150"></td>
			<td><%= rs.getString("kind") %></td>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getString("volume") %></td>
			<td><%= rs.getString("price") %></td>		
			<td><%= rs.getString("alcohol") %></td>
			<td><%= rs.getString("sweet") %></td>
			<td><%= rs.getString("tansan") %></td>
			<td><%= rs.getString("calories") %></td>
			<td><Image src="<%= rs.getString("likeimage") %>" width = "50" height="50"></td>
			<td><%= rs.getString("love") %></td>
			
		</tr>
<%} %>
	</table>
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.js"></script>
</body>
</html>