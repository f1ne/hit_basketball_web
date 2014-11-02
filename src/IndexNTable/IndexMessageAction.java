package IndexNTable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import Connection.DBConnection;

import com.opensymphony.xwork2.ActionSupport;

public class IndexMessageAction extends ActionSupport{

	private DBConnection dbConnection=new DBConnection();
	HttpServletRequest ss=null;
	HttpSession sss = null;
    String newMess=new String();
	//SimpleDateFormat sdf=new SimpleDateFormat("yyyymmddhhmmss",Locale.SIMPLIFIED_CHINESE);
	//String timeStr=sdf.format(new Date());
	//Date date=new Date();
	//Timestamp datetime=new Timestamp(date.getTime());
	public String GetMessage()
	{
		ss = ServletActionContext.getRequest();
		sss=ss.getSession();
			try{
				int messagetime=0;
				String message=null;
				Connection tempConnection=dbConnection.getConnection();
				String initialString="select * from message ";
				PreparedStatement loginstmt=tempConnection.prepareStatement(initialString);
				ResultSet rs= loginstmt.executeQuery();
				if(rs.next())
				{
					while(rs.next()){
					int index=rs.getInt("index");
					String messStr=rs.getString("IndexMessage");
					if(messagetime==0||index>messagetime){
						messagetime=index;
						message=messStr;
						}
					}
					}
				else {
					sss.setAttribute("IndexMessage"," ");
				}
				sss.setAttribute("IndexMessage",message);
			    }catch(Exception e){
				}
			return SUCCESS;
	}
	public String InsertMessage()
	{
		try{
			Connection tempConnection=dbConnection.getConnection();
			String sqlString="select * from message where IndexMessage= ?";
			String addMessageString="insert into message (IndexMessage) values (?)";
			PreparedStatement addMessagePreparedStatement=tempConnection.prepareStatement(addMessageString);
			PreparedStatement jokePreparedStatement=tempConnection.prepareStatement(sqlString);
			jokePreparedStatement.setString(1, newMess);
			ResultSet rs=jokePreparedStatement.executeQuery();
			System.out.println("prepare succeed");
			if(rs.next()){
				//System.out.println("Error");
			}
			else {
				
					addMessagePreparedStatement.setString(1, newMess);
					addMessagePreparedStatement.executeUpdate();
			    }  
				}catch (Exception e) {
				}
				return SUCCESS;
			
	}
	public String getNewMess() {
		return newMess;
	}
	public void setNewMess(String newMess) {
		this.newMess = newMess;
	}
}
