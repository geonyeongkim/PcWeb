<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.skuniver.member.MemberVO"%>
<%@page import="kr.ac.skuniver.member.MemberDAO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/webterm1/css/common.css">
<title>Insert title here</title>
<script type="text/javascript">
window.setTimeout('window.location.reload()',60000);
var ary=new Array();
</script>
<%
	int seatnumber[][]=(int[][])request.getAttribute("seatnumber");
	List agelist2=(List)request.getAttribute("agelist2");
	List agelist=(List)request.getAttribute("agelist");
	List numberlist=(List)request.getAttribute("numberlist");
	List idlist=(List)request.getAttribute("idlist");
	List timelist=(List)request.getAttribute("timelist");
	for(int i=0;i<agelist2.size();i++){
		%>
		<script type="text/javascript">
		ary[<%=i%>]=<%=agelist2.get(i).toString() %>;
		</script>
		<%
	}
	%>
<style type="text/css">
.button {
   width:80pt;
   height:80pt;
   color: white;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 40px;
   background-size:cover;
}
.wor {
   width:160pt;
   height:80pt;
   background-color: white;
   color: black;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 15px;
}

</style>
</head>
<body>


<script type="text/javascript">
	function adminclick(btn){
		var seatnumber=new Array();
		for(var i=1;i<26;i++){
			seatnumber[i]=i;
		}
		var proper=document.getElementById(btn);
		if(proper.style.backgroundColor=='green'){
			alert("사용중이지 않은 자리입니다.");
		}
		if(proper.style.backgroundColor=='red'){
			alert(btn+"를로그아웃시켰습니다.");
			proper.style.backgroundColor='green';
			proper.style.backgroundImage="url(/webterm1/images/on.png)";
			location.href="adminlogout.sku?number="+seatnumber[btn];
			
		}
	}
	function adminclick2(btn){
		var seatnumber=new Array();
		var proper=document.getElementById(btn);
		for(var i=1;i<26;i++){
			seatnumber[i]=i;
		}
		if(proper.style.backgroundColor=='red'){
			proper.style.backgroundColor='green';
			proper.style.backgroundImage="url(/webterm1/images/on.png)";
			location.href="adminlogout.sku?number="+seatnumber[btn];
		}
	}
	window.onload=function(){
		setInterval(function(){
			var d = new Date();
			var hour=d.getHours();
			var minute=d.getMinutes();
			var second=d.getSeconds();
			if(hour=="22"&&minute=="00"&&second=="00"){
				for(var s=0;s<ary.length;s++){
					adminclick2(ary[s]);
				}
			}
		},1000);
	}
</script>
<table>
<tr>
<td><button type="button" onclick="location.href='memberlist.sku'">회원목록</button></td>
<td><button type="button" onclick="location.href='loginForm.sku'">로그아웃</button></td>
</tr>
<tr>
<%
int hour=0;
int minute=0;
String age= null;
for(int i=0; i<5; i++){%>
 </tr>
<%for(int j=0; j<5; j++) { 
	for(int q=0;q<numberlist.size();q++){
		if((Integer.toString(seatnumber[i][j])).equals(numberlist.get(q).toString())){
			hour=(Integer.parseInt(timelist.get(q).toString())/60);
			minute=(Integer.parseInt(timelist.get(q).toString())%60);
			if((Integer.parseInt(agelist.get(q).toString())/10000)>=1999){
				age="청";
				
			}else{
				age="성";
			}
			%>
			<td><input type="button" id="<%=seatnumber[i][j]%>" value="<%=seatnumber[i][j]%>" class="button" style="background-color: red; background-image: url(/webterm1/images/off.png);" onclick="adminclick(<%=seatnumber[i][j]%>)"></td>
			<td><input type="button" value="사용 id= <%=idlist.get(q).toString()%> <%=hour%> 시간 <%=minute%> 분  <%=age %>" class="wor"></button></td>
			<%
			j++;
		}
	}
			%>
			<td><input type="button" id="<%=seatnumber[i][j]%>" value="<%=seatnumber[i][j]%>" class="button" style="background-color: green; background-image: url(/webterm1/images/on.png);" onclick="adminclick(<%=seatnumber[i][j]%>)"></td>  
			<td><input type="button" value="사용가능" class="wor"></button></td>  
			<%
	}
%>
 <tr>
<%}%>
</tr>
</table> 
</body>
</html> 