<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="java.sql.*"%>
<%@ page import="DataBase.DataBase"%>
<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <title>title</title>
    <br><br><br>
    <center><font size = 15>추천</font></center>
    <br><br>
</head>
<body>
 

<style>
	table {
		font-family: arial, sans-serif;
		border-collapse: collapse;
		width: 100%;
	}

	td, th {
		border: 1px solid #dddddd;
		text-align: left;
		padding: 8px;
	}

</style>


<script>
    //체크박스는 1개 선택까지 가능합니다.
function checksweet(obj){
var chkbox = document.getElementsByName("sweet");
var chkCnt = 0;
for(var i=0;i<chkbox.length; i++){
    if(chkbox[i].checked){
        chkCnt++;
    }
}
if(chkCnt>1){
    alert("체크박스는 1개까지 선택가능합니다.");
    obj.checked = false;
    return false;
}
}
</script>

<script>
    //체크박스는 1개 선택까지 가능합니다.
function checktansan(obj){
var chkbox = document.getElementsByName("tansan");
var chkCnt = 0;
for(var i=0;i<chkbox.length; i++){
    if(chkbox[i].checked){
        chkCnt++;
    }
}
if(chkCnt>1){
    alert("체크박스는 1개까지 선택가능합니다.");
    obj.checked = false;
    return false;
}
}
</script>

<script>
    //체크박스는 1개 선택까지 가능합니다.
function checkalcohol(obj){
var chkbox = document.getElementsByName("alcohol");
var chkCnt = 0;
for(var i=0;i<chkbox.length; i++){
    if(chkbox[i].checked){
        chkCnt++;
    }
}
if(chkCnt>1){
    alert("체크박스는 1개까지 선택가능합니다.");
    obj.checked = false;
    return false;
}
}
</script>

<table>
<tr>
<td>당도</td>
<td>
<INPUT TYPE="checkbox" NAME="sweet" value="0" onClick="checksweet(this);"> 0
<INPUT TYPE="checkbox" NAME="sweet" value="1" onClick="checksweet(this);"> 1
<INPUT TYPE="checkbox" NAME="sweet" value="2" onClick="checksweet(this);"> 2
<INPUT TYPE="checkbox" NAME="sweet" value="3" onClick="checksweet(this);"> 3
<INPUT TYPE="checkbox" NAME="sweet" value="4" onClick="checksweet(this);"> 4
<INPUT TYPE="checkbox" NAME="sweet" value="5" onClick="checksweet(this);"> 5
</td>
</tr>
<tr>
<td>탄산</td>
<td>
<INPUT TYPE="checkbox" NAME="tansan" value="0" onClick="checktansan(this);"> 0
<INPUT TYPE="checkbox" NAME="tansan" value="1" onClick="checktansan(this);"> 1
<INPUT TYPE="checkbox" NAME="tansan" value="2" onClick="checktansan(this);"> 2
<INPUT TYPE="checkbox" NAME="tansan" value="3" onClick="checktansan(this);"> 3
<INPUT TYPE="checkbox" NAME="tansan" value="4" onClick="checktansan(this);"> 4
<INPUT TYPE="checkbox" NAME="tansan" value="5" onClick="checktansan(this);"> 5
</td>
</tr>
<tr>
<td>도수</td>
<td>
<INPUT TYPE="checkbox" NAME="alcohol" value="0" onClick="checkalcohol(this);"> 0~5
<INPUT TYPE="checkbox" NAME="alcohol" value="1" onClick="checkalcohol(this);"> 5~10
<INPUT TYPE="checkbox" NAME="alcohol" value="2" onClick="checkalcohol(this);"> 10~15
<INPUT TYPE="checkbox" NAME="alcohol" value="3" onClick="checkalcohol(this);"> 15~20
<INPUT TYPE="checkbox" NAME="alcohol" value="4" onClick="checkalcohol(this);"> 20~25
<INPUT TYPE="checkbox" NAME="alcohol" value="5" onClick="checkalcohol(this);"> 25~30
<INPUT TYPE="checkbox" NAME="alcohol" value="6" onClick="checkalcohol(this);"> 30~35
<INPUT TYPE="checkbox" NAME="alcohol" value="7" onClick="checkalcohol(this);"> 35~40
</td>
</tr>

</table>

<br><br><br><br>

<table>

</table>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.js"></script>
  </body>
</html>