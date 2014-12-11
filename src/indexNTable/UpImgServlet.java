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
	String fdate;// ��������
	String ip;// ע��ip��ַ
	String source;// ��Դ
	String fileNamePath;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		{
			HttpSession session = request.getSession(true);// ����session����

			ServletContext application = this.getServletContext();// ����application����

			DiskFileItemFactory factory = new DiskFileItemFactory();// ���ô����ļ����

			File repository = (File) application
					.getAttribute("javax.servlet.context.tempdir");// ��ȡtomcat��ʱ�ļ�Ŀ¼�ľ���·��

			factory.setRepository(repository); // �����ϴ�ʱ����ʱ�ļ�Ŀ¼

			ServletFileUpload upload = new ServletFileUpload(factory);// �Ӵ��̹���ʵ����һ���ϴ�handler

			upload.setProgressListener(new ProgressListener() {
				// �����ļ��ϴ�����
				public void update(long pBytesRead, long pContentLenth,
						int pItem) {
					System.out.println("��ǰ�ļ��ϴ���" + pBytesRead + "�ֽ�"
							+ "�ļ����ֽ���:" + pContentLenth);
					System.out.println("1"+fileNamePath);
				}
			});

			upload.setHeaderEncoding("utf-8");// ���ñ���

			try {
				// ת��request,�����б�����ת��ΪFileItem�������ļ�������ͨ����
				List<FileItem> items = upload.parseRequest(request);

				for (FileItem item : items) {
					// �жϱ��Ƿ�����ͨ��
					if (item.isFormField()) {
						// �������ļ����Ĵ���

						String uploadFileName = item.getName(); // ��ȡԭʼ���ϴ��ļ���
						System.out.println(uploadFileName);
						String uploadFileContextType = item.getContentType();// ��ȡ�ļ�����

						long uploadFileSize = item.getSize();// ��ȡ�ļ��Ĵ�С

						String sufxName = "";// �ļ���׺��

						if (uploadFileName.indexOf(".") > -1) {

							sufxName = uploadFileName.substring(uploadFileName

							.lastIndexOf("."));

							sufxName.toLowerCase();// ���ļ���׺��ת��ΪСд�������ж�

						}

						if (sufxName.equals(".jpg") || sufxName.equals(".png")

						|| sufxName.equals(".gif")) {

							String rootPath = application.getRealPath("/");// ��ȡ��ǰӦ�õľ���·������·����

							String uploadDirPath = "/img/" + "upload";
							System.out.println("1"+uploadDirPath);
							File uploadDir = new File(uploadDirPath);

							if (!uploadDir.exists()) {

								uploadDir.mkdirs();// ����ϴ�Ŀ¼�����ڣ����½�

							}
							// ���ô浽���̵��ļ�·��+�ļ���
							fileNamePath = File.separator + UUID.randomUUID()
									+ sufxName;
							File file = new File(uploadDirPath + fileNamePath);

							System.out.println(uploadDirPath+fileNamePath);

							// ��ȡ�ϴ��ļ���������
							InputStream input = item.getInputStream();

							FileOutputStream output = new FileOutputStream(file);
							int len = 0;

							byte by[] = new byte[4408];

							while ((len = input.read(by)) > -1) {

								output.write(by, 0, len);
							}

							input.close();

							output.close();

							System.out.println("�ļ��ϴ��ɹ���");
						}
					}
				}
			} catch (FileUploadException e) {

				e.printStackTrace();
			}
			InetAddress addr = InetAddress.getLocalHost();
			ip = addr.getHostAddress().toString();// ��ȡ����ip��ַ

			request.getRequestDispatcher("ShowPic.jsp?imgName=" + fileNamePath).forward(request, response);
			}
		}
	}