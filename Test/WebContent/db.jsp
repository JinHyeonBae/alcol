<%@ page import="java.sql.*"%> <%-- JDBC API 임포트 작업 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String driverName="com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/drink?serverTimezone=UTC&useSSL=false";
    String DBid = "root";
    String DBpw = "1234";
   
    try{
        //[1] JDBC 드라이버 로드
        Class.forName(driverName);
    }catch(ClassNotFoundException e){
        out.println("Where is your mysql jdbc driver?");
        e.printStackTrace();
        return;
    }
    
    //[2]데이타베이스 연결 
    Statement stmt = null;
    ResultSet rs = null;
    Connection conn = DriverManager.getConnection(url,DBid,DBpw);
    
    //[3]데이타베이스 연결 해제
%>
</body>
</html>