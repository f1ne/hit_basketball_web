package IndexNTable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import Connection.DBConnection;
import Player.Player;

import com.hit.cs.basketball.DataBaseBean;
import com.opensymphony.xwork2.ActionSupport;

public class IndexMessageAction extends ActionSupport{

	private DBConnection dbConnection=new DBConnection();
	HttpServletRequest ss=null;
	HttpSession sss = null;
    String newMess=new String();
	String datestr=new String();
	String jspTitle=new String();
	String DGame=new String();
	private ArrayList<GameBean> A=new ArrayList<GameBean>();
	int newhomeTeamID;
	int newawayTeamID;
    String newplace=new String();
	//SimpleDateFormat sdf=new SimpleDateFormat("yyyymmddhhmmss",Locale.SIMPLIFIED_CHINESE);
	//String timeStr=sdf.format(new Date());
	//Date date=new Date();
	//Timestamp datetime=new Timestamp(date.getTime());
    public String DeleteSchedule()
	{
		try{
		Connection tempConnection=dbConnection.getConnection();
		String sqlString="select * from schedule where schedule.Index= ?";
		PreparedStatement jokePreparedStatement=tempConnection.prepareStatement(sqlString);
		jokePreparedStatement.setString(1, DGame);
		ResultSet rs=jokePreparedStatement.executeQuery();
		if(rs.next()){
			Connection DConnection=dbConnection.getConnection();
			String sqlStringD="delete from schedule where schedule.Index= ?";
			PreparedStatement DPreparedStatement=DConnection.prepareStatement(sqlStringD);
			DPreparedStatement.setString(1,rs.getString("Index"));
			DPreparedStatement.executeUpdate();
			return SUCCESS;
		}
		else {
			jspTitle="result fail";
			return ERROR;
		}
		}catch(Exception e){
			jspTitle="database fail";
			return ERROR;
		}
	}
    
    public String GetSchedule() throws SQLException
	{	
		A.clear();
		try{
		Connection tempConnection=dbConnection.getConnection();
		String initialString="select * from schedule";
		PreparedStatement bstmt=tempConnection.prepareStatement(initialString);
		ResultSet rs= bstmt.executeQuery();
		if(rs.next())
		{
			jspTitle="赛事日程如下:";
			do{
				GameBean tempGame=new GameBean(rs.getInt("Index"),rs.getInt("HomeTeamID"),rs.getInt("AwayTeamID"),rs.getString("Time"),rs.getString("Place"));
				A.add(tempGame);
			}while(rs.next());
		}
		else {
			jspTitle="暂无比赛";
		}
		}catch(Exception e){
			jspTitle="search fail";
		}
		return SUCCESS;
	}
    
    public ArrayList<GameBean> getA() {
		return A;
	}

	public void setA(ArrayList<GameBean> a) {
		A = a;
	}

	public String InsertSchedule(){
		//将日期格式从yyyyMMdd转换为yyyy-MM-dd，记录到数据库中与SQL的date类型匹配
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss",Locale.SIMPLIFIED_CHINESE);
		try {
			Date date = sdf.parse(datestr);
			sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss",Locale.SIMPLIFIED_CHINESE); 
			String datestr2=sdf.format(date);
			String sql=String.format("INSERT INTO schedule (HomeTeamID, AwayTeamID, Time, Place) VALUES ('%d', '%d', '%s','%s')",
					newhomeTeamID,newawayTeamID,datestr2,newplace);
			DataBaseBean.update(sql);
			jspTitle="添加成功";
			return SUCCESS;
		} catch (ParseException e) {
			jspTitle="日期转换出错";
			System.out.println("日期转换出错");
			return ERROR;
		}
		
	}
    
    
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
	
	 public String getJspTitle() {
			return jspTitle;
		}


		public void setJsptitle(String jspTitle) {
			this.jspTitle = jspTitle;
		}
	
	public String getDatestr() {
		return datestr;
	}
	public String getDGame() {
		return DGame;
	}

	public void setDGame(String dGame) {
		DGame = dGame;
	}

	public void setDatestr(String datestr) {
		this.datestr = datestr;
	}


	public int getNewhomeTeamID() {
		return newhomeTeamID;
	}


	public void setNewhomeTeamID(int newhomeTeamID) {
		this.newhomeTeamID = newhomeTeamID;
	}


	public int getNewawayTeamID() {
		return newawayTeamID;
	}


	public void setNewawayTeamID(int newawayTeamID) {
		this.newawayTeamID = newawayTeamID;
	}


	public String getNewplace() {
		return newplace;
	}


	public void setNewplace(String newplace) {
		this.newplace = newplace;
	}
	public String getNewMess() {
		return newMess;
	}
	public void setNewMess(String newMess) {
		this.newMess = newMess;
	}
}
