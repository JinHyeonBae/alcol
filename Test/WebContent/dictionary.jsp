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
	      history.go(-1);

	  }  
	  else
		  window.open("http://localhost:8001/search.jsp","search.jsp","");
	
}
</script>

    <br><br><br><br>
    
<head><center><b><font size ="15">술 사전</font></b></center></head>
<br>
<form name="Searchform" action="search.jsp" method = "get">
<center>
        <input type="text"  size = "50"  name="search" placeholder="검색">
        <select name="kind">
		<option value="%" selected>ALL</option>
		<option value="소주">소주</option>
		<option value="맥주">맥주</option>
		<option value="막걸리">막걸리</option>
		<option value="담금주">담금주</option>
		<option value="과실주">과실주</option>
		<option value="칵테일">칵테일</option>
	</select>
	<input type="submit" value="검색" onClick="check()"><br>
</center>
</form>

<br><br>

<%
	stmt = conn.createStatement();
	String query = "SELECT * from alcol";
	rs=stmt.executeQuery(query);
	
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
	<%while(rs.next()) { %>
		<tr>
			<td><Image src="<%= rs.getString("url") %>" width = "150" height="150"></td>
			<td><%= rs.getString("kind") %></td>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getString("ml") %></td>
			<td><%= rs.getString("price") %></td>		
			<td><%= rs.getString("alcohol") %></td>
			<td><%= rs.getString("sweet") %></td>
			<td><%= rs.getString("tansan") %></td>
			<td><%= rs.getString("calories") %></td>
			<td><Image src="<%= rs.getString("likeimage") %>" width = "50" height="50"></td>
			<td><%= rs.getString("like") %></td>
			
		</tr>
<%} %>
	</table>


</html>