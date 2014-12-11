<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
   <h1><span style="color:white;">结果查询</span></h1>
  <p><em><span style="color:white;">你可以在这个页面查询队员姓名，队伍编号，按照日期查找当日比赛结果，</span></em></p>
<form id="form1" name="input" method="post"action="<%=path %>/GetPlayerDataByDateT.action">
	<h3><span style="color:white;">按队员查询</span></h3>
	 <span style="color:white;">输入队员名称：</span>
	<input type="text" id="PlayerName" name="PlayerName"  />
	<span style="color:white;">输入比赛日期：</span>
	<input type="text" id="RaceDate" name="RaceDate" />
	<input type="submit" value="提交" />
</form>
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
      <table>
          <tr>
             <td><span style='color:white;'>球员姓名</span></td>
             <td><span style='color:white;'>当日得分</span></td>
             <td><span style='color:white;'>当日犯规</span></td>
          </tr>
          
          <tr>
             <td><span style='color:white;'><%=PlayerName %></span></td>
             <td><span style='color:white;'><%=Score %></span></td>
             <td><span style='color:white;'><%=Foul %></span></td>
          </tr>
      </table>
      <div id=ScoreRanking>
		<table>
			<tr>
			    <td><span style='color:white;'>排名</span></td>
				<td><span style='color:white;'>球员姓名</span></td>
				<td><span style='color:white;'>号码</span></td>
				<td><span style='color:white;'>得分</span></td>
				<td><span style='color:white;'>比赛场次</span></td>
				<td><span style='color:white;'>所属球队</span></td>
			</tr>
			<%
			      ArrayList<PlayerBean> scoreRankList=new ArrayList<PlayerBean>();
			      scoreRankList=DataBaseBean.getPlayersOrderedByScore();
			      for (int i=0;i<scoreRankList.size();i++){
			          %>
			<tr>
			    <td><span style='color:white;'><%=i+1 %></span></td>
				<td><span style='color:white;'><%=scoreRankList.get(i).getName() %></span></td>
				<td><span style='color:white;'><%=scoreRankList.get(i).getNumber()%></span></td>
				<td><span style='color:white;'><%=scoreRankList.get(i).getScore() %></span></td>
				<td><span style='color:white;'><%=scoreRankList.get(i).getNumberOfMatches() %></span></td>
				<td><span style='color:white;'><%=scoreRankList.get(i).getTeamID() %></span></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
  </body>
</html>
