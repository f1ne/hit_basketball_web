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
	private String DPlayerID;
	private int PlayerNum;
	private DBConnection pConnection=new DBConnection();
	private ArrayList<Player> P=new ArrayList<Player>();
	HttpServletRequest ss=null;
	HttpSession sss = null;
	
	public String showPlayer() throws SQLException
	{	
		ss = ServletActionContext.getRequest();
		sss=ss.getSession();
		P.clear();
		try{
		Connection tempConnection=pConnection.getConnection();
		//Statement bookstmt=tempConnection.createStatement();
		String initialString="select * from players where Team= ?";
		PreparedStatement bookstmt=tempConnection.prepareStatement(initialString);
		bookstmt.setString(1,(String)sss.getAttribute("user"));
		ResultSet rs= bookstmt.executeQuery();
		if(rs.next())
		{
			int num=0;
			jspTitle="队内成员:";
			do{
				Player tempPlayer=new Player(rs.getInt("PlayerID"),rs.getInt("TeamID"),rs.getString("Name"),rs.getString("StudentID"),rs.getInt("Score"),rs.getInt("NumberOfMatches"),rs.getInt("fouls"),rs.getInt("Number"),rs.getString("Position"),target,rs.getString("Sex"),rs.getInt("Age"),rs.getString("IsSHB"));
				P.add(tempPlayer);
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
		String sqlString="select * from players where PlayerID= ?";
		PreparedStatement jokePreparedStatement=tempConnection.prepareStatement(sqlString);
		jokePreparedStatement.setString(1, DPlayerID);
		ResultSet rs=jokePreparedStatement.executeQuery();
		if(rs.next()){
			Connection DConnection=pConnection.getConnection();
			String sqlStringD="delete from players where players.PlayerID= ?";
			PreparedStatement DPreparedStatement=DConnection.prepareStatement(sqlStringD);
			DPreparedStatement.setString(1,rs.getString("PlayerID"));
			DPreparedStatement.executeUpdate();
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
		String addPlayerString="insert into players (TeamID,Team,Name,Sex,StudentID,Number,Position,Age,IsSHB) values (?,?,?,?,?,?,?,?,?)";
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
			addPlayerPreparedStatement.setInt(8, newPlayer.getAge());
			addPlayerPreparedStatement.setString(9, newPlayer.getIsSHB());
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
	
	public ArrayList<Player> getP() {
		return P;
	}
	public void setP(ArrayList<Player> p) {
		P = p;
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
	public String getDPlayerID() {
		return DPlayerID;
	}
	public void setDPlayerID(String dPlayerID) {
		DPlayerID = dPlayerID;
	}
	public int getPlayerNum() {
		return PlayerNum;
	}
	public void setPlayerNum(int playerNum) {
		PlayerNum = playerNum;
	}
}
