<%@page import="kr.ac.skuniver.member.MemberVO"%>
<%@page import="kr.ac.skuniver.member.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/webterm1/css/common.css">
<style type="text/css">
td{
 border-left: 1px solid gray;
 margin: 0px;
}
a:link {text-decoration: none; color: #1266FF;}
a:visited {text-decoration: none; color: #1266FF;}
a:active {text-decoration: none; color: #1266FF;}
a:hover {text-decoration: underline; color: #1266FF;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="font-family:맑은 고딕";>
<form action="SearchMember.sku"><div align="left">
<button type="button" style="float:left; background-color:#A0D9E2"; onclick="location.href='seat.sku'">돌아가기</button><br><br><br>
 찾는 아이디입력 : <input type="text" name="memberid">
 <input type="submit" style="background-color:#A0D9E2"; value="찾기">
 <button type="button" style="background-color:#A0D9E2"; onclick="location.href='memberlist.sku'">전체회원목록</button></div>
 <table width="600" cellpadding="5" cellspacing="0" bgcolor="#FFFFFF" style="border-collapse:collapse; border:1px gray solid;">
  <tr style= "background-color:#A0D9E2; border-bottom: 1px solid gray;"><td>이름</td><td>아이디</td><td>비밀번호</td><td>생년월일</td><td>핸드폰번호</td><td>수정</td><td>삭제</td></tr>
<%
	String msg=(String)request.getAttribute("msg");
	MemberVO vo1=(MemberVO)request.getAttribute("getmemberlist");
	List<MemberVO> memberlist=(List)request.getAttribute("memberlist");
	
	if(vo1==null&&msg==null){
		for(MemberVO vo:memberlist)
		{	
			%>
			<tr>
				<td><%=vo.getName()%></td>
				<td><%=vo.getId()%></td>
				<td><%=vo.getPassword()%></td>
				<td><%=vo.getBirth()%></td>
				<td><%=vo.getPhone()%></td>
				<td><a href="update.sku?id=<%=vo.getId()%>">수정</a></td>
				<td><a href="delete.sku?id=<%=vo.getId()%>">삭제</a></td><br>
			</tr>
			<%
			
		}
	}else{
		if(msg==null){
			%>
			<tr>
				<td><%=vo1.getName()%></td>
				<td><%=vo1.getId()%></td>
				<td><%=vo1.getPassword()%></td>
				<td><%=vo1.getBirth()%></td>
				<td><%=vo1.getPhone()%></td>
				<td><a href="update.sku?id=<%=vo1.getId()%>">수정</a></td>
				<td><a href="delete.sku?id=<%=vo1.getId()%>">삭제</a></td><br>
			</tr>
			<%
		}else if(vo1==null)
		{
			%>
			<h1><%=msg%></h1>
			<%
		}
	}


%>

</table>
</form>
</body>
</html>