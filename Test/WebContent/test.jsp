<%@page import="Drink.DrinkContent"%>
<%@page import="UserInfo.UserLogin"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="Drink.DrinkPaging"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

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

    tr:nth-child(even) {
        background-color: #dddddd;
    }
</style>

</head>
<body>
<%
	DrinkContent dc = new DrinkContent();
	DrinkPaging dp = dc.getRecipeContent("myrecipe", "%", "1", 5);
	
	UserLogin userlogin = new UserLogin(request);
	
	//dc.WriteRecipe("myrecipe", "test", "test", "test", 0, "test");
%>

	<%= session.getAttribute("id") %>

	<table>
        <tr>
            <td>�̸�</td>
            <td>����</td>
            <td>����</td>
            <td>��ư</td>
            <td>���ƿ�</td>
        </tr>
        <%= dp.getSb() %>
    </table>
</body>
</html>