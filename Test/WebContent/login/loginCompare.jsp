<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../db.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인</title>
</head>
<%   
   int count = 0;
   String SignInId= request.getParameter("SignInId");
   String SignInPw= request.getParameter("SignInPw");
   String query = "select * from userinfo"; //db에서 unique key를 설정하는 게?  
   
   stmt = conn.createStatement();
    rs = stmt.executeQuery(query);
               
   if(SignInId =="" || SignInPw == "")
      out.println("정보를 입력해주세요");
   
   if(rs.next()){      
      String id = rs.getString("id");
      String pw = rs.getString("pw");
      
       if(id.equals(SignInId) && pw.equals(SignInPw)){
          session.setAttribute("id", SignInId);
         session.setAttribute("pw", SignInPw);
         out.println("로그인에 성공하셨습니다"); //다시 main화면으로 돌아가기
         response.sendRedirect("../recipes/recipe.jsp");
      }   
       else
          out.println("회원가입 정보가 없습니다.");
       
   }
   rs.close();

    conn.close();
%>
<body>
</body>
</html>