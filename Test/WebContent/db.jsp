<%@ page import="java.sql.*"%> <%-- JDBC API 임포트 작업 --%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");

   String url = "jdbc:oracle:thin:@127.0.0.1:1521";
   Connection conn = DriverManager.getConnection(url,"test","1234");
   Statement stmt = conn.createStatement();
   ResultSet rs;
    
 
    
%>
</body>
</html>