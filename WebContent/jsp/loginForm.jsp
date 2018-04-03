<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/webterm1/css/common.css">
<title>로그인폼</title>
<style>
a:link {text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:active {text-decoration: none; color: black;}
a:hover {text-decoration: underline; color: black;}

input:focus {
	border:2px #0014FA solid;
}

</style>
</head>
<body>
 <%
 	
	String id=null;
	id=(String)request.getAttribute("id");
	if(id!=null){
		%>
		<h1>찾는 아이디는 <%=id %>입니다.</h1>
		<%
	}
	String passmsg=null;
	passmsg=(String)request.getAttribute("passmsg");
	if(passmsg!=null){
		%>
		<h1><%=passmsg %></h1>
		<%
	}
%> 
<form action="login.sku">
<p style="font-size: 100px;">PCCAFE에 오신것을 환영합니다.</p>
<table class="div_2" >
 <tr>
  <td>ID : <input type="text" name="id" size="25" style="color:#FFFFFF; height:50%; background-color:#4C4C4C"></td>
 </tr>
 <tr>
  <td>PW : <input type="password" name="password" size="25"  style="color:#FFFFFF; height:50%; background-color:#4C4C4C"></td>
 </tr>
 <tr class="div_3" >
  <td><a href="searchIdForm.sku">아이디찾기 </a>/
  <a href="searchPassForm.sku"> 비밀번호 찾기  </a>/
  <a href="memberJoin.sku"> 회원가입</a></td>
 </tr>
 <tr>
  <td><input type="submit" value="로그인" style="font:20pt 고딕; color:#FFFFFF; background-image: url('images/bluestar.jpg'); background-repeat:no-repeat;background-size:100% 100%; width:280px; height:75px" ></td>
 </tr>
</table>
</form>
</body>
</html>