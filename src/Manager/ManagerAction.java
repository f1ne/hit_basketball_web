package Manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Connection.DBConnection;

import com.opensymphony.xwork2.ActionSupport;

public class ManagerAction extends ActionSupport{
	private String jspTitle;
	private String target;
	private ArrayList<Manager> A=new ArrayList<Manager>();
	private Manager newManager=new Manager();
	private DBConnection mConnection=new DBConnection();

	public String AddManager()
	{
		A.clear();
		try{
		Connection tempConnection=mConnection.getConnection();
		String sqlString="select * from manager where ID= ?";
		String addManagerString="insert into manager (ID,Name,PSW,NPL) values (?,?,?,?)";
		PreparedStatement addManagerPreparedStatement=tempConnection.prepareStatement(addManagerString);
		PreparedStatement jokePreparedStatement=tempConnection.prepareStatement(sqlString);
		jokePreparedStatement.setString(1, newManager.getId());
		ResultSet rs=jokePreparedStatement.executeQuery();
		System.out.println("prepare succeed");
		if(rs.next()){
			setJspTitle("ID already exist");
			System.out.println("ID already exist");
		}
		else {
			addManagerPreparedStatement.setString(1, newManager.getId());
			addManagerPreparedStatement.setString(2, newManager.getName());
			addManagerPreparedStatement.setString(3, newManager.getPasscode());
			addManagerPreparedStatement.setString(4, newManager.getPrivilgeLevel());
			addManagerPreparedStatement.executeUpdate();
			System.out.println("Add succeed");
			setJspTitle("Add Succeed");
		}
		}catch (Exception e) {
			// TODO: handle exception
			setJspTitle("fail in AddManager");
			System.out.println("fail in AddManager");
		}
		return SUCCESS;
	}
	
	public ArrayList<Manager> getA() {
		return A;
	}

	public void setA(ArrayList<Manager> a) {
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

	public Manager getNewManager() {
		return newManager;
	}

	public void setNewManager(Manager newManager) {
		this.newManager = newManager;
	}
}
