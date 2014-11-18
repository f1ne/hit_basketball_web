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
        //火狐下，直接设img属性                          
        imgObjPreview.style.display = 'block';                          
        imgObjPreview.style.width = '300px';                          
        imgObjPreview.style.height = '120px';                                              
        //imgObjPreview.src = docObj.files[0].getAsDataURL();  
        //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式          
        imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);  
     }else{                          
         //IE下，使用滤镜                          
         docObj.select();                          
         var imgSrc = document.selection.createRange().text;                          
         var localImagId = document.getElementById("localImag");  
         //必须设置初始大小                          
         localImagId.style.width = "250px";                          
         localImagId.style.height = "200px";  
        //图片异常的捕捉，防止用户修改后缀来伪造图片  
        try{                                  
            localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";                                  
            localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;                          
        }catch(e){                                  
            alert("您上传的图片格式不正确，请重新选择!");                                  
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
String filePath = request.getSession().getServletContext().getRealPath("");//获取该项目的真实路径
Uploadpic FileUpload=new Uploadpic();
out.println(filePath+"<br/>");

String photo=request.getParameter("imgUpload");//获取file控件里的路径（绝对路径）

int indexOfLine = photo.lastIndexOf("\\");

String fileName = photo.substring(indexOfLine+1,photo.length());//文件名（含后缀，不包含路径信息）

String destFilePathAndName = filePath+"\\image\\"+fileName;//要保存文件的路径

//FileUpload.uploadImage(filePath+"\\image\\",photo,destFilePathAndName);//上传图片到目的路径

String relativeFilePath =".\\image\\"+fileName;//用来显示图片的相对路径

out.println(photo+"<br/>");

out.println(destFilePathAndName+"<br/>");

%>

<img src="<%=relativeFilePath%>" width=100height=112 border=0 alt="image display"/>

  </body>
</html>
