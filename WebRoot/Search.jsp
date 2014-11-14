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
  <body background="2image/background.jpg">
  <div id="menu">
   <table border="0" cellpadding="0" style="margin-left:0px;">
   <tbody><tr>
      <td style="padding-right:50px;"><img src="${pageContext.request.contextPath}/image/logo.png" width="240px;" height="50px;"/> </td>
      <td style="padding-right:50px;"><img src="${pageContext.request.contextPath}/image/logo2.gif" width="240px;" height="50px;"/> </td> 
      <td><a href="Login.action" style="font-size:14px;">请登录<!--<img src="images2011/menu_4.png" width="57" height="57"  border="0" />--></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td><a href="AddTeam.action" style="font-size:14px;">队伍注册<!--<img src="images2011/menu_1.png" width="57" height="57" border="0" / >--></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    </tbody>
    </table>
    <hr>
    <table border="0" cellpadding="0" style="margin-left:0px;">
    <tbody><tr>
    <td><a href="returnMyJsp.action" style="font-size:14px;">主页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="GetSchedule.action" style="font-size:14px;">近期赛事通告</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="GetSchedule.action" style="font-size:14px;">比赛日程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="enterLiveBegin.action" style="font-size:14px;">赛事实时信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="SearchBegin.action" style="font-size:14px;">数据搜索</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>     
    </tr>
    </tbody></table>
  </div>
<hr>
  <h1><span style="color:white;">结果查询</span></h1>
  <p><em><span style="color:white;">你可以在这个页面查询队员姓名，队伍编号，按照日期查找当日比赛结果，</span></em></p>
<form id="fomr1" name="input" method="get"action="<%=path %>/GetName">
	<h3><span style="color:white;">按队员查询</span></h3>
	 <span style="color:white;">输入队员名称：</span>
	<input type="text" name="teamername" />

</form>
<form name="input"  method="get" action="<%=path %>/GetDate">

	<span style="color:white;">输入比赛日期：</span>
	<input type="text" name="racedate" />
	<input type="submit" value="提交" />
</form>
  <!--  %out.println("结果"); %-->
     <br>
     <%
 // ArrayList list=(ArrayList)request.getAttribute("list");
    // PlayerBean Player;
   //  String Score=(String)request.getAttribute("Score");
   //  out.println("得分"+Score+"<br>");
     
      %>

  </body>
</html>
