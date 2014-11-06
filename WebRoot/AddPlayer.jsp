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
    <td><a href="GetScheduleT.action" style="font-size:14px;">比赛日程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="enterLiveBeginT.action" style="font-size:14px;">赛事实时信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="SearchTBegin.action" style="font-size:14px;">数据搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      <td><a href="AddPlayer.action" style="font-size:14px;">添加球员</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>      
    </tr>
    </tbody></table>
  </div>
  <hr>
   <center>
    <h1><b>添加球员</b></h1>
    <br>
    注：球员姓名不能重，如果有相关情况请在后面用1，2区分
    <br><br>
    <s:form action="AddPlayerBegin.action">
    
								
    <table >
    <tr><td>名字:<s:textfield name="newPlayer.Name"/></td></tr>
    <tr><td>学号:<s:textfield name="newPlayer.StudentID"/></td></tr>
    <tr><td>号码:<s:textfield name="newPlayer.Number"/></td></tr>
   	</table> 
   	<br>
   	<li><div class="radio_panel">
									<input type="radio" name="newPlayer.Sex" id="sex_1" value="男" /><label for="sex_1">男</label>
									<input type="radio" name="newPlayer.Sex" id="sex_2" value="女" /><label for="sex_2">女</label>
									<input type="radio" name="newPlayer.Sex" id="sex_3" value="保密" checked /><label for="sex_3">保密</label>
								</div></li>
   	
   	<br>
   	<li><div class="select_panel">
									<div class="addr_panel"><i class="addr"></i>位置：<select name="newPlayer.Position" id="newPlayer.position">
																				<option value="SF小前锋" selected >小前锋(SF)</option>
																				<option value="PF大前锋"  >大前锋(PF)</option>
																				<option value="CC中锋"  >中锋(C)</option>
																				<option value="SG得分后卫"  >得分后卫(SG)</option>
																				<option value="PG控球后卫"  >控球后卫(PG)</option>
																				
																			</select></div>
								</div></li> <br>
								<li><div class="select_panel">
									<div class="addr_panel"><i class="addr"></i>队伍ID：<select name="newPlayer.TeamID" id="newPlayer.TeamID">
																				<option value=<%=teamID %> selected ><%=teamID %></option>
																			</select></div>
								</div></li> <br>   
								<li><div class="select_panel">
									<div class="addr_panel"><i class="addr"></i>队伍名字：<select name="newPlayer.Team" id="newPlayer.Team">
																				<option value=<%=team %> selected ><%=team %></option>
																			</select></div>
								</div></li> <br>          
   	<s:submit align="CENTER" value="提交"/>
    </s:form>
  	</center>
     	<hr>	
  	
  </body>
</html>
