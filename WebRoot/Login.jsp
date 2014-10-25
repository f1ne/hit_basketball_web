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
<body > 

   	
   	<br>
<center>       <h2 >帐号登录 </h2 >  <s:form action="LoginBegin.action">
            用户名：<Input type = "text" name = "user" style= "width:150" ><br >
            密码：<Input type = "password" name = "psw" style = "width:150">
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
