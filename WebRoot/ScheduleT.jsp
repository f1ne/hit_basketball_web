<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="Login.LoginAction" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <% request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");%>
  <head>
    <base href="<%=basePath%>">
    <title>Add Author page</title>
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
      <td><br><span style="color:lightblue;">你好,<%String name = (String)session.getAttribute("user");%><%=name %>&nbsp;&nbsp;&nbsp;</span> </td>
      <td><a href="returnMyJsp.action" style="font-size:14px;"><br>登出</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    </tbody>
    </table>
    <hr>
    <table border="0" cellpadding="0" style="margin-left:0px;">
    <tbody><tr>
    <td><a href="returnMyJspT.action" style="font-size:14px;">主页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="GetNotificationT.action" style="font-size:14px;">近期赛事通告</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="GetScheduleT.action" style="font-size:14px;">比赛日程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="enterLiveBeginT.action" style="font-size:14px;">赛事实时信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="SearchTBegin.action" style="font-size:14px;">数据搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      <td><a href="ShowPlayer.action" style="font-size:14px;">查看球员</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>      
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
		<td><s:property value="#Games.Place"/> </td>
		<td><s:property value="#Games.HomeTeamID"/></td>
		<td><s:property value="#Games.AwayTeamID"/></td>
  	 </tr>
	</s:iterator>
	</table>
  <h1 align="CENTER"><b><span style="color:white;">A组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
        <td>队伍ID</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
	<s:iterator value="A" id="GroupA" status="stuts">
  	 <tr>
        <td><s:property value="#GroupA.TeamID"/></td>
        <td><s:property value="#GroupA.Win"/></td>
        <td><s:property value="#GroupA.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<h1 align="CENTER"><b><span style="color:white;">B组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
        <td>队伍ID</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
	<s:iterator value="B" id="GroupB" status="stuts">
  	 <tr>
        <td><s:property value="#GroupB.TeamID"/></td>
        <td><s:property value="#GroupB.Win"/></td>
        <td><s:property value="#GroupB.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<h1 align="CENTER"><b><span style="color:white;">C组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
       <td>队伍ID</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
	<s:iterator value="C" id="GroupC" status="stuts">
  	 <tr>
        <td><s:property value="#GroupC.TeamID"/></td>
        <td><s:property value="#GroupC.Win"/></td>
        <td><s:property value="#GroupC.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<h1 align="CENTER"><b><span style="color:white;">D组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
       <td>队伍ID</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
	<s:iterator value="D" id="GroupD" status="stuts">
  	 <tr>
        <td><s:property value="#GroupD.TeamID"/></td>
        <td><s:property value="#GroupD.Win"/></td>
        <td><s:property value="#GroupD.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<h1 align="CENTER"><b><span style="color:white;">E组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
       <td>队伍ID</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
	<s:iterator value="E" id="GroupE" status="stuts">
  	 <tr>
        <td><s:property value="#GroupE.TeamID"/></td>
        <td><s:property value="#GroupE.Win"/></td>
        <td><s:property value="#GroupE.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<h1 align="CENTER"><b><span style="color:white;">F组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
       <td>队伍ID</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
	<s:iterator value="F" id="GroupF" status="stuts">
  	 <tr>
        <td><s:property value="#GroupF.TeamID"/></td>
        <td><s:property value="#GroupF.Win"/></td>
        <td><s:property value="#GroupF.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<h1 align="CENTER"><b><span style="color:white;">G组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
       <td>队伍ID</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
	<s:iterator value="G" id="GroupG" status="stuts">
  	 <tr>
        <td><s:property value="#GroupG.TeamID"/></td>
        <td><s:property value="#GroupG.Win"/></td>
        <td><s:property value="#GroupG.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
	<h1 align="CENTER"><b><span style="color:white;">H组</span></b></h1>
	<table border=1 align="center" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
       <td>队伍ID</td>
		<td>胜</td>
		<td>负</td>

  	</tr>
	<s:iterator value="H" id="GroupH" status="stuts">
  	 <tr>
        <td><s:property value="#GroupH.TeamID"/></td>
        <td><s:property value="#GroupH.Win"/></td>
        <td><s:property value="#GroupH.Lose"/></td>
  	 </tr>
	</s:iterator>
	</table>
  </body>
</html>
