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
      <td><br><span style="color:lightblue;">你好,<%String name = (String)session.getAttribute("user");%><%=name %>&nbsp;&nbsp;&nbsp;</span> </td>
      <td><a href="returnMyJsp.action" style="font-size:14px;"><br>登出</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    </tbody>
    </table>
    <hr>
    <table border="0" cellpadding="0" style="margin-left:0px;">
    <tbody><tr>
    <td><a href="returnMyJspM.action" style="font-size:14px;">主页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="GetNotificationM.action" style="font-size:14px;">近期赛事通告</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="GetScheduleM.action" style="font-size:14px;">比赛日程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="enterRecordingBegin.action" style="font-size:14px;">赛事实时信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="SearchMBegin.action" style="font-size:14px;">数据搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      <td><a href="AddManager.action" style="font-size:14px;">管理员注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>      
   <td><a href="AddTeam.action" style="font-size:14px;">队伍注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   <td><a href="uploadPic.action" style="font-size:14px;">上传图片</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    </tbody></table>
  </div>
<hr>
   <center>
    <h1><b><span style="color:white">队伍注册</span></b></h1>
    <br>
   <span style="color:white"> 注：队伍ID为6位形如201201，代表的是2012级的智能接口与人机交互研究中心的队伍。请自行推算。</span>
    <br><br>
    <s:form action="AddTeamBegin.action" style="color:white">
    
    <li><div class="select_panel">
									<div class="addr_panel"><i class="addr"></i>实验室：<select name="newTeam.lab" id="newTeam.lab">
									                                          <option disabled="disabled" value="" selected>-请选择 -</option> 
																				<option value="智能接口与人机交互研究中心" >智能接口与人机交互研究中心（01）</option>
																				<option value="语言技术研究中心"  >语言技术研究中心（02）</option>
																				<option value="企业与服务智能计算研究中心"  >企业与服务智能计算研究中心（03）</option>
																				<option value="计算机网络与信息安全技术研究中心"  >计算机网络与信息安全技术研究中心（04）</option>
																				<option value="容错与移动计算研究中心"  >容错与移动计算研究中心（05）</option>
																				<option value="海量数据计算研究中心"  >海量数据计算研究中心（06）</option>
																				<option value="生物信息学研究中心"  >生物信息学研究中心（07）</option>
																				<option value="多智能体机器人研究中心"  >多智能体机器人研究中心（08）</option>
																				<option value="模式识别研究中心"  >模式识别研究中心（09）</option>
																				<option value="航天软件工程研究中心"  >航天软件工程研究中心（10）</option>
																				<option value="社会计算与信息检索研究中心"  >社会计算与信息检索研究中心（11）</option>
																				<option value="信息对抗技术研究所"  >信息对抗技术研究所（12）</option>
																				<option value="计算机科学技术研究所"  >计算机科学技术研究所（13）</option>
																				<option value="哈工大机器人创新基地"  >哈工大机器人创新基地（14）</option>
																				<option value="感知计算研究中心"  >感知计算研究中心（15）</option>
																				<option value="其他"  >其他（16）</option>
																			</select></div>
								</div></li> <br>
								
    <table style="color:white">
    <tr><td>队伍ID:<s:textfield name="newTeam.id"/></td></tr>
    <tr><td>队伍名:<s:textfield name="newTeam.name"/></td></tr>
    <tr><td>密码:<s:password name="newTeam.passcode"/></td></tr>
   	</table> 
   	
    <br>	                  
   	<s:submit align="CENTER" value="提交"/>
    </s:form>
  	</center>
  		<hr>
  	
  </body>
</html>