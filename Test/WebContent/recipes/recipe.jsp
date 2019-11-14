<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../db.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레시피</title>
<style>
	
	table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  #top{
    vertical-align: middle; 
  }
  #search_button{
  	background: url("../image_recipe/search_img.png") no repeat;
  }
</style>
</head>
<body>
<div id ="top">
<h1>레시피</h1>
<form action="" method="get">
	<input type ="text" size = "70" name="search_recipe"><input type="button" id="search_button">
</form>
</div><br><br><br><br>
<div id="middle">
<table>
<% 
	String query ="select * from recipe";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(query);

	int i=2; 
	while(rs.next()){ %>
	<tr>
	<th><img src ="<%= request.getContextPath()%>/image_recipe/<%=i%>.png">
	</th>
		<td ><% 	
			String alcolName = rs.getString("combineName");
			out.println(alcolName);
			out.println("\n");
			i++;
			if(i == 4) i =2;
		 %>
		</td>
		<td>
		<% 
			String alcolDecs = rs.getString("Decs");
			String alcolCom = rs.getString("combinealcol");
			out.println(alcolDecs + "<br>" + alcolCom);
		%>	
		</td>	
		<td><% 
		int count =0;
		String like = rs.getString("like");
		count = Integer.parseInt(like);
		%>
		<img src ="../image_recipe/like.png"><br> <!-- 버튼으로 만들어야 함 -->
		<% out.println("좋아요" + like+ "회");%>
		</td>
	</tr>	
	<%
	}
%>	
</table>
</div><br><br><br>
<div id="bottom">
<%
	query ="select * from myrecipe";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(query); %>
<table>	<% 
	while(rs.next()){	%>
	<tr>
		<td><% 
			String id = rs.getString("id");
			out.println(id);
			%>
		</td>	
		<td><% 
		String combi = rs.getString("combine");
		out.println(combi); %>
		</td>
	</tr>	
	<%}
%></table>
</div>
</body>
</html>