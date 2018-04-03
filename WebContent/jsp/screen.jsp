<%@page import="java.util.TimerTask"%>
<%@page import="java.util.Timer"%>
<%@page import="kr.ac.skuniver.member.MemberVO"%>
<%@page import="kr.ac.skuniver.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/webterm1/css/common.css">
<title>Insert title here</title>
</head>
<%
	int time=(int)request.getAttribute("time");
%>

<body>
<script language="javascript">
var updatetime=<%=time%>;

function move1(){
	location.href="logout.sku?updatetime="+updatetime;
}
$(document).ready(function(){
 //초기값
 
 var hour= Math.ceil(<%=time%>/60);
 var minute = <%=time%>%60;
 var second = 0;
 var end=0;
 if(minute!=0&&hour>0){
	 hour--;
 }
 // 초기화
 $(".countTimeHour").html(hour);
 $(".countTimeMinute").html(minute);
 $(".countTimeSecond").html(second);
 
 var timer = setInterval(function () {
   // 설정
   $(".countTimeHour").html(hour);
   $(".countTimeMinute").html(minute);
   $(".countTimeSecond").html(second);
   if(hour==0&&minute==5&&second==59){
	    alert("5분 남았습니다.");	
	   }
   if(second == 0 && minute == 0&&hour==0){
	   alert('사용시간이 종료되었습니다.');
    clearInterval(timer);/* 타이머 종료 */
    location.href="logout.sku?updatetime="+end;
   }else{
	second--;
    // 분처리
    if(second < 0){
    	minute--;
     $.ajax({
    	type : 'post',
    	url : "Screen.sku",
    	error : function(){
    		alert("운개나쁨");
    	},
    	success : function(){
    	}
     });
     updatetime--;
     if(minute<0&&hour>0){
    	 hour--;
    	 minute=59;
     }
     second = 59;
    }
   }
     }, 1000); /* millisecond 단위의 인터벌 */
});
self.moveTo(0,0)
self.resizeTo(screen.availWidth, screen.availWidth);

</script>
<body>
 <div class="screen_div1">
<table>
 <tr>
  <td>남은시간</td>
  <td align="right"><span class="countTimeHour"></span>시
  <span class="countTimeMinute"></span>분</td>
 </tr>
 <tr>
  <td>좌석 번호</td>
  <td align="right"><%=session.getAttribute("number") %></td>
 </tr>
 <tr>
  <td>ID</td>
  <td align="right"><%=session.getAttribute("id")%></td>
 </tr>
 <tr>
  <td><button type="button" class="common_btn"  onclick="move1()">로그아웃</button></td>
  </tr>

</table>
</div>

<div class="screen_div2">
<table>
<tr>
  		<td> 
  		<a target="_blank" href="http://www.naver.com">
   			<img class="link-button2" src="/webterm1/images/internet-explorer.png" usemap="#link">
   		</a>
   		</td>
   		
   		<td> 
   		<a target="_blank" href="http://www.google.co.kr">
   			<img class="link-button2" src="/webterm1/images/chrome.png" usemap="#link"> 
   		</a>
   		</td>
   		
   		<td> 
   		<a target="_blank" href="https://www.youtube.com/">
   			<img class="link-button2" src="/webterm1/images/youtube.png" usemap="#link"> 
   		</a>
   		</td>
   		
 </tr>
 
<tr>
<td>
	<a target="_blank" href="http://www.leagueoflegends.co.kr/">
		<img class="link-button2" src="/webterm1/images/lol2.jpg" usemap="#link">
	</a>
</td>
<td>
	<a target="_blank" href="http://sa.nexon.com/">
		<img class="link-button2" src="/webterm1/images/sa.PNG" usemap="#link">
	</a>
</td>
<td>
	<a target="_blank" href="http://bns.plaync.com/">
		<img class="link-button2" src="/webterm1/images/b&s.png" usemap="#link">
	</a>
</td>
<td>
	<a target="_blank" href="http://aion.plaync.com">
		<img class="link-button2" src="/webterm1/images/aion.jpg" usemap="#link">
	</a>
</td>
<td>
	<a target="_blank" href="http://kart.nexon.com">
		<img class="link-button2" src="/webterm1/images/카트라이더.png" usemap="#link">
	</a>
</td>
</tr>
</table>
</div>
</body>
</html>