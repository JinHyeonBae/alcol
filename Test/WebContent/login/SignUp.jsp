<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../db.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<% 	
	int count = 0;
	PreparedStatement pstmt =null;
	String id = (String)request.getParameter("SignUpId");
	String pw = (String)request.getParameter("SignUpPw");
	String email = (String)request.getParameter("email");
	String phone = (String)request.getParameter("phone1") + (String)request.getParameter("phone2") + (String)request.getParameter("phone3");  	
	
	String query = "SELECT * FROM userinfo";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(query);
	
	if(rs. next()){ //이 의미 무엇이야..?
		String idInDB = rs.getString("id");
		String pwInDB = rs.getString("pw");
		
		if(idInDB == id) 
			out.println("아이디가 중복되었습니다.");

	}
	else{
		query = "INSERT INTO userinfo VALUES(?,?,?,?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1,id);
		pstmt.setString(2,pw);
		pstmt.setString(3,email);
		pstmt.setString(4,phone);
	
 	    count = pstmt.executeUpdate(); 
    
    	if(count != 0)
    	out.println("회원가입에 성공하셨습니다!");
}
%>
</body>
</html>