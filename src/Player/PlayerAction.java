package Player;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import Connection.DBConnection;

public class PlayerAction extends ActionSupport{

	private String jspTitle;
	private String target;
	private Player newPlayer=new Player();
	private String DPlayerName;
	private int PlayerNum;
	private DBConnection pConnection=new DBConnection();
	private ArrayList<Player> A=new ArrayList<Player>();
	HttpServletRequest ss=null;
	HttpSession sss = null;
	
	public String showPlayer() throws SQLException
	{	
		ss = ServletActionContext.getRequest();
		sss=ss.getSession();
		A.clear();
		try{
		Connection tempConnection=pConnection.getConnection();
		//Statement bookstmt=tempConnection.createStatement();
		String initialString="select * from players where TeamID= ?";
		PreparedStatement bookstmt=tempConnection.prepareStatement(initialString);
		bookstmt.setString(1,(String)sss.getAttribute("user"));
		ResultSet rs= bookstmt.executeQuery();
		if(rs.next())
		{
			int num=0;
			jspTitle="队内成员:";
			do{
				Player tempPlayer=new Player(rs.getInt("PlayerID"),rs.getInt("TeamID"),rs.getString("Name"),rs.getString("StudentID"),rs.getInt("Score"),rs.getInt("NumberOfMatches"),rs.getInt("fouls"),rs.getInt("Number"),rs.getString("Position"),target,rs.getString("Sex"));
				A.add(tempPlayer);
				num++;
			}while(rs.next());
				PlayerNum=num;
		}
		else {
			jspTitle="暂无成员";
		}
		}catch(Exception e){
			jspTitle="search fail";
		}
		return SUCCESS;
	}
	public String deletePlayer()
	{
		try{
		Connection tempConnection=pConnection.getConnection();
		String sqlString="select * from players where Name= ?";
		PreparedStatement jokePreparedStatement=tempConnection.prepareStatement(sqlString);
		jokePreparedStatement.setString(1, DPlayerName);
		ResultSet rs=jokePreparedStatement.executeQuery();
		if(rs.next()){
			System.out.println(DPlayerName+' '+rs.getString("Name")+" "+rs.getString("TeamID"));
			Connection DConnection=pConnection.getConnection();
			String sqlStringD="delete from players where players.Name= ?";
			PreparedStatement DPreparedStatement=DConnection.prepareStatement(sqlStringD);
			DPreparedStatement.setString(1,rs.getString("Name"));
			DPreparedStatement.executeUpdate();
			System.out.println("1");
			Connection NumConnection=pConnection.getConnection();
			String sqlString2="update team set PlayerNum=PlayerNum-1 where team.ID= ?";
			PreparedStatement moPreparedStatement=NumConnection.prepareStatement(sqlString2);
			moPreparedStatement.setString(1, rs.getString("TeamID"));
			moPreparedStatement.executeUpdate();
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
	public String addPlayer()
	{
		try{
		Connection tempConnection=pConnection.getConnection();
		String sqlString="select * from players where Name= ?";
		String addPlayerString="insert into players (TeamID,Team,Name,Sex,StudentID,Number,Position) values (?,?,?,?,?,?,?)";
		PreparedStatement addPlayerPreparedStatement=tempConnection.prepareStatement(addPlayerString);
		PreparedStatement jokePreparedStatement=tempConnection.prepareStatement(sqlString);
		jokePreparedStatement.setString(1, newPlayer.getName());
		ResultSet rs=jokePreparedStatement.executeQuery();
		System.out.println("prepare succeed");
		if(rs.next()){
			setJspTitle("该球员已经存在");
			return ERROR;
			//System.out.println("Player already exist");
		}
		else {
			addPlayerPreparedStatement.setInt(1, newPlayer.getTeamID());
			addPlayerPreparedStatement.setString(2, newPlayer.getTeam());
			addPlayerPreparedStatement.setString(3, newPlayer.getName());
			addPlayerPreparedStatement.setString(4, newPlayer.getSex());
			addPlayerPreparedStatement.setString(5, newPlayer.getStudentID());
			addPlayerPreparedStatement.setInt(6, newPlayer.getNumber());
			addPlayerPreparedStatement.setString(7, newPlayer.getPosition());
			addPlayerPreparedStatement.executeUpdate();
			Connection NumConnection=pConnection.getConnection();
			String sqlString2="update team set PlayerNum=PlayerNum+1 where ID= ?";
			PreparedStatement moPreparedStatement=NumConnection.prepareStatement(sqlString2);
			moPreparedStatement.setInt(1, newPlayer.getTeamID());
			moPreparedStatement.executeUpdate();
			setJspTitle("添加球员成功");
			return SUCCESS;
		}
		}catch (Exception e) {
			// TODO: handle exception
			setJspTitle("发生错误");
			return ERROR;
			//System.out.println("fail in AddPlayer");
		}
	}
	
	public ArrayList<Player> getA() {
		return A;
	}
	public void setA(ArrayList<Player> a) {
		A = a;
	}
	
	public String getJspTitle() {
		return jspTitle;
	}

	public void setJspTitle(String jspTitle) {
		this.jspTitle = jspTitle;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public Player getNewPlayer() {
		return newPlayer;
	}

	public void setNewPlayer(Player newPlayer) {
		this.newPlayer = newPlayer;
	}
	public String getDPlayerName() {
		return DPlayerName;
	}
	public void setDPlayerName(String dPlayerName) {
		DPlayerName = dPlayerName;
	}
	public int getPlayerNum() {
		return PlayerNum;
	}
	public void setPlayerNum(int playerNum) {
		PlayerNum = playerNum;
	}
}
