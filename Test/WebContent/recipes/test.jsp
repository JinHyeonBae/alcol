<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	function Hello(){
		alert("그러하다");
	}
</script>
<body>



<%
	out.println("<input type=\"button\"" +"onclick=\"Hello()\""+">");
	

%>
</body>
</html>