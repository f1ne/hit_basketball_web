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
	
	/*
	 * 功能:完成进入比赛记录Record.jsp界面的数据库工作，并且读取球员名单
	 */
	public String enterRecording(){
		HttpServletRequest request;
		request=ServletActionContext.getRequest();
		ArrayList<PlayerBean> listTeam1=new ArrayList<PlayerBean>();
		ArrayList<PlayerBean> listTeam2=new ArrayList<PlayerBean>();
		listTeam1=DataBaseBean.queryPlayerByTeamID(TeamID1);
		listTeam2=DataBaseBean.queryPlayerByTeamID(TeamID2);
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
	/*
	 * 功能:进入数据实时直播
	 */
	public String enterLive(){
		HttpServletRequest request;
		request=ServletActionContext.getRequest();
		ArrayList<PlayerBean> listTeam1=new ArrayList<PlayerBean>();
		ArrayList<PlayerBean> listTeam2=new ArrayList<PlayerBean>();
		listTeam1=DataBaseBean.queryPlayerByTeamID(TeamID1);
		listTeam2=DataBaseBean.queryPlayerByTeamID(TeamID2);
		request.setAttribute("listTeam1", listTeam1);
		request.setAttribute("listTeam2", listTeam2);
		return "success";
	}
	/*
	 * 球员名字、日期查询球员当天球赛的表现，可能会出现重名的情况
	 * 会用过request类返回
	 * date 的形式是yyyyMMdd
	 * 第一次迭代暂时不支持重名球员
	 * 重复使用PlayerBean中的内容，当返回的时候，其中个项代表的是统计后的结果
	 */
	public static PlayerBean checkPlayerDataWithDate(String playerName,String date){
		ArrayList list=DataBaseBean.queryPlayerByName(playerName);
		PlayerBean player=new PlayerBean();
		GameBean team;
		if (list.size()>0){
			player=(PlayerBean)list.get(0);		
			list=DataBaseBean.queryGameTableNameByDateAndTeamID(date, player.getTeamID());
			team=(GameBean)list.get(0);
			list=DataBaseBean.queryGameRecord(date, team.getHomeTeamID(), team.getAwayTeamID());
			//将技术统计清零
			player.setFouls(0);
			player.setScore(0);
			//统计
			for (int i=0;i<list.size();i++){
				RecordBean record=(RecordBean)list.get(i);
				if (record.getPlayerID()==player.getPlayerID()){
					String scorestr="score";
					String foulstr="foul";
					if (scorestr.equals(record.getEvent())){
						int tempscore=player.getScore();
						player.setScore(tempscore+1);
					}
					if (foulstr.equals(record.getEvent())){
						int tempfoul=player.getFouls();
						player.setFouls(tempfoul+1);
					}
				}
			}
		}
		return player;
	}
	/*

	 * 通过球员ID、比赛日期查询球员当天表现
	 */
	public static PlayerBean checkPlayerDataByIDAndDate(int playerID,String date){
		PlayerBean player=DataBaseBean.queryPlayerByID(playerID);
		if (player!=null){
			ArrayList list=new ArrayList();
			list=DataBaseBean.queryGameTableNameByDateAndTeamID(date, player.getTeamID());
			GameBean team=(GameBean)list.get(0);
			list=DataBaseBean.queryGameRecord(date, team.getHomeTeamID(), team.getAwayTeamID());
			//将技术统计清零
			player.setFouls(0);
			player.setScore(0);
			//统计
			for (int i=0;i<list.size();i++){
				RecordBean record=(RecordBean)list.get(i);
				if (record.getPlayerID()==player.getPlayerID()){
					String scorestr="score";
					String foulstr="foul";
					if (scorestr.equals(record.getEvent())){
						int tempscore=player.getScore();
						player.setScore(tempscore+1);
					}
					if (foulstr.equals(record.getEvent())){
						int tempfoul=player.getFouls();
						player.setFouls(tempfoul+1);
					}
				}
			}
		}
		return player;
	}
    

}
