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
	<script language="javascript">
	var xmlHttp;
	/*创建XMLHttpRequest对象*/
	function createXmlHttp(){
		if(windows.XMLHttpRequest){
			xmlHttp=new XMLHttpRequest();
		}else{
			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	/*处理服务器响应结果*/
	function processReponse(){
		if (xmlHttp.readyState==4){
			if (xmlHttp.status==200){
			}
		}
	}
	/*发送客户端的请求*/
	function sendRequest(url){
		createXmlHttp();
		xmlHttp.open("Get",url,true);
		xmlHttp.onreadystatechange=processResponse;
		xmlHttp.send(null);
	}
	/*增加得分*/
	function score(playerID){
	    //当前页面的数据自加1
	    var preScore=parseInt(document.getElementById(playerID+"score").innerText);
	    document.getElementById(playerID+"score").innerText=preScore+1;
	    var url="Record?playerID="+playerID+"&event=score";
	    console.log(url);
	    sendRequest(url);
	    
	}
	/*增加犯规*/
	function foul(playerID){
		//当前页面的犯规数据自动加1
		var prefoul=parseInt(document.getElementById(playerID+"foul").innerText);
	    document.getElementById(playerID+"foul").innerText=prefoul+1;
	    var url="Record?playerID="+playerID+"&event=reb";
	    console.log(url);
	    sendRequest(url);
	}
	</script>
  </head>
  
  <body>
    <%
        ArrayList<PlayerBean> listTeam1=(ArrayList)request.getAttribute("listTeam1");
        ArrayList<PlayerBean> listTeam2=(ArrayList)request.getAttribute("listTeam2");
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
					<form id="score" method="post" action=<%=path %>/addscore>
						<div id="<%=aPlayer.getPlayerID() %>score">0</div>
					    <input type="button" value="得分+1"onclick="score(<%=aPlayer.getPlayerID()%>)">
					</form>
					</td>
					<td>
					<form id="fouls" method="post" action=<%=path %>/addfoul>
						<div id="<%=aPlayer.getPlayerID() %>foul">0</div>
					    <input type="button" value="犯规+1"onclick="foul(<%=aPlayer.getPlayerID()%>)">
					</form>
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
					<form id="score" method="post" action=<%=path %>/addscore>
						<div id="<%=aPlayer.getPlayerID() %>score">0</div>
					    <input type="button" value="得分+1"onclick="score(<%=aPlayer.getPlayerID()%>)">
					</form>
					</td>
					<td>
					<form id="fouls" method="post" action=<%=path %>/addfoul>
						<div id="<%=aPlayer.getPlayerID() %>foul">0</div>
					    <input type="button" value="犯规+1"onclick="foul(<%=aPlayer.getPlayerID()%>)">
					</form>
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
