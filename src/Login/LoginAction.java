package Login;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.hit.cs.basketball.DataBaseBean;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import Connection.DBConnection;
import Manager.Manager;
import Team.Team;

import com.hit.cs.basketball.DataBaseBean;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	private String jspTitle;
	private String user;
	private String psw;
	private String psw0;
	private String psw1;
	private String psw2;
	private int CPL;
	private String logintype;
	private String teamLogin="0";
	
	HttpServletRequest ss=null;
	private String managerLogin="0";
	private Manager loginManager=new Manager();
	private Team    loginTeam=new Team();
	private DBConnection dbConnection=new DBConnection();
	HttpSession sss = null;
	
	public String ChangePswM()
	{
		ss = ServletActionContext.getRequest();
		sss=ss.getSession();
			try{
				String realpsw;
				String realname;
				realname=(String)sss.getAttribute("user");
				realpsw=(String)sss.getAttribute("psw");
				if(realpsw.compareTo(psw0)==0){
					if(psw1.compareTo(psw2)==0){
						if(psw1.compareTo("")!=0){
				String sql=String.format("update manager set manager.PSW='%s' where Name='%s'", 
	        			psw1,realname);
				DataBaseBean.update(sql);
				sss.setAttribute("psw",psw1);
				jspTitle="修改成功";
				    return SUCCESS;
						}
				    else{
				    	jspTitle="密码不能为空！";
						return SUCCESS;
						
					}
				}
				else{
						jspTitle="两次密码不一致！";
						return SUCCESS;
						
					}
				}
				else{
					jspTitle="原密码错误！";
					return SUCCESS;
				
				}
			}catch(Exception e){
				jspTitle="发生错误";
				
				return SUCCESS;
			}
	}
				public String ChangePswT()
				{
					ss = ServletActionContext.getRequest();
					sss=ss.getSession();
						try{
							String realpsw;
							String realname;
							realname=(String)sss.getAttribute("user");
							realpsw=(String)sss.getAttribute("psw");
							if(realpsw.compareTo(psw0)==0){
								if(psw1.compareTo(psw2)==0){
									if(psw1.compareTo("")!=0){
							String sql=String.format("update team set team.PSW='%s' where Name='%s'", 
				        			psw1,realname);
							DataBaseBean.update(sql);
							sss.setAttribute("psw",psw1);
							jspTitle="修改成功";
							    return SUCCESS;
								}
							    else{
							    	jspTitle="密码不能为空！";
									return SUCCESS;
									
								}
							}
							else{
									jspTitle="两次密码不一致！";
									return SUCCESS;
									
								}
							}
							else{
								jspTitle="原密码错误！";
								return SUCCESS;
							
							}
						}catch(Exception e){
							jspTitle="发生错误";
							
							return SUCCESS;
						}
	}

	public String Login()
	{
		ss = ServletActionContext.getRequest();
		sss=ss.getSession();
			try{
				CPL=0;
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
				    sss.setAttribute("user",rs.getString("Name"));
				    sss.setAttribute("psw",psw);
				    CPL=(int)rs.getString("NPL").charAt(0)-48;
				    //System.out.println(CPL);
				    sss.setAttribute("CPL", CPL);
				    
				    return SUCCESS;
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
					    sss.setAttribute("user",rs.getString("Name"));
					    sss.setAttribute("psw",psw);
					    String team=rs.getString("Name");
					    sss.setAttribute("team",team);
					jspTitle="登录成功";
					teamLogin="1";
					managerLogin="0";
					return INPUT;
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
			return ERROR;
	}

	
	public String getPsw0() {
		return psw0;
	}


	public void setPsw0(String psw0) {
		this.psw0 = psw0;
	}


	public String getPsw1() {
		return psw1;
	}


	public void setPsw1(String psw1) {
		this.psw1 = psw1;
	}


	public String getPsw2() {
		return psw2;
	}


	public void setPsw2(String psw2) {
		this.psw2 = psw2;
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

	public int getCPL() {
		return CPL;
	}

	public void setCPL(int cPL) {
		CPL = cPL;
	}
	
}
