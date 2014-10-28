<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
 <% request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'Login.jsp' starting page</title>

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
      <td><a href="Login.action" style="font-size:14px;">请登录<!--<img src="images2011/menu_4.png" width="57" height="57"  border="0" />--></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td><a href="AddTeam.action" style="font-size:14px;">队伍注册<!--<img src="images2011/menu_1.png" width="57" height="57" border="0" / >--></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    </tbody>
    </table>
    <hr>
    <table border="0" cellpadding="0" style="margin-left:0px;">
    <tbody><tr>
    <td><a href="returnMyJsp.action" style="font-size:14px;">主页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="returnMyJsp.action" style="font-size:14px;">比赛日程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="enterLiveBegin.action" style="font-size:14px;">赛事实时信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="SearchBegin.action" style="font-size:14px;">数据搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>    
    </tr>
    </tbody></table>
  </div>
<hr>
   	
   	<br>
<center>       <h2 >帐号登录 </h2 >  <s:form action="LoginBegin.action">
            用户ID：<br><Input type = "text" name = "user" style= "width:150" ><br >
            密码：<br><Input type = "password" name = "psw" style = "width:150">
              <br>
              <br>
               <li><div class="radio_panel">
									<input type="radio" name="logintype" id="user_1" value="Team" /><label for="user_1">队伍</label>
									<input type="radio" name="logintype" id="user_2" value="Manager" checked /><label for="user_2">管理员</label>
								</div></li>
              	<s:submit align="CENTER" value="登录"/>

</s:form><s:form action="returnMyJsp.action" ><s:submit  align="right" value="返回"/></s:form></center > 
</body >
</html>
