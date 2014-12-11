package indexNTable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class UpImgServlet extends HttpServlet {
	String fdate;// 创建日期
	String ip;// 注册ip地址
	String source;// 来源
	String fileNamePath;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		{
			HttpSession session = request.getSession(true);// 创建session对象

			ServletContext application = this.getServletContext();// 创建application对象

			DiskFileItemFactory factory = new DiskFileItemFactory();// 设置磁盘文件项工厂

			File repository = (File) application
					.getAttribute("javax.servlet.context.tempdir");// 获取tomcat临时文件目录的绝对路径

			factory.setRepository(repository); // 设置上传时的临时文件目录

			ServletFileUpload upload = new ServletFileUpload(factory);// 从磁盘工厂实例化一个上传handler

			upload.setProgressListener(new ProgressListener() {
				// 监听文件上传进度
				public void update(long pBytesRead, long pContentLenth,
						int pItem) {
					System.out.println("当前文件上传了" + pBytesRead + "字节"
							+ "文件总字节数:" + pContentLenth);
					System.out.println("1"+fileNamePath);
				}
			});

			upload.setHeaderEncoding("utf-8");// 设置编码

			try {
				// 转换request,将所有表单对象转换为FileItem（包括文件表单和普通表单）
				List<FileItem> items = upload.parseRequest(request);

				for (FileItem item : items) {
					// 判断表单是否是普通表单
					if (item.isFormField()) {
						// 以下是文件表单的处理

						String uploadFileName = item.getName(); // 获取原始的上传文件名
						System.out.println(uploadFileName);
						String uploadFileContextType = item.getContentType();// 获取文件类型

						long uploadFileSize = item.getSize();// 获取文件的大小

						String sufxName = "";// 文件后缀名

						if (uploadFileName.indexOf(".") > -1) {

							sufxName = uploadFileName.substring(uploadFileName

							.lastIndexOf("."));

							sufxName.toLowerCase();// 将文件后缀名转换为小写，以作判断

						}

						if (sufxName.equals(".jpg") || sufxName.equals(".png")

						|| sufxName.equals(".gif")) {

							String rootPath = application.getRealPath("/");// 获取当前应用的绝对路径（根路径）

							String uploadDirPath = "/img/" + "upload";
							System.out.println("1"+uploadDirPath);
							File uploadDir = new File(uploadDirPath);

							if (!uploadDir.exists()) {

								uploadDir.mkdirs();// 如果上传目录不存在，则新建

							}
							// 设置存到磁盘的文件路径+文件名
							fileNamePath = File.separator + UUID.randomUUID()
									+ sufxName;
							File file = new File(uploadDirPath + fileNamePath);

							System.out.println(uploadDirPath+fileNamePath);

							// 获取上传文件的输入流
							InputStream input = item.getInputStream();

							FileOutputStream output = new FileOutputStream(file);
							int len = 0;

							byte by[] = new byte[4408];

							while ((len = input.read(by)) > -1) {

								output.write(by, 0, len);
							}

							input.close();

							output.close();

							System.out.println("文件上传成功！");
						}
					}
				}
			} catch (FileUploadException e) {

				e.printStackTrace();
			}
			InetAddress addr = InetAddress.getLocalHost();
			ip = addr.getHostAddress().toString();// 获取本机ip地址

			request.getRequestDispatcher("ShowPic.jsp?imgName=" + fileNamePath).forward(request, response);
			}
		}
	}