<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file = "./db.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내 정보</title>
</head>
<%
	class MyInfo{ //public class는 Test인가..?
			String InfoId = (String)session.getAttribute("id");
			void ChangeImage(){
			String Img = request.getParameter("Info");
			//사용자의 컴퓨터에서 창을 띄워야겠지..? 아니면 그냥 기본 이미지로 퉁 치고 내가 지정한 이미지로만 바꿀 수 있도록 해야겠다
			// Img.src = "";
		
		}
}
%>
<body>
<div id = Info>
	<img src =""> <!-- 이건 그냥 프로필. 프로필도 설정할 수 있게 하면 되겠네 --> 반갑습니다 <%=InfoId %> 님! 오늘도 좋은 하루 되세요. 
	<br><input type="button" value ="프로필 사진 변경하기" onclick="">
</div>		

</body>
</html>