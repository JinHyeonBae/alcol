<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="DataBase.DataBase"%>
<%@ include file="./recipe.jsp" %>
<%@ include file="../login/loginCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<style>
 	.love_icon{
 		background : url("../image_recipe/like.png");
 	}
</style>

<script>
	var Heart=0;
	
	function addHeart(){
		Heart++;
		System.out.println("들어옴");
		
		if(isLogin == false)
			alert("로그인 후 이용해주세요!");
		else{
			alert("들어왔어여!");
			DataBase conn = new DataBase();
			conn.HeartIncrease(Heart);
		}
	}
</script>

<body>
<%	
	StringBuffer recipe = new StringBuffer(); //stringBuffer로 recipe의 값을 넘겨준다.
	DataBase DB = new DataBase(); //데이터베이스 파일에 접근하기 위한 객체 생성.	
	
	recipe = DB.ShowRecipe(1);
%>
	
<table>
<%= recipe %> <!-- like 테이블 하나 만들어서 id값만 저장하는 테이블을 만드는 거 그걸 계속 더하고 onclick 시  꺼내와서 비교-->
<!-- 아니면 id에 love 관련 컬럼 만들어서 클릭한 게시물 1,2,3 값 가져와서 입력 그리고 다시 들고와서 ㅇㅇ.. 게시물마다의 column읜ㅇ;ㅡㄹ;ㄴㅇㄹ -->
</table>


</body>
</html>