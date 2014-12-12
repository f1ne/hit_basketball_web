<%@ page language="java" import="java.util.*,com.hit.cs.basketball.PlayerBean" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import ="com.hit.cs.basketball.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>search</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- link calendar resources 日历插件 -->
	<link href="fileUpload.css" type="text/css" rel="stylesheet"/>
   <link rel="stylesheet" type="text/css" href="tcal.css" />
	<script language="javascript" src="tcal.js"></script> 
	<script language="javascript"src="Search.js"></script>
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
    </tr>
    </tbody></table>
  </div>
<hr>
<center>
  <h1><span style="color:white;">结果查询</span></h1>
  <p><em><span style="color:white;">你可以在这个页面查询队员姓名，队伍编号，按照日期查找当日比赛结果，</span></em></p>
<form id="form1" name="input" method="post"action="<%=path %>/GetPlayerDataByDate.action">
	<h3><span style="color:white;">按队员查询</span></h3>
	 <span style="color:white;">输入队员名称：</span>
	<input type="text" id="PlayerName" name="PlayerName"  />
	<span style="color:white;">输入比赛日期：</span>
	<input type="text" style="color:white;" id="RaceDate" name="RaceDate" class="tcal" />
	<input type="button" value="提交" onclick="searchPlayerData()"/>
</form>
<div id="resultPanel" style="background-color:  #66BB66">
<h2><span style="color:black;">查询结果：</span></h2>
  <!--  %out.println("结果"); %-->
     <br>
     <%
          String PlayerName;
          int Score;
          int Foul;
          PlayerBean player=new PlayerBean();
          player=(PlayerBean)request.getAttribute("player");
          if (player!=null){
              PlayerName=player.getName();
              Score=player.getScore();
              Foul=player.getFouls();
          }else{
              PlayerName="null";
              Score=0;
              Foul=0;
          }
          
      %>
      <table id="playerdatatable" border="1">
          <tr>
             <td><span style='color:black;'>球员姓名</span></td>
			 <td><span style='color:black;'>球员ID</span></td>
			 <td><span style='color:black;'>球队ID</span></td>
			 <td><span style='color:black;'>球队名</span></td>
			 <td><span style='color:black;'>所属实验室</span></td>
             <td><span style='color:black;'>当日得分</span></td>
             <td><span style='color:black;'>当日犯规</span></td>
          </tr>
          
      </table>
      </div>
      <hr>
      <div id="resultPanel" style="background-color:  #66BB66">
      <h1><span style="color:black;">排行榜：</span></h1>
      <br>
  <br>
      <div id=ScoreRanking>
		<table>
			<tr>
			    <td><span style='color:black;'>排名</span></td>
				<td><span style='color:black;'>球员姓名</span></td>
				<td><span style='color:black;'>号码</span></td>
				<td><span style='color:black;'>得分</span></td>
				<td><span style='color:black;'>比赛场次</span></td>
				<td><span style='color:black;'>所属球队</span></td>
			</tr>
			<%
			      ArrayList<PlayerBean> scoreRankList=new ArrayList<PlayerBean>();
			      scoreRankList=DataBaseBean.getPlayersOrderedByScore();
			      for (int i=0;i<scoreRankList.size();i++){
			          %>
			<tr>
			    <td><span style='color:black;'><%=i+1 %></span></td>
				<td><span style='color:black;'><%=scoreRankList.get(i).getName() %></span></td>
				<td><span style='color:black;'><%=scoreRankList.get(i).getNumber()%></span></td>
				<td><span style='color:black;'><%=scoreRankList.get(i).getScore() %></span></td>
				<td><span style='color:black;'><%=scoreRankList.get(i).getNumberOfMatches() %></span></td>
				<td><span style='color:black;'><%=scoreRankList.get(i).getTeamID() %></span></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	</div>
	</center>
  </body>
</html>