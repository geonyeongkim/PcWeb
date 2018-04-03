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
	List<MemberVO> memberlist=(List<MemberVO>)request.getAttribute("memberlist");
	MemberDAO dao=(MemberDAO)request.getAttribute("dao");
	MemberVO vo=(MemberVO)request.getAttribute("vo");
	String birth=request.getParameter("birth");
	
	for(MemberVO vo1 : memberlist){
		if(vo1.getId().equals(request.getParameter("id"))){
			%>
			<script type="text/javascript">
			alert("사용중인 ID입니다.");
			location.href="memberJoin.sku";
			</script>
			<%	
			return;
		}
	}
	if(request.getParameter("id").equals("admin")||request.getParameter("password").equals("admin")){
		%>
		<script type="text/javascript">
		alert("가입불가한 ID입니다.");
		location.href="memberJoin.sku";
		</script>
		<%	
		return;
	}
	if((Integer.parseInt(birth)/10000000)<=0){
		%>
		<script type="text/javascript">
		alert("생년월일 8자리 작성하시오.");
		location.href="memberJoin.sku";
		</script>
		<%
	}else{
		vo.setId(request.getParameter("id"));
		vo.setName(request.getParameter("name"));
		vo.setPassword(request.getParameter("password"));
		vo.setBirth(birth);
		vo.setPhone(request.getParameter("phone"));
		vo.setSeatnumber("50");
		dao.insertMember(vo);
		response.sendRedirect("loginForm.sku");
	}
%>
</body>
</html>

