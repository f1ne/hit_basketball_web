<%@ page language="java" import="java.util.*,com.hit.cs.basketball.PlayerBean" pageEncoding="UTF-8"%>
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
	div#container{width:1400px;align:center}
	div#header{background-color:#99bbbb;text-align:center}
	div#hometeam{background-color:#ffff99;height:800px;width:700px;float:left}
	div#awayteam{background-color:#eeeeee;height:800px;width:700px;float:left}
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
    <%int cpl=(Integer)session.getAttribute("CPL"); %>
    <td><a href="returnMyJspM.action" style="font-size:14px;">主页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="GetNotificationM.action" style="font-size:14px;">近期赛事通告</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="GetScheduleM.action" style="font-size:14px;">比赛日程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="enterRecordingBegin.action" style="font-size:14px;">赛事实时信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="SearchMBegin.action" style="font-size:14px;">数据搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      <%if(cpl==1){%><td><a href="AddManager.action" style="font-size:14px;">管理员注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><%} %>
      <%if(cpl<=2) {%><td><a href="AddTeam.action" style="font-size:14px;">队伍注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>  <%} %>    
    <td><a href="uploadPic.action" style="font-size:14px;">上传图片</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    </tbody></table>
  </div>
<hr>
    
	<div id="container">
		<div id="header">	    
			<h1><font size=14>现场比赛记录</font></h1>
			<table border="1" align="center">
			    <tr>
			        <td>比赛状态改变:</td>
			        <td>
			            <input type=button value="第一节" onclick="changeGameState(<%=HomeTeamID%>,<%=AwayTeamID%>,1)">
			        </td>
			        <td>
			            <input type=button value="第二节" onclick="changeGameState(<%=HomeTeamID%>,<%=AwayTeamID%>,2)">
			        </td>
			        <td>
			            <input type=button value="中场女生投篮比赛" onclick="changeGameState(<%=HomeTeamID%>,<%=AwayTeamID%>,3)">
			        </td>
			        <td>
			            <input type=button value="第三节" onclick="changeGameState(<%=HomeTeamID%>,<%=AwayTeamID%>,4)">
			        </td>
			        <td>
			            <input type=button value="第四节" onclick="changeGameState(<%=HomeTeamID%>,<%=AwayTeamID%>,5)">
			        </td>
			        <td>
			            <input type=button value="加时赛" onclick="changeGameState(<%=HomeTeamID%>,<%=AwayTeamID%>,6)">
			        </td>
			        <td>
			            <input type=button value="结束比赛" onclick="changeGameState(<%=HomeTeamID%>,<%=AwayTeamID%>,7)">
			        </td>
			    </tr>
			    <tr>
			        <td>当前状态</td>
			        <td><div id=gamestate>未进行</div></td>
					<input type="hidden" id="gamestateint"  name="gamestateint" value="0">
			    </tr>
			    <tr>
			        <div id="gamerule">
			        <p>
			        1、各参赛单位上场运动员中：男教师不少于2人，男学生不多于2人，学生运动员须为在读硕士生，博士生（实验中心允许有至多同时2名本科生上场；教研室允许有同时1名本科生上场；其它单位不允许本科生上场)。
			        </p>
			        <p>
			        2、 对于参加学校“三好杯”篮球赛（往年和今年）的学生，各参赛单位允许且仅允许在第三小节至多同时1名队员上场。
			        </p>
			        <p>
			        3、比赛中犯规满5次者将被罚下场，若因犯规罚下，导致某队场上男教师人数小于规定人数，则可增补女运动员代替上场，此时，女运动员不再享有任何特殊政策（得分不加倍、男运动员可对其防守）
			        </p>
			        </div>
			        
			    </tr>
			</table>
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
			<td>规则</td>
		</tr>
		<%
		if (listTeam1!=null){
		    for (int i=0;i<listTeam1.size();i++){
		        aPlayer=(PlayerBean)listTeam1.get(i);%>
				<tr id="<%=aPlayer.getPlayerID()%>">
					<td><%=aPlayer.getNumber() %></td>
					<td><%=aPlayer.getName() %></td>
					<td>
						<div id="<%=aPlayer.getPlayerID() %>score">0</div>
					    <input type="button" id="<%=aPlayer.getPlayerID()%>scorebutton" disabled="true" value="得分+1"onclick="score(<%=aPlayer.getPlayerID()%>,<%=HomeTeamID%>,<%=AwayTeamID%>)">
					    <input type="button" id="<%=aPlayer.getPlayerID()%>cancelscorebutton"  disabled="true" value="撤销得分-1"onclick="cancelScore(<%=aPlayer.getPlayerID()%>,<%=HomeTeamID%>,<%=AwayTeamID%>)">
					</td>
					<td>
					
						<div id="<%=aPlayer.getPlayerID() %>foul">0</div>
					    <input type="button" id="<%=aPlayer.getPlayerID()%>foulbutton"  disabled="true" value="犯规+1"onclick="foul(<%=aPlayer.getPlayerID()%>,<%=HomeTeamID%>,<%=AwayTeamID%>)">
					    <input type="button" id="<%=aPlayer.getPlayerID()%>cancelfoulbutton" disabled="true"  value="撤销犯规-1"onclick="cancelFoul(<%=aPlayer.getPlayerID()%>,<%=HomeTeamID%>,<%=AwayTeamID%>)">
                    </td>
                    <td>
                        <div id="<%=aPlayer.getPlayerID() %>playerstate">替补</div>
                        <input type="button" id="<%=aPlayer.getPlayerID() %>changeplayerstate" value="上场" onclick="changeplayerstate(<%=aPlayer.getPlayerID()%>,<%=HomeTeamID%>,<%=AwayTeamID%>)">
                    </td>
					<td id="<%=aPlayer.getPlayerID() %>Sex"><%=aPlayer.getSex() %></td>
					<td id="<%=aPlayer.getPlayerID() %>Age"><%=aPlayer.getAge() %></td>
					<td id="<%=aPlayer.getPlayerID() %>IsSHB"><%=aPlayer.getIsSHB() %></td>
					<td id="<%=aPlayer.getPlayerID() %>Position"><%=aPlayer.getPosition() %></td>
					<td>
					    <div id="<%=aPlayer.getPlayerID() %>rule"></div>
					</td>
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
			<td>规则</td>
		    </tr>
		<%
		if (listTeam2!=null){
		    for (int i=0;i<listTeam2.size();i++){
		        aPlayer=(PlayerBean)listTeam2.get(i);%>
				<tr id="<%=aPlayer.getPlayerID()%>">
					<td><%=aPlayer.getNumber() %></td>
					<td><%=aPlayer.getName() %></td>
					<td>
						<div id="<%=aPlayer.getPlayerID() %>score">0</div>
					    <input type="button" id="<%=aPlayer.getPlayerID()%>scorebutton" disabled="true"  value="得分+1"onclick="score(<%=aPlayer.getPlayerID()%>,<%=HomeTeamID%>,<%=AwayTeamID%>)">
					    <input type="button" id="<%=aPlayer.getPlayerID()%>cancelscorebutton" disabled="true"  value="撤销得分-1"onclick="cancelScore(<%=aPlayer.getPlayerID()%>,<%=HomeTeamID%>,<%=AwayTeamID%>)">
					</td>
					<td>
						<div id="<%=aPlayer.getPlayerID() %>foul">0</div>
					    <input type="button" id="<%=aPlayer.getPlayerID()%>foulbutton" disabled="true"  value="犯规+1"onclick="foul(<%=aPlayer.getPlayerID()%>,<%=HomeTeamID%>,<%=AwayTeamID%>)">
                        <input type="button" id="<%=aPlayer.getPlayerID()%>cancelfoulbutton" disabled="true"  value="撤销犯规-1"onclick="cancelFoul(<%=aPlayer.getPlayerID()%>,<%=HomeTeamID%>,<%=AwayTeamID%>)">   
                    </td>
                    <td>
                        <div id="<%=aPlayer.getPlayerID() %>playerstate">替补</div>
                        <input type="button" id="<%=aPlayer.getPlayerID() %>changeplayerstate" value="上场" onclick="changeplayerstate(<%=aPlayer.getPlayerID()%>,<%=HomeTeamID%>,<%=AwayTeamID%>)">
                    </td>
					<td id="<%=aPlayer.getPlayerID() %>Sex"><%=aPlayer.getSex() %></td>
					<td id="<%=aPlayer.getPlayerID() %>Age"><%=aPlayer.getAge() %></td>
					<td id="<%=aPlayer.getPlayerID() %>IsSHB"><%=aPlayer.getIsSHB() %></td>
					<td id="<%=aPlayer.getPlayerID() %>Position"><%=aPlayer.getPosition() %></td>
					<td>
					    <div id="<%=aPlayer.getPlayerID() %>rule"></div>
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
