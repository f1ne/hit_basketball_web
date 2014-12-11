<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="indexNTable.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="fileUpload.css" type="text/css" rel="stylesheet"/>
<title>文件上传结果</title>
</head>
<body>
<div id="resultPanel">
	<div><span>上传文件列表:</span></div>
<%
	
	FileUploadStatus fUploadStatus=BackGroundService.getStatusBean(request);

	for(int i=0;i<fUploadStatus.getUploadFileUrlList().size();i++){
		String fileName=(String)fUploadStatus.getUploadFileUrlList().get(i);
		String url=fUploadStatus.getBaseDir()+"/"+fileName;
	%>
		<div><a href="<%=url%>"><%=fileName%></a></div>
	<%
	}
	if (fUploadStatus.getStatus().indexOf("错误")>=0){
	%>
		<div id='errorArea'><span>错误信息:<%=fUploadStatus.getStatus() %></span></div>
	<%	
	}
	else if (fUploadStatus.getCancel()){
	%>
		<div id='normalMessageArea'><span>由于用户取消上传，所以已经上传的文件均被删除</span></div>
	<%
	}
	BeanControler.getInstance().removeUploadStatus(request.getRemoteAddr());

%>
</div>
</body>
</html>