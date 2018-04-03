<%@page import="java.util.List"%>
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
		
		if(vo!=null){
			if(vo.getPassword().equals(request.getParameter("password"))){
				session.setAttribute("id",vo.getId());
				response.sendRedirect("seatmap.sku");
			}else{
				%>
				<script type="text/javascript">
				alert("해당아이디의 비밀번호가 틀렸습니다.");
				location.href="loginForm.sku";
				</script>
				<%
			}
		}else{
			%>
			<script type="text/javascript">
			if(confirm("아이디가 존재하지 않습니다. 회원가입하시겠습니까?")==true){
				location.href="memberJoin.sku";
				
			}else{
				location.href="loginForm.sku";
			}
			</script>
			<%
		}
	%>
</body>
</html>