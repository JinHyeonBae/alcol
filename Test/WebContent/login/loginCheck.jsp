<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>  
 <%@ page import = "java.util.*" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>로그인 여부</title>
</head>
<body>

<%
	String sessionId =(String)session.getAttribute("id");
	boolean isLogin=false;
	
	if(sessionId !=null){
		isLogin=true; 
	} 
	else{ 
		session.invalidate(); %>
		<script>
			alert("일정 시간동안 응답이 없어 로그아웃 되었습니다. 다시 로그인해주세요");
			location.href="login.html";
		</script>	
	<% }%>		
</body>
</html>