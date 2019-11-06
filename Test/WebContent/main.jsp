<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./db.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
	String FindId= request.getParameter("FindContentId");
	String query = "select * from alcol WHERE kind LIKE '%"+FindId+"%'";
   
	stmt = conn.createStatement();
	rs = stmt.executeQuery(query); 
   
	while(rs.next()){
		String name = rs.getString("name");
		out.println(name);
	}
%>

<body>

</body>
</html>