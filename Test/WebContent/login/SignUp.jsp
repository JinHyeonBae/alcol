<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="DataBase.DataBase"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<% 	

	String id = (String)request.getParameter("SignUpId");
	String pw = (String)request.getParameter("SignUpPw");
	String email = (String)request.getParameter("email");
	String phone = (String)request.getParameter("phone1") + (String)request.getParameter("phone2") + (String)request.getParameter("phone3");  
	int result;
	
	if(id =="" || pw =="" || email =="" || phone ==""){ %>
	<script>alert("정보를 정확히 입력해주세요!"); 
	location.href= "SignUp.html"
	</script>
<% } 

	DataBase NewUser = new DataBase(); 
	result = NewUser.SignUp(id, pw, email,phone);
	%>

		<% if(result == 0){ %> <!-- executeUpdate문은 영향을 준 컬럼 수를 반환하므로 0이면 데이터베이스에 추가 못 했다는 거(=회원가입 실패)-->
		<script>
			alert("중복된 아이디입니다. 다시 입력해주세요");
			location.href = "SignUp.html";
		</script> 
	<% } else { %>
		<script>
			alert('회원가입이 완료되었습니다.');
			location.href="login.html";
		</script>
	<% } %>

</body>
</html>