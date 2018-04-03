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
<style type="text/css">
#start{
	width:150px; 
	height:150px; 
	background-image:url(/webterm1/images/start.jpg);
	background-size:cover;
}
#a{
	font-size:40px;
	font-weight:900;
}
</style>
<%
	MemberVO vo=(MemberVO)request.getAttribute("vo");
%>
<script type="text/javascript">

var time = <%=vo.getTime()%>;   
var money = 0;
var addtime = 0;
function start(){
	location.href="addtime.sku?time="+time;
}
function time1() {
 time+=60;
 addtime++;
 money += 1000;
    target.innerHTML = addtime;
    target.innerHTML += " 시간, " + money+" 원";
}
function time2() {
	 time+=120;
	 addtime+=2;
	 money += 2000;
	    target.innerHTML = addtime;
	    target.innerHTML += " 시간, " + money+" 원";
	}
function time3() {
 time+=360;
 addtime+=6;
 money += 5000;
    target.innerHTML = addtime;
    target.innerHTML += " 시간, " + money+" 원";
}
function time4() {
 time+=780;
 addtime+=13;
 money += 10000;
    target.innerHTML = addtime;
    target.innerHTML += " 시간, " + money+" 원";
}
function cancel(){
	addtime=0;
	money=0;
	time=<%=vo.getTime()%>
	target.innerHTML = addtime;
    target.innerHTML += " 시간, " + money+" 원";
}
</script>
</head>
<body>
<p id="a">시간 : <%out.print(Integer.parseInt(vo.getTime())/60); %>시 <%out.print(Integer.parseInt(vo.getTime())%60); %> 분 남았습니다.</p>
<button type="button" class="start" onclick="start()"></button><br><br>
<p id="a">추가 시간</p><br>
<h1 id="target"></h1><br>
<button type="button"  class="addbtn" onclick="time1()">1시간<br>1000원</button>
<button type="button"  class="addbtn" onclick="time2()">2시간<br>2000원</button>
<button type="button"  class="addbtn" onclick="time3()">6시간<br>5000원</button>
<button type="button"  class="addbtn" onclick="time4()">13시간<br>10000원</button>
<p></p>
<button type="button" class="common_btn"  onclick="cancel()">취소</button> 
</body>
</html> 