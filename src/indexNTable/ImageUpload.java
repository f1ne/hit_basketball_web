package indexNTable;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
public class ImageUpload extends HttpServlet {
	String fileNamePath;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	@SuppressWarnings("static-access")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SmartUpload upload = new SmartUpload();
		
		upload.initialize(this.getServletConfig(), request, response);
		
		try{
			upload.upload();
			//System.out.print("12");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		long fl = (new java.util.Date()).getTime();
		
		Files fs = upload.getFiles();
		
		File f = fs.getFile(0);
		
		try {
			//System.out.print("123");
			f.saveAs("/img/" + fl + ".jpg", f.SAVEAS_AUTO);

			System.out.println("文件上传成功！");
			
			
			System.out.print(fl);
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("ShowPic.jsp?imgName=" + fl).forward(request, response);
	}

}
