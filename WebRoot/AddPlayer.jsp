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
    <td><a href="GetScheduleT.action" style="font-size:14px;">近期赛事通告</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="GetScheduleT.action" style="font-size:14px;">比赛日程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="enterLiveBeginT.action" style="font-size:14px;">赛事实时信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="SearchTBegin.action" style="font-size:14px;">数据搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      <td><a href="ShowPlayer.action" style="font-size:14px;">查看球员</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>      
    </tr>
    </tbody></table>
  </div>
  <hr>
   <center>
    <h1><b><span style="color:white">添加球员</span></b></h1>
    <br>
   <span style="color:white"> 注：球员姓名不能重，如果有相关情况请在后面用1，2区分</span>
    <br><br>
    <s:form action="AddPlayerBegin.action" style="color:white">
    
								
    <table style="color:white">
    <tr><td>名字:<s:textfield name="newPlayer.Name"/></td></tr>
    <tr><td>学号:<s:textfield name="newPlayer.StudentID"/></td></tr>
    <tr><td>号码:<s:textfield name="newPlayer.Number"/></td></tr>
   	</table> 
   	<br>
   	<li><div class="radio_panel">
									<input type="radio" name="newPlayer.Sex" id="sex_1" value="男"  checked/><label for="sex_1">男</label>
									<input type="radio" name="newPlayer.Sex" id="sex_2" value="女" /><label for="sex_2">女</label>
								</div></li>
   	
   	<br>
   	<li><div class="select_panel">
									<div class="addr_panel"><i class="addr"></i>参赛身份：<select name="newPlayer.Position" id="newPlayer.position">
																				<option value="领队" selected >领队</option>
																				<option value="教练"  >教练</option>
																				<option value="在读本科生"  >在读本科生</option>
																				<option value="在读硕士生"  >在读硕士生</option>
																				<option value="在读博士生"  >在读博士生</option>
																				<option value="教师"  >教师</option>
																			</select></div>
								</div></li> <br>
								<li><div class="select_panel">
									<div class="addr_panel"><i class="addr"></i>年龄段：<select name="newPlayer.Age" id="newPlayer.Age">
																				<option value="20" selected ><%="<" %>45岁</option>
																				<option value="45"  ><%=">=" %>45岁（1969年12月31日前出生）</option>
																				<option value="55"  ><%=">=" %>55岁（1959年12月31日前出生）</option>
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
