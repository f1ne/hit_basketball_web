<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
  
  <body>
   <center>
    <h1><b>队伍注册</b></h1>
    <hr>
    <br>
    注：
    <br>
    <s:form action="AddManagerBegin.action">
    
								
    <table >
    <tr><td>管理员ID:<s:textfield name="newManager.id"/></td></tr>
    <tr><td>名字:<s:textfield name="newManager.name"/></td></tr>
    <tr><td>密码:<s:textfield name="newManager.passcode"/></td></tr>
   	</table> 
   	<br>
   	<li><div class="select_panel">
									<div class="addr_panel"><i class="addr"></i>权限：<select name="newManager.privilgeLevel" id="newManager.privilgeLevel">
																				<option value="1总管理员" selected >总管理员</option>
																				<option value="2副管理员"  >副管理员</option>
																				<option value="3裁判"  >裁判</option>
																				<option value="4队伍管理员"  >队伍管理员</option>
																				<option value="5待定"  >待定</option>
																				
																			</select></div>
								</div></li> <br>
    <br>	                  
   	<hr>
   	<s:submit align="CENTER" value="提交"/>
    </s:form>
  	<s:form action="returnMyJsp.action" ><s:submit  align="right" value="返回"/></s:form>
  	</center>
  	
  	
  </body>
</html>
