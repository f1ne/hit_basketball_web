package Player;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Connection.DBConnection;
public class PlayerAction extends ActionSupport{

	private String jspTitle;
	private String target;
	private ArrayList<Player> A=new ArrayList<Player>();
	private Player newPlayer=new Player();
	private DBConnection pConnection=new DBConnection();

	public String AddPlayer()
	{
		A.clear();
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
			//System.out.println("Add succeed");
			setJspTitle("添加球员成功");
		}
		}catch (Exception e) {
			// TODO: handle exception
			setJspTitle("发生错误");
			//System.out.println("fail in AddPlayer");
		}
		return SUCCESS;
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
}
