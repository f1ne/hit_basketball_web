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

//�ж��ļ���image�Ƿ���ڣ����������򴴽�

File folder =new File(imgFolderPath);

System.out.println("function'uploadFileTest2'-imgFolderPath'"+imgFolderPath);

if(!folder.exists())

{

folder.mkdir();

System.out.println("maked a folder!");

}

File _file =new File(srcFileName);//�����ļ�

Image src = javax.imageio.ImageIO.read(_file);//����Image����

int wideth=src.getWidth(null);//�õ�Դͼ��

int height=src.getHeight(null);//�õ�Դͼ��

BufferedImage tag =new BufferedImage(wideth,height,BufferedImage.TYPE_INT_RGB);

tag.getGraphics().drawImage(src,0,0,wideth,height,null);

FileOutputStream out=new FileOutputStream(dstFileName);//������ļ���

JPEGImageEncoder encoder =JPEGCodec.createJPEGEncoder(out);

encoder.encode(tag);//JPEG����

out.close();

System.out.println("function'uploadFileTest2'-status:A Image File Saved!");
return SUCCESS;
}

}