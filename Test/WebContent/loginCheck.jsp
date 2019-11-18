<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.util.Enumeration" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%
String masterID = (String)session.getAttribute("id");
boolean isLogin = false;
if (masterID != null) {
  isLogin = true; 
}
%>


</body>
</html>