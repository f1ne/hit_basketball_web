<%@ page language="java" import="java.util.*,com.hit.cs.basketball.PlayerBean" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>比赛现场实时技术统计</title>
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
	<script language="javascript"src="Live.js">
	
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
  <%
        ArrayList<PlayerBean> listTeam1=(ArrayList)request.getAttribute("listTeam1");
        ArrayList<PlayerBean> listTeam2=(ArrayList)request.getAttribute("listTeam2");
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
  <body onload="refresh(<%=HomeTeamID %>,<%=AwayTeamID %>)">
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
    <td><a href="GetNotificationT.action" style="font-size:14px;">近期赛事通告</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="GetScheduleT.action" style="font-size:14px;">比赛日程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="enterLiveBeginT.action" style="font-size:14px;">赛事实时信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="SearchTBegin.action" style="font-size:14px;">数据搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      <td><a href="ShowPlayer.action" style="font-size:14px;">查看球员</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>      
    </tr>
    </tbody></table>
  </div>
<hr>
     <div id="container">
		<div id="header">
			<h1><font size=14>比赛现场实时技术统计</font></h1><br>注：点击刷新才能更新实时数据
			<input type="button" value="刷新" onclick="refresh(<%=HomeTeamID %>,<%=AwayTeamID %>)">
		</div>
		<div id="hometeam">
		<table border="1">
		  <tr>
		    <td>主队(HomeTeam)</td>
		    <td><div id=hometeamid><%=HomeTeamID %></div></td>
		    <td>得分：</td>
		    <td><div id=hometeamscore>0</div></td>
		  </tr>
		</table>
		<table border="1">
		 <tr>
		    <td>号码</td>
		    <td>名字</td>
		    <td>得分</td>
		    <td>犯规</td>
		    <td>球员状态</td>
			<td>性别</td>
			<td>年龄</td>
			<td>是否三好杯</td>
			<td>学历</td>
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
					</td>
					<td>				
						<div id="<%=aPlayer.getPlayerID() %>foul">0</div>
                    </td>
					<td>
                        <div id="<%=aPlayer.getPlayerID() %>playerstate">替补</div>
                   
                    </td>
					<td><%=aPlayer.getSex() %></td>
					<td><%=aPlayer.getAge() %></td>
					<td><%=aPlayer.getIsSHB() %></td>
					<td><%=aPlayer.getPosition() %></td>
				</tr>
				<%
					}
					}
				%>
		</table>
		</div>
		
		<div id="awayteam">
		<table border="1">
		  <tr>
		    <td>客队(AwayTeam)</td>
		    <td><div id=awayteamid><%=AwayTeamID %></div></td>
		    <td>得分：</td>
		    <td><div id=awayteamscore>0</div></td>
		  </tr>
		</table>
		<table border="1">
		 <tr>
		    <td>号码</td>
		    <td>名字</td>
		    <td>得分</td>
		    <td>犯规</td>
		    <td>球员状态</td>
			<td>性别</td>
			<td>年龄</td>
			<td>是否三好杯</td>
			<td>学历</td>
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
					</td>
					<td>
						<div id="<%=aPlayer.getPlayerID() %>foul">0</div>
                    </td>
					<td>
                        <div id="<%=aPlayer.getPlayerID() %>playerstate">替补</div>
                   
                    </td>
					<td><%=aPlayer.getSex() %></td>
					<td><%=aPlayer.getAge() %></td>
					<td><%=aPlayer.getIsSHB() %></td>
					<td><%=aPlayer.getPosition() %></td>
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
