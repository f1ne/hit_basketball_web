<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="Player.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <% request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");%>
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
      <td><br><span style="color:lightblue;">你好,<%String teamID = (String)session.getAttribute("user");%><%=teamID %>&nbsp;&nbsp;&nbsp;</span> </td>
      <td><a href="returnMyJsp.action" style="font-size:14px;"><br>登出</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    </tbody>
    </table>
    <hr><% String team=(String)session.getAttribute("team"); %>
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
 
  <h1 align="CENTER"><b><span style="color:white;"><s:property value="jspTitle" /></span></b></h1><h4 align="CENTER"><span style="color:white;">(当前共有 <%=(Integer)request.getAttribute("PlayerNum") %> 名球员)</span></h4>
    <table border=1 align="CENTER" style=color:white>
    <tr>
    	<!-- <td>Index</td>-->
        <td>Name</td>
		<td>Number</td>
		<td>StudentID</td>
		<td>Sex</td>
		<td>Position</td>
		<td>Age Group</td>
		<td>三好杯 player</td>

  	</tr>
	<s:iterator value="A" id="players" status="stuts">
  	 <tr>
  	 	<!-- <td><s:property value="#stuts.index+1" /></td>-->
        <td><s:property value="#players.Name"/></td>
		<td><s:property value="#players.Number"/></td>
		<td><s:property value="#players.StudentID"/></td>
		<td><s:property value="#players.Sex"/></td>
		<td><s:property value="#players.Position"/></td>
		<td><s:property value="#players.Age"/></td>
		<td><s:property value="#players.IsSHB"/></td>
		<td><a href="<s:url action="DeletePlayer.action"><s:param name="DPlayerID" value="#players.PlayerID"></s:param></s:url>">删除</a></td>
  	 </tr>
	</s:iterator>
	<tr><td><a href="AddPlayer.action" style="font-size:14px;">添加球员</a></td></tr>
	</table>
  
  </body>
</html>
