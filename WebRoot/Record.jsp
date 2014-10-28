<%@ page language="java" import="java.util.*,com.hit.cs.basketball.PlayerBean" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>比赛现场记录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	div#container{width:1200px;align:center}
	div#header{background-color:#99bbbb;text-align:center}
	div#hometeam{background-color:#ffff99;height:600px;width:600px;float:left}
	div#awayteam{background-color:#eeeeee;height:600px;width:600px;float:left}
	div#footer{background-color:#99bbbb;clear:both;text-align:center}
	h1{margin-bottom:0}
	h2{margin-bottom:0;font-size:14px}
	</style>
	<script language="javascript"src="Record.js">
	
	</script>
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
      <td><br><span style="color:lightblue;">你好,<%String name = (String)session.getAttribute("user");%><%=name %></span> </td>
      <td><a href="returnMyJsp.action" style="font-size:14px;"><br>&nbsp;&nbsp;&nbsp;登出</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    </tbody>
    </table>
    <hr>
    <table border="0" cellpadding="0" style="margin-left:0px;">
    <tbody><tr>
    <td><a href="returnMyJspM.action" style="font-size:14px;">主页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="returnMyJspM.action" style="font-size:14px;">比赛日程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="enterRecordingBegin.action" style="font-size:14px;">赛事实时信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="returnMyJspM.action" style="font-size:14px;">数据搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      <td><a href="AddManager.action" style="font-size:14px;">管理员注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>      
    </tr>
    </tbody></table>
  </div>
<hr>
    <%
        ArrayList<PlayerBean> listTeam1=(ArrayList<PlayerBean>)request.getAttribute("listTeam1");
        ArrayList<PlayerBean> listTeam2=(ArrayList<PlayerBean>)request.getAttribute("listTeam2");
        int HomeTeamID=0;
        int AwayTeamID=0;
        if (listTeam1.size()>0){
            HomeTeamID=((PlayerBean)listTeam1.get(0)).getTeamID();
        }
        if (listTeam2.size()>0){
            AwayTeamID=((PlayerBean)listTeam2.get(0)).getTeamID();
        }
        PlayerBean aPlayer;
     %>
	<div id="container">
		<div id="header">
			<h1><font size=14>现场比赛记录</font></h1>
		</div>
		<div id="hometeam">
		<table>
		 <tr>
		    <td>号码</td>
		    <td>名字</td>
		    <td>得分</td>
		    <td>犯规</td>
		    </tr>
		<%
		if (listTeam1!=null){
		    for (int i=0;i<listTeam1.size();i++){
		        aPlayer=(PlayerBean)listTeam1.get(i);%>
				<tr>
					<td><%=aPlayer.getNumber() %></td>
					<td><%=aPlayer.getName() %></td>
					<td>
						<div id="<%=aPlayer.getPlayerID() %>score">0</div>
					    <input type="button" value="得分+1"onclick="score(<%=aPlayer.getPlayerID()%>,<%=HomeTeamID%>,<%=AwayTeamID%>)">
					</td>
					<td>
					
						<div id="<%=aPlayer.getPlayerID() %>foul">0</div>
					    <input type="button" value="犯规+1"onclick="foul(<%=aPlayer.getPlayerID()%>,<%=HomeTeamID%>,<%=AwayTeamID%>)">
					
                    </td>
				</tr>
				<%
					}
					}
				%>
		</table>
		</div>
		
		<div id="awayteam">
		<table>
		 <tr>
		    <td>号码</td>
		    <td>名字</td>
		    <td>得分</td>
		    <td>犯规</td>
		    </tr>
		<%
		if (listTeam2!=null){
		    for (int i=0;i<listTeam2.size();i++){
		        aPlayer=(PlayerBean)listTeam2.get(i);%>
				<tr>
					<td><%=aPlayer.getNumber() %></td>
					<td><%=aPlayer.getName() %></td>
					<td>
						<div id="<%=aPlayer.getPlayerID() %>score">0</div>
					    <input type="button" value="得分+1"onclick="score(<%=aPlayer.getPlayerID()%>,<%=HomeTeamID%>,<%=AwayTeamID%>)">
					</td>
					<td>
						<div id="<%=aPlayer.getPlayerID() %>foul">0</div>
					    <input type="button" value="犯规+1"onclick="foul(<%=aPlayer.getPlayerID()%>,<%=HomeTeamID%>,<%=AwayTeamID%>)">
                    </td>
				</tr>
				<%
					}
					}
				%>
		</table>
		</div>

		<div id="footer">哈尔滨工业大学-计算机科学与技术学院-光熙杯</div>
	</div>
</body>
</html>
