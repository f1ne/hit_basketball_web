<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>RecordingDoor</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     输入两个对阵球队名字
     <form id="teamid" method="post" action="<%=path%>/enterRecording">
        <font size=6>球队1</font>
     	<input type="text" id="TeamID1" name="TeamID1">
     	<br/>
     	<font size=6>球队2</font>
     	<input type="text" id="TeamID2" name="TeamID2">
     	<br/>
     	<input type="submit" name="submit" value="进入现场记录">
     </form>
  </body>
</html>
