<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="Login.LoginAction" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
	request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");
%>
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
			<tbody>
				<tr>
					<td style="padding-right:50px;"><img
						src="${pageContext.request.contextPath}/image/logo.png"
						width="240px;" height="50px;" /></td>
					<td style="padding-right:50px;"><img
						src="${pageContext.request.contextPath}/image/logo2.gif"
						width="240px;" height="50px;" /></td>
					<td><br>
					<span style="color:lightblue;">你好,<%
						String name = (String)session.getAttribute("user");
					%><%=name%>&nbsp;&nbsp;&nbsp;
					</span></td>
					<td><a href="returnMyJsp.action" style="font-size:14px;"><br>登出</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</tbody>
		</table>
		<hr>
		<table border="0" cellpadding="0" style="margin-left:0px;">
			<tbody>
				<tr>
					<td><a href="returnMyJspM.action" style="font-size:14px;">主页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><a href="GetNotificationM.action" style="font-size:14px;">近期赛事通告</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><a href="GetScheduleM.action" style="font-size:14px;">比赛日程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><a href="enterRecordingBegin.action"
						style="font-size:14px;">赛事实时信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><a href="SearchMBegin.action" style="font-size:14px;">数据搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><a href="AddManager.action" style="font-size:14px;">管理员注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</div>

	<hr>
	<center>
	<font size=5><span style="color:white;">输入对阵信息</span></font>
	<s:form action="InsertSchedule.action">
		<br>
		
				<font size=3><span style="color:white;">主队:</span></font> 
					<select id="newhomeTeamID" name="newhomeTeamID">
			<option disabled="disabled" value="">-请选择 -</option> 
			<%
			  	ArrayList<String> T = (ArrayList<String>)session.getAttribute("TeamList");
	 if(!T.isEmpty()){
			  for(String teamopt:T){  
			%>
			<option value="<%=teamopt%>">
				<%=teamopt%>
				</option>
				<%
				}
					}
				%>
				</select> <br><br>
				<font size=3><span style="color:white;">客队:</span></font> <select id="newawayTeamID" name="newawayTeamID">
			<option disabled="disabled" value="">-请选择 -</option> 
			<%
			  for(String teamopt1:T){  
			%>
			<option value="<%=teamopt1%>">
				<%=teamopt1%>
				</option>
				<%
			
					}
				%>
				</select> <br /><br>
				
 
 <table border=1 align="CENTER" style=color:white><tr><center><span style="color:white;">时间:</span></center></tr>
 <tr> 
<td> <span style="color:white;">年</span></td>
<td> <span style="color:white;">月</span></td>
 <td><span style="color:white;">日</span>	</td>
 <td><span style="color:white;">时</span></td>
<td><span style="color:white;">分</span></td></tr>
<tr>												
 <%SimpleDateFormat sdf=new SimpleDateFormat("yyyy",Locale.SIMPLIFIED_CHINESE);
 String year = sdf.format(new Date());
 char []aa= year.toCharArray();
		Date d=new Date(); %>
				<td>	<select name="tyear" id="tyear">
					<option disabled="disabled" value="" selected>-请选择 -</option>
						<option value="<%=aa%>"><%=aa%></option>
									<option value="<%=aa %>" ><%aa[3]++;%><%=aa %></option>
																			</select></td>
					
					
					<td><select name="tmonth" id="tmonth">
					<option disabled="disabled" value="" selected>-请选择 -</option>
						<% for(int i=1;i<13;i++){%>
						<option value="<%=i%>"><%=i %></option>
									<%} %></select></td>
					
					<td><select name="tday" id="tday">
					<option disabled="disabled" value="" selected>-请选择 -</option>
						<% for(int i=1;i<32;i++){%>
						<option value="<%=i%>"><%=i %></option>
									<%} %>
					 </select></td>
				  
					<td><select name="thour" id="thour">
					<option disabled="disabled" value="" selected>-请选择 -</option>
						<% for(int i=0;i<24;i++){%>
						<option value="<%=i%>"><%=i %></option>
									<%} %>
																			</select></td>
			 
					<td><select name="tmin" id="tmin">
					<option disabled="disabled" value="" selected>-请选择 -</option>
						<% for(int i=0;i<60;i++){%>
						<option value="<%=i%>"><%=i %></option>
									<%} %>
																			</select></td></tr></table>
<br>
<font size=3><span style="color:white;">地点</span></font> <input
					type="text" id="newplace" name="newplace"> <br />
				<br><s:submit align="CENTER" value="提交" />
	</s:form></center>
</body>
</html>