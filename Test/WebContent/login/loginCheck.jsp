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
	String sessionId ="";
	String sessionPw ="";
	String sessionValue = "";
	Enumeration<?> enum_app = session.getAttributeNames(); //첫 번째 요소를 받아옴
	
	int i=0;
	while(enum_app.hasMoreElements()){
		i++;
		sessionId = enum_app.nextElement().toString(); //키 
		sessionValue = session.getAttribute(sessionId).toString(); //값
		out.println(sessionId +" , " + sessionValue);
	}
	
	if(sessionId ==null || sessionPw == null){
		session.removeAttribute(sessionId);
		session.removeAttribute(sessionPw);
		out.println("일정시간이 지나 로그인이 종료되었습니다. 다시 로그인 해주세요.");		
		//response.sendRedirect("./main.jsp");
	}
%>


</body>
</html>