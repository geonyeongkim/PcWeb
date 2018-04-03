<%@page import="com.sun.org.apache.bcel.internal.generic.NEWARRAY"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.skuniver.member.MemberVO"%>
<%@page import="kr.ac.skuniver.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/webterm1/css/common.css">
<script type="text/javascript">

window.setTimeout('window.location.reload()',60000);
</script>
<%
	int seatnumber[][]=(int[][])request.getAttribute("seatnumber");
	List numberlist=(List)request.getAttribute("numberlist");
	List idlist=(List)request.getAttribute("idlist");
	List timelist=(List)request.getAttribute("timelist");
	%>
<title>Insert title here</title>
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
	<script>
	function btncolor(btn){
		var seatnumber=new Array();
		for(var i=1;i<26;i++){
			seatnumber[i]=i;
		}
		var proper=document.getElementById(btn);
		if(proper.style.backgroundColor=='red'){
			alert("사용중인 자리입니다.");
		}
		if(proper.style.backgroundColor=='green'){
			proper.style.backgroundColor='red';
			proper.style.backgroundImage="url(/webterm1/images/off.png)";
			location.href="fee.sku?number="+seatnumber[btn];
			
		}
	}
	
</script>
<table>
<tr>
<%
int hour=0;
int minute=0;
for(int i=0; i<5; i++){%>
 </tr>
<%for(int j=0; j<5; j++) { 
	for(int q=0;q<numberlist.size();q++){
		if(numberlist.get(q).toString().equals(Integer.toString(seatnumber[i][j]))){
			hour=(Integer.parseInt(timelist.get(q).toString())/60);
			minute=(Integer.parseInt(timelist.get(q).toString())%60);
			%>
			<td><input type="button" id="<%=seatnumber[i][j]%>" value="<%=seatnumber[i][j]%>" class="button" style="background-color:red; background-image: url(/webterm1/images/off.png);" onclick="btncolor(<%=seatnumber[i][j]%>)"></button></td>
			<td><input type="button" value="사용 id= <%=idlist.get(q).toString()%> <%=hour%> 시간 <%=minute%> 분" class="wor"></button></td>
			<%	
			j++;
		}
	}
			%>
			<td><input type="button" id="<%=seatnumber[i][j]%>" value="<%=seatnumber[i][j]%>" class="button" style="background-color:green; background-image: url(/webterm1/images/on.png);" onclick="btncolor(<%=seatnumber[i][j]%>)"></button></td>  
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