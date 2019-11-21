<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>레시피</title>
</head>
<body>
	
	<%
	
	int count = 0;
	String combName = request.getParameter("userAlcol"); //유저가 입력한 알콜 조합
	String content = request.getParameter("user_recipe"); //유저가 입력한 알콜 설명
	String id = (String)session.getAttribute("id"); // 유저의 세션에 있는 유저의 아이디
	String query="INSERT INTO myrecipe(id,combine,love,UserDecs) VALUES(?,?,?,?)";

	PreparedStatement pstmt =null;
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1,id);
	pstmt.setString(2,combName);
	pstmt.setInt(3,0); //좋아요 초기값 0 설정
	pstmt.setString(4,content);
	count = pstmt.executeUpdate();
	
	response.sendRedirect("recipe.jsp"); //끝난 후 recipe.jsp로 이동
	
	conn.close();
	%>
	

</body>
</html>