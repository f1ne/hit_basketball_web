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
  <body background="2image/background.jpg">
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
    <td><a href="returnMyJspT.action" style="font-size:14px;">比赛日程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="enterLiveBeginT.action" style="font-size:14px;">赛事实时信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="SearchTBegin.action" style="font-size:14px;">数据搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="AddPlayer.action" style="font-size:14px;">添加球员</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>        
    </tr>
    </tbody></table>
  </div>
<hr>
<table border="0" cellpadding="0" style="margin-left:0px;">
    <tbody><tr>
    <td style="padding-right:50px;"><img src="${pageContext.request.contextPath}/image/ball.png" width="620px;" height="356px;"/> </td> 
     </tr>
    </tbody></table>
   <br>
  </body>
</html>