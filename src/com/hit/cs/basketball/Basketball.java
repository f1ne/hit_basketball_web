package com.hit.cs.basketball;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class Basketball extends ActionSupport{
	
	
	private static final long serialVersionUID = 7140505626097926600L;
	private int TeamID1;
	private int TeamID2;
	public void setTeamID1(int teamID1){
		this.TeamID1=teamID1;
	}
	public int getTeamID1(){
		return this.TeamID1;
	}
	
	public void setTeamID2(int teamID2){
		this.TeamID2=teamID2;
	}
	public int getTeamID2(){
		return this.TeamID2;
	}
	//进入现场记录模式
	public String enterRecording(){
		HttpServletRequest request;
		request=ServletActionContext.getRequest();
		ArrayList<PlayerBean> listTeam1=new ArrayList<PlayerBean>();
		ArrayList<PlayerBean> listTeam2=new ArrayList<PlayerBean>();
		String sql="select * from players where TeamID='"+TeamID1+"'";
		ResultSet rs=DataBaseBean.query(sql);
		try {
			while (rs.next()){
				listTeam1.add(new PlayerBean((Integer)rs.getInt("PlayerID"),
						                     (Integer)rs.getInt("TeamID"),
						                     (String)rs.getString("Name"),
						                     (String)rs.getString("StudentID"),
						                     (Integer)rs.getInt("Score"),
						                     (Integer)rs.getInt("NumberOfMatches"),
						                     (Integer)rs.getInt("Fouls"),
						                     (Integer)rs.getInt("Number")));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		sql="select * from players where TeamID='"+TeamID2+"'";
		rs=DataBaseBean.query(sql);
		try {
			while (rs.next()){
				listTeam2.add(new PlayerBean((Integer)rs.getInt("PlayerID"),
						                     (Integer)rs.getInt("TeamID"),
						                     (String)rs.getString("Name"),
						                     (String)rs.getString("StudentID"),
						                     (Integer)rs.getInt("Score"),
						                     (Integer)rs.getInt("NumberOfMatches"),
						                     (Integer)rs.getInt("Fouls"),
						                     (Integer)rs.getInt("Number")));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		request.setAttribute("listTeam1", listTeam1);
		request.setAttribute("listTeam2", listTeam2);
		//建立比赛表
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd",Locale.SIMPLIFIED_CHINESE);
		String timeStr=sdf.format(new Date());
		if (DataBaseBean.isMatchRecordTableExist(timeStr, 1, 2)==false){
			DataBaseBean.createMatchRecordTable(timeStr, TeamID1, TeamID2);
			
		}
		System.out.println(DataBaseBean.isMatchRecordTableExist(timeStr, 1, 2));
		return "success";
	}
}
