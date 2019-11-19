<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../db.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<table>
<% 
	int counting = 0;
	String query ="select * from recipe";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(query);

	int i=2; 
	while(rs.next()){ %>
	<tr>
	<th><img src ="<%= request.getContextPath()%>/image_recipe/<%=i%>.png">
	</th>
	<td ><% 	
		String alcolName = rs.getString("combineName"); //레시피에 등록된 술 이름
		out.println(alcolName); //
		out.println("\n");
		i++;
		if(i == 4) i =2;
	 %>
	</td>
	<td>
	<% 
		String alcolDecs = rs.getString("Decs"); //술 설명
		String alcolCom = rs.getString("combineAlcol"); //술 조합
		out.println("설명  "+"<br>" +alcolDecs + "<br><br>" + "조합  "+ "<br>"+ alcolCom);
	%>	
	</td>	
	<td><% 
	int count =0;
	String like = rs.getString("love"); //좋아요 횟수
	count = Integer.parseInt(like);
	%>
	<img src ="../image_recipe/like.png"><br> <!-- 버튼으로 만들어야 함 -->
	<% out.println("좋아요" + like+ "회");%>
	</td>
</tr>	
<%
counting++;

if(counting ==10)
	break;
}
%></table>
</body>
</html>