<%@ page language="java" import="java.util.*,com.hit.cs.basketball.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
   <title>光熙杯篮球赛管理系统</title>
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
<font size=5><span style="color:white;">输入两个对阵球队ID</span></font> 
     <form id="teamid" method="post" action="<%=path%>/enterLiveT.action">
        <br><font size=3><span style="color:white;">主队(Home)</span></font>
     	<select id="TeamID1" name="TeamID1">
			<option disabled="disabled" value="" selected>-请选择 -</option> 
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
				</select>
     	<br/><br>
     	<font size=3><span style="color:white;">客队(Away)</span></font>
     	 <select id="TeamID2" name="TeamID2">
			<option disabled="disabled" value="" selected>-请选择 -</option> 
			<%
			  for(String teamopt1:T){  
			%>
			<option value="<%=teamopt1%>">
				<%=teamopt1%>
				</option>
				<%
			
					}
				%>
				</select>
     	<br/><br>
     	<input type="submit" name="submit" value="进入现场记录">
     </form>
	 <!-- 获得正在进行的比赛列表 -->
     
     <%
         ArrayList<GameBean> listGame=DataBaseBean.getRunningGames();
     %>    
     <table border="1"> 
     <tr>
         <td><span style='color:white;'>主队ID</span></td>
         <td><span style='color:white;'>主队</span></td>
         <td><span style='color:white;'>主队得分</span></td>
         <td><span style='color:white;'>客队得分</span></td>
         <td><span style='color:white;'>客队</span></td>
         <td><span style='color:white;'>客队ID</span></td>
         <td><span style='color:white;'>比赛日期</span></td>
		 <td><span style='color:white;'>比赛状态</span></td>
         <td><span style='color:white;'>操作</span></td>
     </tr>   
     <%
         for (int i=0;i<listGame.size();i++){
             GameBean game=listGame.get(i);
             TeamBean homeTeam;
             TeamBean awayTeam;
             homeTeam=Basketball.getTeamByTeamID(game.getHomeTeamID());
             awayTeam=Basketball.getTeamByTeamID(game.getAwayTeamID());
			 String gameState=Basketball.resolveState(game.getState());
			 
             %>
             <tr>
                 <td><span style='color:white;'><%=homeTeam.getTeamID() %></span></td>
                 <td><span style='color:white;'><%=homeTeam.getTeamLab() %>:<%=homeTeam.getTeamName() %></span></td>
                 <td><span style='color:white;'><%=game.getHomeScore() %></span></td>
                 <td><span style='color:white;'><%=game.getAwayScore() %></span></td>
                 <td><span style='color:white;'><%=awayTeam.getTeamLab() %>:<%=awayTeam.getTeamName() %></span></td>
                 <td><span style='color:white;'><%=awayTeam.getTeamID() %></span></td>
                 <td><span style='color:white;'><%=game.getDate() %></span></td>
				 <td><span style='color:white;'><%=gameState%></span></td>
                 <td>
                     <form  method="post" action="<%=path%>/enterLiveT.action">
                     <input type="hidden" id="TeamID1" name="TeamID1" value=<%=homeTeam.getTeamID() %> style="visibility:hidden">
                     <input type="hidden" id="TeamID2" name="TeamID2" value=<%=awayTeam.getTeamID() %> style="visibility:hidden">
                     <input type="hidden" id="RaceDate" name="RaceDate" value=<%=game.getDate() %> style="visibility:hidden">
                     <input type="submit" name="submit" value="进入赛事直播">
                     </form>
                 </td>
             </tr>
             <%
         }
      %>
      </table>
  </body>
</html>
