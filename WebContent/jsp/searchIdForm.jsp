<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/webterm1/css/common.css">
<title>Insert title here</title>
</head>
<body>
<%
	String msg=null;
	msg=(String)request.getAttribute("msg");
	if(msg!=null){
		%>
		<h1><%=msg %></h1>
		<%
	}
%> 
<form action="SearchId.sku">
<p style="font-size: 50px;">ID 찾기</p>
<table class="div_2" >
<tr>
<td>이름 : <input type="text" name="name"></td>
</tr>
<tr>
<td>생년월일 : <input type="text" name="birth"></td>
</tr>
<tr>
<td><input type="submit" class="common_btn" value="검색">

<button type="button" class="common_btn" onclick="location.href='loginForm.sku'">취소</button>  
</td>
</tr>
</table>
</form>
</body>
</html>