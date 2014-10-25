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
    <h1><b>添加球员</b></h1>
    <hr>
    <br>
    注：
    <br>
    <s:form action="AddPlayerBegin.action">
    
								
    <table >
    <tr><td>名字:<s:textfield name="newPlayer.name"/></td></tr>
    <tr><td>号码:<s:textfield name="newPlayer.num"/></td></tr>
   	</table> 
   	<br>
   	
   	<li><div class="radio_panel">
									<input type="radio" name="newPlayer.sex" id="sex_1" value="男" /><label for="sex_1">男</label>
									<input type="radio" name="newPlayer.sex" id="sex_2" value="女" /><label for="sex_2">女</label>
									<input type="radio" name="newPlayer.sex" id="sex_3" value="保密" checked /><label for="sex_3">保密</label>
								</div></li>
   	
   	<br>
   	<li><div class="select_panel">
									<div class="addr_panel"><i class="addr"></i>位置：<select name="newPlayer.position" id="newPlayer.position">
																				<option value="SF小前锋" selected >小前锋(SF)</option>
																				<option value="PF大前锋"  >大前锋(PF)</option>
																				<option value="CC中锋"  >中锋(C)</option>
																				<option value="SG得分后卫"  >得分后卫(SG)</option>
																				<option value="PG控球后卫"  >控球后卫(PG)</option>
																				
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
