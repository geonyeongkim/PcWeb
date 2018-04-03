<%@page import="kr.ac.skuniver.member.MemberVO"%>
<%@page import="kr.ac.skuniver.member.MemberDAO"%>
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
	MemberVO vo=(MemberVO)request.getAttribute("vo");
%>
<h1>회원 정보 수정</h1>
 <form action="update2.sku">
 <table align="center" bgcolor="#A0D9E2">
  <tr><td>아이디:</td><td><input type="text" name="id" value="<%=vo.getId()%>" readonly="readonly" ></td></tr>
  <tr><td>이름:</td><td><input type="text" name="name" value="<%=vo.getName()%>"></td></tr>
  <tr><td>비밀번호:</td><td><input type="text" name="password" value="<%=vo.getPassword()%>"></td></tr>
  <tr><td>생년월일: </td><td><input type="text" name="birth" value="<%=vo.getBirth()%>"></td></tr>
  <tr><td>휴대폰번호:</td><td><input type="text" name="phone" value="<%=vo.getPhone()%>"></td></tr>

 </table><br>
 <input type="submit" value="수정" style="background-color:#A0D9E2";>
 <button type="button" style="background-color:#A0D9E2"; onclick="location.href='memberlist.sku'">취소</button>
 </form>
</body>
</html>