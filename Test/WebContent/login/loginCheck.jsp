<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.util.Enumeration" %>  
<%@ include file="./loginCheck.jsp" %>  
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
   
   while(enum_app.hasMoreElements()){ //세션 불러오기
      sessionId = enum_app.nextElement().toString(); //키 
      sessionValue = session.getAttribute(sessionId).toString(); //값
      out.println(sessionId +" , " + sessionValue); 
      //아마 30분 후 아무 것도 안 뜰 것이다. 왜냐하면 세션이 삭제되었기 때문에
   }
   if(sessionId ==null || sessionPw == null){
      session.invalidate();
		%>
		<script>
			alert("30분 이상 아무런 응답이 없어서 자동 로그아웃 되셨습니다.");
		</script>		
	<%}
%>
</body>
</html>