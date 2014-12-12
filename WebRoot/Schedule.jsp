<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="indexNTable.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>光熙杯篮球赛管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <style type="text/css"> 
<!-- 
a:link { 
font-size: 12px; 
color: #FFFFFF; 
text-decoration: none; 
} 
a:visited { 
font-size: 12px; 
color: #FFFFFF; 
text-decoration: none; 
} 
a:hover { 
font-size: 12px; 
color: #999999; 
text-decoration: underline; 
} 
--> 
</style> 
  
    <style>
body {
	background-color: #668866;
}
</style>
  <body>
  <div id="menu">
   <table border="0" cellpadding="0" style="margin-left:0px;">
   <tbody><tr>
      <td style="padding-right:50px;"><img src="${pageContext.request.contextPath}/image/logo.png" width="240px;" height="50px;"/> </td>
      <td style="padding-right:50px;"><img src="${pageContext.request.contextPath}/image/logo2.gif" width="240px;" height="50px;"/> </td> 
      <td><a href="Login.action" style="font-size:14px;">请登录<!--<img src="images2011/menu_4.png" width="57" height="57"  border="0" />--></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td><a href="AddTeam.action" style="font-size:14px;">队伍注册<!--<img src="images2011/menu_1.png" width="57" height="57" border="0" / >--></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    </tbody>
    </table>
    <hr>
    <table border="0" cellpadding="0" style="margin-left:0px;">
    <tbody><tr>
    <td><a href="returnMyJsp.action" style="font-size:14px;">主页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="GetNotification.action" style="font-size:14px;">近期赛事通告</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="GetSchedule.action" style="font-size:14px;">比赛日程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="enterLiveBegin.action" style="font-size:14px;">赛事实时信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="SearchBegin.action" style="font-size:14px;">数据搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>     
    </tr>
    </tbody></table>
  </div>
<hr>
    <h1 align="CENTER"><b><span style="color:white;"><s:property value="jspTitle" /></span></b></h1>
    <table border=1 align="CENTER" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
        <td>时间</td>
		<td>地点</td>
		<td>主队ID</td>
		<td>客队ID</td>

  	</tr>
	<s:iterator value="S" id="Games" status="stuts">
  	 <tr>
  	 	<!-- <td><s:property value="#stuts.index+1" /></td>-->
        <td><s:property value="#Games.Time"/></td>
		<td><s:property value="#Games.Place"/></td>
		<td><s:property value="#Games.HomeTeamID"/></td>
		<td><s:property value="#Games.AwayTeamID"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<%int AA=(Integer)session.getAttribute("AA"); 
  	if(AA>0){%>
  <h1 align="CENTER"><b><span style="color:white;">A组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
        <td>队伍ID</td>
        <td>队伍名</td>
        <td>所属实验室</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
  	
	<s:iterator value="A" id="GroupA" status="stuts">
  	 <tr>
        <td><s:property value="#GroupA.TeamID"/></td>
        <td><s:property value="#GroupA.TeamName"/></td>
        <td><s:property value="#GroupA.TeamLab"/></td>
        <td><s:property value="#GroupA.Win"/></td>
        <td><s:property value="#GroupA.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<%} %>
	<%int BB=(Integer)session.getAttribute("BB"); 
  	if(BB>0){%>
	<h1 align="CENTER"><b><span style="color:white;">B组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
        <td>队伍ID</td>
        <td>队伍名</td>
        <td>所属实验室</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
  	
	<s:iterator value="B" id="GroupB" status="stuts">
  	 <tr>
        <td><s:property value="#GroupB.TeamID"/></td>
        <td><s:property value="#GroupB.TeamName"/></td>
        <td><s:property value="#GroupB.TeamLab"/></td>
        <td><s:property value="#GroupB.Win"/></td>
        <td><s:property value="#GroupB.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<%} %>
	<%int CC=(Integer)session.getAttribute("CC"); 
  	if(CC>0){%>
	<h1 align="CENTER"><b><span style="color:white;">C组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
        <td>队伍ID</td>
        <td>队伍名</td>
        <td>所属实验室</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
	<s:iterator value="C" id="GroupC" status="stuts">
  	 <tr>
        <td><s:property value="#GroupC.TeamID"/></td>
        <td><s:property value="#GroupC.TeamName"/></td>
        <td><s:property value="#GroupC.TeamLab"/></td>
        <td><s:property value="#GroupC.Win"/></td>
        <td><s:property value="#GroupC.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<%} %>
	<%int DD=(Integer)session.getAttribute("DD"); 
  	if(DD>0){%>
	<h1 align="CENTER"><b><span style="color:white;">D组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
        <td>队伍ID</td>
        <td>队伍名</td>
        <td>所属实验室</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
	<s:iterator value="D" id="GroupD" status="stuts">
  	 <tr>
        <td><s:property value="#GroupD.TeamID"/></td>
        <td><s:property value="#GroupD.TeamName"/></td>
        <td><s:property value="#GroupD.TeamLab"/></td>
        <td><s:property value="#GroupD.Win"/></td>
        <td><s:property value="#GroupD.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<%} %>
	<%int EE=(Integer)session.getAttribute("EE"); 
  	if(EE>0){%>
	<h1 align="CENTER"><b><span style="color:white;">E组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
       <td>队伍ID</td>
       <td>队伍名</td>
       <td>所属实验室</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
	<s:iterator value="E" id="GroupE" status="stuts">
  	 <tr>
        <td><s:property value="#GroupE.TeamID"/></td>
        <td><s:property value="#GroupE.TeamName"/></td>
        <td><s:property value="#GroupE.TeamLab"/></td>
        <td><s:property value="#GroupE.Win"/></td>
        <td><s:property value="#GroupE.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<%} %>
	<%int FF=(Integer)session.getAttribute("FF"); 
  	if(FF>0){%>
	<h1 align="CENTER"><b><span style="color:white;">F组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
       <td>队伍ID</td>
       <td>队伍名</td>
       <td>所属实验室</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
	<s:iterator value="F" id="GroupF" status="stuts">
  	 <tr>
        <td><s:property value="#GroupF.TeamID"/></td>
        <td><s:property value="#GroupF.TeamName"/></td>
        <td><s:property value="#GroupF.TeamLab"/></td>
        <td><s:property value="#GroupF.Win"/></td>
        <td><s:property value="#GroupF.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<%} %>
	<%int GG=(Integer)session.getAttribute("GG"); 
  	if(GG>0){%>
	<h1 align="CENTER"><b><span style="color:white;">G组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
       <td>队伍ID</td>
       <td>队伍名</td>
       <td>所属实验室</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
	<s:iterator value="G" id="GroupG" status="stuts">
  	 <tr>
        <td><s:property value="#GroupG.TeamID"/></td>
        <td><s:property value="#GroupG.TeamName"/></td>
        <td><s:property value="#GroupG.TeamLab"/></td>
        <td><s:property value="#GroupG.Win"/></td>
        <td><s:property value="#GroupG.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<%} %>
	<%int HH=(Integer)session.getAttribute("HH"); 
  	if(HH>0){%>
	<h1 align="CENTER"><b><span style="color:white;">H组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
       <td>队伍ID</td>
       <td>队伍名</td>
       <td>所属实验室</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
	<s:iterator value="H" id="GroupH" status="stuts">
  	 <tr>
        <td><s:property value="#GroupH.TeamID"/></td>
        <td><s:property value="#GroupH.TeamName"/></td>
        <td><s:property value="#GroupH.TeamLab"/></td>
        <td><s:property value="#GroupH.Win"/></td>
        <td><s:property value="#GroupH.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<%} %>
  </body>
</html>