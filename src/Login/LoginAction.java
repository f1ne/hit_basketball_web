package Login;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import Connection.DBConnection;
import Manager.Manager;
import Team.Team;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	private String jspTitle;
	private String user;
	private String psw;
	private String logintype;
	private String teamLogin="0";
	
	HttpServletRequest ss=null;
	private String managerLogin="0";
	private Manager loginManager=new Manager();
	private Team    loginTeam=new Team();
	private DBConnection dbConnection=new DBConnection();
	HttpSession sss = null;
	

	public String Login()
	{
		ss = ServletActionContext.getRequest();
		sss=ss.getSession();
			try{
				logintype=getLogintype();
				user=getUser();
				psw=getPsw();
				Connection tempConnection=dbConnection.getConnection();
				if(logintype.compareTo("Manager")==0){
				String initialString="select * from manager where ID= ?";
				PreparedStatement loginstmt=tempConnection.prepareStatement(initialString);
				loginstmt.setString(1, user);
				ResultSet rs= loginstmt.executeQuery();
				if(rs.next())
				{
					if(psw.compareTo(rs.getString("PSW"))== 0 ){
					jspTitle="登录成功";
					managerLogin="1";
					teamLogin="0";
					sss.setAttribute("logintype",logintype);
				    sss.setAttribute("user",user);
				    sss.setAttribute("psw",psw);
					//System.out.println("mmm");
					}
					else{
						jspTitle="密码错误";
						managerLogin="0";
						teamLogin="0";
						return ERROR;
					}
				}
				else {
					jspTitle="用户名或密码错误";
					managerLogin="0";
					teamLogin="0";
					return ERROR;
				}
				}
		        else if(logintype.compareTo("Team") == 0){
				String initialString="select * from team where ID= ?";
				PreparedStatement loginstmt=tempConnection.prepareStatement(initialString);
				loginstmt.setString(1, user);
				ResultSet rs= loginstmt.executeQuery();
				if(rs.next())
				{
					if(psw.compareTo(rs.getString("PSW"))== 0 ){
						sss.setAttribute("logintype",logintype);
					    sss.setAttribute("user",user);
					    sss.setAttribute("psw",psw);
					jspTitle="登录成功";
					teamLogin="1";
					managerLogin="0";
					//System.out.println("ttt");
					}
					else{
						jspTitle="密码错误";
						teamLogin="0";
						managerLogin="0";
						return ERROR;
					}
				}
				else {
					jspTitle="用户名或密码错误";
					teamLogin="0";
					managerLogin="0";
					return ERROR;
				}
				}
			    }catch(Exception e){
					jspTitle="发生错误";
					teamLogin="0";
					managerLogin="0";
					return ERROR;
				}
		return SUCCESS;
	}

	public String getJspTitle() {
		return jspTitle;
	}

	public void setJspTitle(String jspTitle) {
		this.jspTitle = jspTitle;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public String getLogintype() {
		return logintype;
	}

	public void setLogintype(String logintype) {
		this.logintype = logintype;
	}

	public Manager getLoginManager() {
		return loginManager;
	}

	public void setLoginManager(Manager loginManager) {
		this.loginManager = loginManager;
	}

	public Team getLoginTeam() {
		return loginTeam;
	}

	public void setLoginTeam(Team loginTeam) {
		this.loginTeam = loginTeam;
	}
	public String getTeamLogin() {
		return teamLogin;
	}

	public void setTeamLogin(String teamLogin) {
		this.teamLogin = teamLogin;
	}

	public String getManagerLogin() {
		return managerLogin;
	}

	public void setManagerLogin(String managerLogin) {
		this.managerLogin = managerLogin;
	}
}
