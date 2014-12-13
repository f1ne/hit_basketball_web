<%@ page language="java" import="java.util.*,com.hit.cs.basketball.*"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>比赛技术统计</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	div#container{width:1400px;align:center}
	div#header{background-color:#99bbbb;text-align:center}
	div#hometeam{background-color:#ffff99;height:800px;width:700px;float:left}
	div#awayteam{background-color:#eeeeee;height:800px;width:700px;float:left}
	div#footer{background-color:#99bbbb;clear:both;text-align:center}
	h1{margin-bottom:0}
	h2{margin-bottom:0;font-size:14px}
	h3{text-align:center}
	</style>

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
        GameBean game=(GameBean)request.getAttribute("game");
        TeamBean homeTeam=(TeamBean)request.getAttribute("Team1");
        TeamBean awayTeam=(TeamBean)request.getAttribute("Team2");
        PlayerBean aPlayer;
     %>
  <body>
  <div id="menu">
   <table border="0" cellpadding="0" style="margin-left:0px;">
   <tbody><tr>
      <td style="padding-right:50px;"><img src="${pageContext.request.contextPath}/image/logo.png" width="240px;" height="50px;"/> </td>
      <td style="padding-right:50px;"><img src="${pageContext.request.contextPath}/image/logo2.gif" width="240px;" height="50px;"/> </td> 
      <td><a href="Login.action" style="font-size:14px;">请登录<!--<img src="images2011/menu_4.png" width="57" height="57"  border="0" />--></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    </tbody>
    </table>
    <hr>
    <table border="0" cellpadding="0" style="margin-left:0px;">
    <tbody><tr>
    <td><a href="returnMyJsp.action" style="font-size:14px;">主页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="GetNotification.action" style="font-size:14px;">近期赛事通告</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="GetSchedule.action" style="font-size:14px;">比赛日程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="enterLiveBegin.action" style="font-size:14px;">赛事实时信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="SearchBegin.action" style="font-size:14px;">数据搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>     
    </tr>
    </tbody></table>
  </div>
<hr>
    
	<div id="container">
		<div id="header">
			<h1><font size=14>比赛技术统计</font></h1><br>
			<table align="center" border="2">
				<tr>
					<td><h3>主队ID</h3></td>
					<td><h3>主队</h3></td>
					<td><h3>主队得分</h3></td>
					<td><h3>客队得分</h3></td>
					<td><h3>客队</h3></td>
					<td><h3>客队ID</h3></td>
					<td><h3>比赛日期</h3></td>	
				</tr>
				<tr>
					<td><h3><%=homeTeam.getTeamID() %></h3></td>
					<td><h3><%=homeTeam.getTeamLab() %>:<%=homeTeam.getTeamName() %></h3></td>
					<td><h3><%=game.getHomeScore() %></h3></td>
					<td><h3><%=game.getAwayScore() %></h3></td>
					<td><h3><%=awayTeam.getTeamLab() %>:<%=awayTeam.getTeamName() %></h3></td>
					<td><h3><%=awayTeam.getTeamID() %></h3></td>
					<td><h3><%=game.getDate() %></h3></td>
				</tr>
			</table>
		</div>
		<div id="hometeam">
			<table align="center" border="1">
				<tr>
					<td><h3>主队(HomeTeam)</h3></td>
					<td><div id=hometeamid>
							<h3><%=HomeTeamID %></h3>
						</div></td>
					<td>得分：</td>
					<td><div id=hometeamscore>
							<h3><%=game.getHomeScore() %></h3>
						</div></td>
				</tr>
			</table>
			<table align="center" border="1">
				<tr>

					<td><h3>号码</h3></td>
					<td><h3>名字</h3></td>
					<td><h3>得分</h3></td>
					<td><h3>犯规</h3></td>
					<td><h3>性别</h3></td>
					<td><h3>年龄</h3></td>
					<td><h3>是否三好杯</h3></td>
					<td><h3>学历</h3></td>
				</tr>
				<%
		if (listTeam1!=null){
		    for (int i=0;i<listTeam1.size();i++){
		        aPlayer=(PlayerBean)listTeam1.get(i);%>
				<tr>
					<td><%=aPlayer.getNumber() %></td>
					<td><%=aPlayer.getName() %></td>
					<td>
						<div id="<%=aPlayer.getPlayerID() %>score"><%=aPlayer.getScore() %></div>
					</td>
					<td>
						<div id="<%=aPlayer.getPlayerID() %>foul"><%=aPlayer.getFouls() %></div>
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
		<table align="center" border="1">
		  <tr>
		    <td><h3>客队(AwayTeam)</h3></td>
		    <td><div id=awayteamid><h3><%=AwayTeamID %></h3></div></td>
		    <td><h3>得分：</h3></td>
		    <td><div id=awayteamscore><h3><%=game.getAwayScore() %></h3></div></td>
		  </tr>
		</table>
		<table align="center" border="1">
		 <tr>
		    <td><h3>号码</h3></td>
		    <td><h3>名字</h3></td>
		    <td><h3>得分</h3></td>
		    <td><h3>犯规</h3></td>
			<td><h3>性别</h3></td>
			<td><h3>年龄</h3></td>
			<td><h3>是否三好杯</h3></td>
			<td><h3>学历</h3></td>
		 </tr>
		<%
		if (listTeam2!=null){
		    for (int i=0;i<listTeam2.size();i++){
		        aPlayer=(PlayerBean)listTeam2.get(i);%>
				<tr>
					<td><%=aPlayer.getNumber() %></td>
					<td><%=aPlayer.getName() %></td>
					<td>
						<div id="<%=aPlayer.getPlayerID() %>score"><%=aPlayer.getScore() %></div>
					</td>
					<td>
						<div id="<%=aPlayer.getPlayerID() %>foul"><%=aPlayer.getFouls() %></div>
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