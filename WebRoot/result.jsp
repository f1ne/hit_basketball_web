<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="indexNTable.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="fileUpload.css" type="text/css" rel="stylesheet"/>
<title>�ļ��ϴ����</title>
</head>
<body>
<div id="resultPanel">
	<div><span>�ϴ��ļ��б�:</span></div>
<%
	
	FileUploadStatus fUploadStatus=BackGroundService.getStatusBean(request);

	for(int i=0;i<fUploadStatus.getUploadFileUrlList().size();i++){
		String fileName=(String)fUploadStatus.getUploadFileUrlList().get(i);
		String url=fUploadStatus.getBaseDir()+"/"+fileName;
	%>
		<div><a href="<%=url%>"><%=fileName%></a></div>
	<%
	}
	if (fUploadStatus.getStatus().indexOf("����")>=0){
	%>
		<div id='errorArea'><span>������Ϣ:<%=fUploadStatus.getStatus() %></span></div>
	<%	
	}
	else if (fUploadStatus.getCancel()){
	%>
		<div id='normalMessageArea'><span>�����û�ȡ���ϴ��������Ѿ��ϴ����ļ�����ɾ��</span></div>
	<%
	}
	BeanControler.getInstance().removeUploadStatus(request.getRemoteAddr());

%>
</div>
</body>
</html>