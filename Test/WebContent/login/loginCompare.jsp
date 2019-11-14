<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="./db.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인</title>
</head>
<%	
	int count =0;
	String SignInId= request.getParameter("SignInId");
	String SignInPw= request.getParameter("SignInPw");
	String query = "select * from userinfo WHERE id =? and pw=?"; //db에서 unique key를 설정하는 게?  
			
	PreparedStatement pstmt =null;
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1,SignInId);
	pstmt.setString(2,SignInPw);
    rs = pstmt.executeQuery();
    
    if(rs.next()==false)
    	out.println("회원가입 정보가 없습니다.");
    else{
    	session.setAttribute("id", SignInId);
		session.setAttribute("pw", SignInPw);
		out.println("로그인에 성공하셨습니다");
    }
    //이 코드는 당연히 create로 해야 되는 코드네.. prepared로 하면 아예 비교를 안 해도 되잖아
    
    /*
    if(SignInId == null || SignInPw == null)
    	out.println("정보를 입력해주세요");

    if(rs.next()){ //true
    	String id = rs.getString("id");
    	String pw = rs.getString("pw");
    	
    	if(id.equals(SignInId) && pw.equals(SignInPw)){
    		session.setAttribute("id", SignInId);
    		session.setAttribute("pw", SignInPw);
    		out.println("로그인에 성공하셨습니다"); //ㅇ건 응답이라 말할 수 있는가?
    		out.println(session);
    	}
    	else if(id.equals(SignInId)){
    		out.println("비밀번호가 맞지 않습니다.");
    	}
    	else{
    		out.println("아이디와 비밀번호를 다시 확인해주세요.");
   		 }
    } */     
%>
<body>
</body>
</html>