<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ include file="./db.jsp"%>
    
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
	검색 : <input type ="text" size=20 name ="search">
	
	<select name="kind">
		<option value="%" selected>ALL</option>
		<option value="소주">소주</option>
		<option value="맥주">맥주</option>
		<option value="막걸리">막걸리</option>
		<option value="담금주">담금주</option>
		<option value="과실주">과실주</option>
		<option value="칵테일">칵테일</option>
	</select>
	
	<input type="submit" value="Find"><br>
</form>

<%
String query=null;
//이전 페이지의 url 값 받아오기
String PreUrl = request.getHeader("referer");
//dictionary.jsp에서 받은 값으로 검색한 결과 띄우고 싶은데 query 문이 하나밖에 안되네 ㅎ..우야지

//만약 전 페이지가 dictionary.jsp 였으면 거기서 입력한 값 받아와서 검색

	String kind = request.getParameter("kind");
	String search = request.getParameter("search");
	query = "select * from alcol WHERE name LIKE '%"+search+"%' and kind LIKE '%"+kind+"%'";


	stmt = conn.createStatement();
	rs = stmt.executeQuery(query); 

	//만약 검색결과가 없으면 검색결과가 없다고 메시지 창 뜨게 하고 싶었어...
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
			<td></td>
			
		</tr>
	<%
	//검색결과가 없을 때 
	if(!rs.next()){
	%>
		<script>
		alert("검색결과가 없습니다.");
	}
		</script>
	<%}
	else if(search =="")
	  {
	     %> 
	     <script>
	     alert("검색어를 입력하세요.");		
	     </script>
	 <%  }  

	while(rs.next()) { 
	
	%>
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
	</table>
<%} 
	 
	rs.close();
	stmt.close();
	conn.close();
%>
</body>
</html>