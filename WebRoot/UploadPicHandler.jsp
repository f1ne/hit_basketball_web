<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="indexNTable.*"%>
<%@ page import="java.io.*,java.awt.image.*,com.sun.image.codec.jpeg.*,java.sql.*,com.jspsmart.upload.*,java.util.*"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UploadPicHandler.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script>  
function setImagePreview() {          
    var docObj=document.getElementById("doc");           
    var imgObjPreview=document.getElementById("preview");  
    if(docObj.files && docObj.files[0]){                          
        //����£�ֱ����img����                          
        imgObjPreview.style.display = 'block';                          
        imgObjPreview.style.width = '300px';                          
        imgObjPreview.style.height = '120px';                                              
        //imgObjPreview.src = docObj.files[0].getAsDataURL();  
        //���7���ϰ汾�����������getAsDataURL()��ʽ��ȡ����Ҫһ�·�ʽ          
        imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);  
     }else{                          
         //IE�£�ʹ���˾�                          
         docObj.select();                          
         var imgSrc = document.selection.createRange().text;                          
         var localImagId = document.getElementById("localImag");  
         //�������ó�ʼ��С                          
         localImagId.style.width = "250px";                          
         localImagId.style.height = "200px";  
        //ͼƬ�쳣�Ĳ�׽����ֹ�û��޸ĺ�׺��α��ͼƬ  
        try{                                  
            localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";                                  
            localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;                          
        }catch(e){                                  
            alert("���ϴ���ͼƬ��ʽ����ȷ��������ѡ��!");                                  
            return false;                          
        }  
            imgObjPreview.style.display = 'none';                          
            document.selection.empty();                  
        }                  
            return true;          
        }  
</script>  
  <body>
  <input type=file name="doc" id="doc" onchange="javascript:setImagePreview();">  
<p><div id="localImag"><img id="preview" width=-1 height=-1 style="diplay:none" /></div></p>  
    <%
String filePath = request.getSession().getServletContext().getRealPath("");//��ȡ����Ŀ����ʵ·��
Uploadpic FileUpload=new Uploadpic();
out.println(filePath+"<br/>");

String photo=request.getParameter("imgUpload");//��ȡfile�ؼ����·��������·����

int indexOfLine = photo.lastIndexOf("\\");

String fileName = photo.substring(indexOfLine+1,photo.length());//�ļ���������׺��������·����Ϣ��

String destFilePathAndName = filePath+"\\image\\"+fileName;//Ҫ�����ļ���·��

//FileUpload.uploadImage(filePath+"\\image\\",photo,destFilePathAndName);//�ϴ�ͼƬ��Ŀ��·��

String relativeFilePath =".\\image\\"+fileName;//������ʾͼƬ�����·��

out.println(photo+"<br/>");

out.println(destFilePathAndName+"<br/>");

%>

<img src="<%=relativeFilePath%>" width=100height=112 border=0 alt="image display"/>

  </body>
</html>
