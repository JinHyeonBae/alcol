<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./db.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="main.jsp" method = "get">
	검색 : <input type ="text" size =20 name ="FindContentId">
	<input type="submit" value="Find"><br>
</form>
<select name="kind">
		<option value="1" selected>맥주</option>
		<option value="2">소주</option>
		<option value="3">막걸리</option>
</select><br>
<%
	String FindId= request.getParameter("FindContentId");
	String query = "select * from alcol WHERE kind LIKE '%"+FindId+"%'";
   
	stmt = conn.createStatement();
	rs = stmt.executeQuery(query); 
   
	while(rs.next()){
		out.println(rs.getString("name") + "<br>" +
				rs.getInt("ml") + ' ' +
				rs.getInt("price") + ' ' +
				rs.getFloat("alcohol") + ' ' +
				rs.getInt("sweet") + ' ' +
				rs.getInt("tansan") + ' ' +
				rs.getInt("calories"));
		out.println("<br>");
	}
%>
</body>
</html>