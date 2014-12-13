<%@ page language="java" import="java.util.*,com.hit.cs.basketball.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
    <!--  td><a href="fileUpload.html" style="font-size:14px;">上传图片2</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td-->
    </tr>
    </tbody></table>
  </div>
<hr>
<table border="0" cellpadding="0" style="margin-left:0px;">
    <tbody><tr>
    <td style="padding-right:50px;"><img src="${pageContext.request.contextPath}/image/ball.png" width="620px;" height="356px;"/> </td> 
     </tr>
    </tbody></table>
   <br>
   <!-- 获得正在进行的比赛列表 -->
     
     <%
         ArrayList<GameBean> listGame=DataBaseBean.getEndGames();
     %>    
     <table border="1"> 
     <tr>
          <td><span style='color:white;'>已结束的比赛</span></td>
     </tr>
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
                     <form  method="post" action="<%=path%>/GameStatistic.action">
                     <input type="hidden" id="TeamID1" name="TeamID1" value=<%=homeTeam.getTeamID() %> style="visibility:hidden">
                     <input type="hidden" id="TeamID2" name="TeamID2" value=<%=awayTeam.getTeamID() %> style="visibility:hidden">
                     <input type="hidden" id="RaceDate" name="RaceDate" value=<%=game.getDate() %> style="visibility:hidden">
                     <input type="submit" name="submit" value="查看数据统计">
                     </form>
                 </td>
             </tr>
             <%
         }
      %>
      </table>
  </body>
</html>
