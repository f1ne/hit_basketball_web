package Team;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import Connection.DBConnection;

import com.opensymphony.xwork2.ActionSupport;


public class TeamAction extends ActionSupport {
	private String jspTitle;
	private String target;
	private ArrayList<Team> A=new ArrayList<Team>();
	private Team newTeam=new Team();
	private DBConnection tConnection=new DBConnection();

	public String AddTeam()
	{
		A.clear();
		try{
		Connection tempConnection=tConnection.getConnection();
		String sqlString="select * from team where ID= ?";
		String addTeamString="insert into team (ID,Name,PSW,Lab) values (?,?,?,?)";
		PreparedStatement addTeamPreparedStatement=tempConnection.prepareStatement(addTeamString);
		PreparedStatement jokePreparedStatement=tempConnection.prepareStatement(sqlString);
		jokePreparedStatement.setString(1, newTeam.getId());
		ResultSet rs=jokePreparedStatement.executeQuery();
		System.out.println("prepare succeed");
		if(rs.next()){
			setJspTitle("ID already exist");
			System.out.println("ID already exist");
		}
		else {
			addTeamPreparedStatement.setString(1, newTeam.getId());
			addTeamPreparedStatement.setString(2, newTeam.getName());
			addTeamPreparedStatement.setString(3, newTeam.getPasscode());
			addTeamPreparedStatement.setString(4, newTeam.getLab());
			addTeamPreparedStatement.executeUpdate();
			System.out.println("Add succeed");
			setJspTitle("Add Succeed");
		}
		}catch (Exception e) {
			// TODO: handle exception
			setJspTitle("fail in AddTeam");
			System.out.println("fail in AddTeam");
		}
		return SUCCESS;
	}
	
	public ArrayList<Team> getA() {
		return A;
	}

	public void setA(ArrayList<Team> a) {
		A = a;
	}

	public Team getNewTeam() {
		return newTeam;
	}

	public void setNewTeam(Team newTeam) {
		this.newTeam = newTeam;
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
}
