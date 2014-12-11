package indexNTable;

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
	String tyear=new String();
	String tmonth=new String();
	String tday=new String();
	String thour=new String();
	String tmin= new String();
	
	private ArrayList<GameBean> S=new ArrayList<GameBean>();
	private ArrayList<String> T=new ArrayList<String>();
	int newhomeTeamID;
	int newawayTeamID;
    String newplace=new String();
	//SimpleDateFormat sdf=new SimpleDateFormat("yyyymmddhhmmss",Locale.SIMPLIFIED_CHINESE);
	//String timeStr=sdf.format(new Date());
	//Date date=new Date();
	//Timestamp datetime=new Timestamp(date.getTime());
    public String getReady()
	{	
    	ss = ServletActionContext.getRequest();
    	sss=ss.getSession();
		T.clear();
		try{
		Connection tempConnection=dbConnection.getConnection();
		String sqlString="select * from team";
		PreparedStatement bstmt=tempConnection.prepareStatement(sqlString);
		ResultSet rs= bstmt.executeQuery();
		if(rs.next())
		{
			do{
				String tempteam=rs.getString("ID");
				T.add(tempteam);
			}while(rs.next());
			jspTitle="成功";
			sss.setAttribute("TeamList",T);
			
			return SUCCESS;
		}
		else {
			jspTitle="暂无队伍";
			return ERROR;
		}
		}catch(Exception e){
			jspTitle="数据库错误";
			return ERROR;
		}
	}
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
    	ss = ServletActionContext.getRequest();
	sss=ss.getSession();
		S.clear();
		ShowGroupMember();
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
				S.add(tempGame);
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
    
    public ArrayList<GameBean> getS() {
		return S;
	}

	public void setS(ArrayList<GameBean> a) {
		S = a;
	}

	public String InsertSchedule(){
		//将日期格式从yyyyMMdd转换为yyyy-MM-dd，记录到数据库中与SQL的date类型匹配
    	//SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss",Locale.SIMPLIFIED_CHINESE);
		try {
			System.out.print(tyear);
			datestr=tyear+"-"+tmonth+"-"+tday+" "+thour+":"+tmin;
			//Date date = sdf.parse(datestr);
			//sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss",Locale.SIMPLIFIED_CHINESE); 
			//String datestr2=sdf.format(date);
			String sql=String.format("INSERT INTO schedule (HomeTeamID, AwayTeamID, Time, Place) VALUES ('%d', '%d', '%s','%s')",
					newhomeTeamID,newawayTeamID,datestr,newplace);
			DataBaseBean.update(sql);
			jspTitle="添加成功";
			return SUCCESS;
		} catch (Exception e) {
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
	
	 String DTeamID = new String();
		GroupBean newMember=new GroupBean();
		private ArrayList<GroupBean> A = new ArrayList<GroupBean>();
		private ArrayList<GroupBean> B = new ArrayList<GroupBean>();
		private ArrayList<GroupBean> C = new ArrayList<GroupBean>();
		private ArrayList<GroupBean> D = new ArrayList<GroupBean>();

		public String AddWin(){
			try {
				Connection NumConnection=dbConnection.getConnection();
		        String sqlString2="update groupgame set groupgame.Win=groupgame.Win+1 where groupgame.TeamID= ?";
		        PreparedStatement moPreparedStatement=NumConnection.prepareStatement(sqlString2);
		        moPreparedStatement.setString(1, DTeamID);
		        moPreparedStatement.executeUpdate();
			} catch (Exception e) {
				jspTitle="记录错误";
				return ERROR;
			}
			return SUCCESS;
		}
		
		public String AddLose(){
			try {
				Connection NumConnection=dbConnection.getConnection();
		        String sqlString2="update groupgame set groupgame.Lose=groupgame.Lose+1 where groupgame.TeamID= ?";
		        PreparedStatement moPreparedStatement=NumConnection.prepareStatement(sqlString2);
		        moPreparedStatement.setString(1, DTeamID);
		        moPreparedStatement.executeUpdate();
			} catch (Exception e) {
				jspTitle="记录错误";
				return ERROR;
			}
			return SUCCESS;
		}
		public String InsertGroupMember(){
			try {
				Connection tempConnection = dbConnection.getConnection();
				String sqlString = "select * from groupgame,team where team.ID=groupgame.TeamID and groupgame.TeamID=?";
				PreparedStatement jokePreparedStatement = tempConnection
						.prepareStatement(sqlString);
				jokePreparedStatement.setString(1, newMember.TeamID);
				ResultSet rs = jokePreparedStatement.executeQuery();
				if (!rs.next()) {
				String sql=String.format("INSERT INTO groupgame (TeamID, GroupID, Win, Lose) VALUES ('%s', '%s','%d','%d')",
						newMember.TeamID,newMember.GroupID,newMember.Win,newMember.Lose);
				DataBaseBean.update(sql);
				jspTitle="添加成功";
				ShowGroupMember();
				}
			} catch (Exception e) {
				jspTitle="添加队伍错误";
				return ERROR;
			}
			return SUCCESS;
		}
		public String ShowGroupMember(){
				ShowGroupAMember();
				ShowGroupBMember();
				ShowGroupCMember();
				ShowGroupDMember();
			return SUCCESS;
		}
		public String ShowGroupAMember(){
			A.clear();
			try {
				Connection tempConnection = dbConnection.getConnection();
				String sqlString = "select * from groupgame where groupgame.GroupID=?";
				PreparedStatement jokePreparedStatement = tempConnection
						.prepareStatement(sqlString);
				jokePreparedStatement.setString(1, "A");
				ResultSet rs = jokePreparedStatement.executeQuery();
				if (rs.next()) {
					do{
						GroupBean tempMember=new GroupBean(rs.getString("TeamID"),rs.getString("GroupID"),rs.getInt("Win"),rs.getInt("Lose"));
						A.add(tempMember);
					}while(rs.next());
				}
			} catch (Exception e) {
				jspTitle="显示错误";
				return ERROR;
			}
			return SUCCESS;
		}
		
		public String ShowGroupBMember(){
			B.clear();
			try {
				Connection tempConnection = dbConnection.getConnection();
				String sqlString = "select * from groupgame where groupgame.GroupID=?";
				PreparedStatement jokePreparedStatement = tempConnection
						.prepareStatement(sqlString);
				jokePreparedStatement.setString(1, "B");
				ResultSet rs = jokePreparedStatement.executeQuery();
				if (rs.next()) {
					do{
						GroupBean tempMember=new GroupBean(rs.getString("TeamID"),rs.getString("GroupID"),rs.getInt("Win"),rs.getInt("Lose"));
						B.add(tempMember);
					}while(rs.next());
				}
			} catch (Exception e) {
				jspTitle="显示错误";
				return ERROR;
			}
			return SUCCESS;
		}
		
		public String ShowGroupCMember(){
			C.clear();
			try {
				Connection tempConnection = dbConnection.getConnection();
				String sqlString = "select * from groupgame where groupgame.GroupID=?";
				PreparedStatement jokePreparedStatement = tempConnection
						.prepareStatement(sqlString);
				jokePreparedStatement.setString(1, "C");
				ResultSet rs = jokePreparedStatement.executeQuery();
				if (rs.next()) {
					do{
						GroupBean tempMember=new GroupBean(rs.getString("TeamID"),rs.getString("GroupID"),rs.getInt("Win"),rs.getInt("Lose"));
						C.add(tempMember);
					}while(rs.next());
				}
			} catch (Exception e) {
				jspTitle="显示错误";
				return ERROR;
			}
			return SUCCESS;
		}
		
		public String ShowGroupDMember(){
			D.clear();
			try {
				Connection tempConnection = dbConnection.getConnection();
				String sqlString = "select * from groupgame where groupgame.GroupID=?";
				PreparedStatement jokePreparedStatement = tempConnection
						.prepareStatement(sqlString);
				jokePreparedStatement.setString(1, "D");
				ResultSet rs = jokePreparedStatement.executeQuery();
				if (rs.next()) {
					do{
						GroupBean tempMember=new GroupBean(rs.getString("TeamID"),rs.getString("GroupID"),rs.getInt("Win"),rs.getInt("Lose"));
						D.add(tempMember);
					}while(rs.next());
				return SUCCESS;
				}
				return ERROR;
			} catch (Exception e) {
				jspTitle="显示错误";
				return ERROR;
			}
		}
		
		public String DeleteMember() {
			try {
				Connection tempConnection = dbConnection.getConnection();
				String sqlString = "select * from groupgame where groupgame.TeamID= ?";
				PreparedStatement jokePreparedStatement = tempConnection
						.prepareStatement(sqlString);
				jokePreparedStatement.setString(1, DTeamID);
				ResultSet rs = jokePreparedStatement.executeQuery();
				if (rs.next()) {
					Connection DConnection = dbConnection.getConnection();
					String sqlStringD = "delete from groupgame where groupgame.TeamID= ?";
					PreparedStatement DPreparedStatement = DConnection
							.prepareStatement(sqlStringD);
					DPreparedStatement.setString(1, rs.getString("TeamID"));
					DPreparedStatement.executeUpdate();
					return SUCCESS;
				} else {
					jspTitle = "result fail";
					return ERROR;
				}
			} catch (Exception e) {
				jspTitle = "database fail";
				return ERROR;
			}
		}
		public String getDTeamID() {
			return DTeamID;
		}
		public void setDTeamID(String dTeamID) {
			DTeamID = dTeamID;
		}
		public GroupBean getNewMember() {
			return newMember;
		}
		public void setNewMember(GroupBean newMember) {
			this.newMember = newMember;
		}
		public ArrayList<GroupBean> getA() {
			return A;
		}
		public void setA(ArrayList<GroupBean> a) {
			A = a;
		}
		public ArrayList<GroupBean> getB() {
			return B;
		}
		public void setB(ArrayList<GroupBean> b) {
			B = b;
		}
		public ArrayList<GroupBean> getC() {
			return C;
		}
		public void setC(ArrayList<GroupBean> c) {
			C = c;
		}
		public ArrayList<GroupBean> getD() {
			return D;
		}
		public void setD(ArrayList<GroupBean> d) {
			D = d;
		}
		public ArrayList<String> getT() {
			return T;
		}
		public void setT(ArrayList<String> t) {
			T = t;
		}
		public String getTyear() {
			return tyear;
		}
		public void setTyear(String tyear) {
			this.tyear = tyear;
		}
		public String getTmonth() {
			return tmonth;
		}
		public void setTmonth(String tmonth) {
			this.tmonth = tmonth;
		}
		public String getTday() {
			return tday;
		}
		public void setTday(String tday) {
			this.tday = tday;
		}
		public String getThour() {
			return thour;
		}
		public void setThour(String thour) {
			this.thour = thour;
		}
		public String getTmin() {
			return tmin;
		}
		public void setTmin(String tmin) {
			this.tmin = tmin;
		}
		
	
	
}
