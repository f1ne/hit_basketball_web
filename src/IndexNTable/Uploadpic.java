package indexNTable;
import java.awt.image.BufferedImage;

import java.io.*;
import java.awt.Image;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.image.codec.jpeg.JPEGCodec;

import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class Uploadpic extends ActionSupport{

public static String uploadpic(String imgFolderPath,String srcFileName,String dstFileName) throws IOException

{

//判断文件夹image是否存在，若不存在则创建

File folder =new File(imgFolderPath);

System.out.println("function'uploadFileTest2'-imgFolderPath'"+imgFolderPath);

if(!folder.exists())

{

folder.mkdir();

System.out.println("maked a folder!");

}

File _file =new File(srcFileName);//读入文件

Image src = javax.imageio.ImageIO.read(_file);//构造Image对象

int wideth=src.getWidth(null);//得到源图宽

int height=src.getHeight(null);//得到源图长

BufferedImage tag =new BufferedImage(wideth,height,BufferedImage.TYPE_INT_RGB);

tag.getGraphics().drawImage(src,0,0,wideth,height,null);

FileOutputStream out=new FileOutputStream(dstFileName);//输出到文件流

JPEGImageEncoder encoder =JPEGCodec.createJPEGEncoder(out);

encoder.encode(tag);//JPEG编码

out.close();

System.out.println("function'uploadFileTest2'-status:A Image File Saved!");
return SUCCESS;
}

}