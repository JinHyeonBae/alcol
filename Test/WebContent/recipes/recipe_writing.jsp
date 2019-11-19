<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="../db.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>입력하기</title>
</head>
<script>
 function addUserRecipe(){
	 alert("좋은 의견 감사합니다!");
	 form.submit();	 
}
</script>
<body>
	<form action="addRecipe.jsp">
		입력하고 싶은 조합을 입력해주세요! : <input type="text" name="userAlcol"><br>
		조합에 대한 설명을 해주세요!<textarea col="40" row="30" name="user_recipe">
		</textarea>
		<input type="submit" value="글쓰기 완료" onclick ="addUserRecipe()">
	</form>
</body>
</html>