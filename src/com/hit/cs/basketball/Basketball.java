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
	private String PlayerName;
	private String RaceDate;
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
	public void setPlayerName(String playerName){
		this.PlayerName=playerName;
	}
	public String getPlayerName(){
		return this.PlayerName;
	}
	public void setRaceDate(String RaceDate){
		this.RaceDate=RaceDate;
	}
	public String getRaceDate(){
		return this.RaceDate;
	}
	/*
	 * 功能:完成进入比赛记录Record.jsp界面的数据库工作，并且读取球员名单
	 */
	public String enterRecording(){
		//建立request将从数据库查询到的球员信息发送到前端
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
		//先查询比赛表记录表是否建立，否则建立
		if (DataBaseBean.isMatchRecordTableExist(timeStr, TeamID1, TeamID2)==false){
			DataBaseBean.createMatchRecordTable(timeStr, TeamID1, TeamID2);			
		}
		//查询比赛表球员数据统计表是否建立，否则建立
		if (DataBaseBean.isPlayersRecordTableExist(timeStr,TeamID1,TeamID2)==false){
			DataBaseBean.createPlayersRecordTable(timeStr,TeamID1,TeamID2);
		}
		System.out.println(DataBaseBean.isMatchRecordTableExist(timeStr, TeamID1, TeamID2));
		return "success";
	}
	/*
	 * 功能:进入数据实时直播
	 */
	public String enterLive(){
		//建立request将从数据库查询的球员信息发送到前端
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
					String scorestr="Score";
					String foulstr="Fouls";
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
					String scorestr="Score";
					String foulstr="Fouls";
					String cancelScore="CancelScore";
					String cancelFouls="CancelFouls";
					if (scorestr.equals(record.getEvent())){
						int tempscore=player.getScore();
						player.setScore(tempscore+1);
					}
					if (cancelScore.equals(record.getEvent())){
						int tempscore=player.getScore();
						player.setScore(tempscore-1);
					}
					if (foulstr.equals(record.getEvent())){
						int tempfoul=player.getFouls();
						player.setFouls(tempfoul+1);
					}
					if (cancelFouls.equals(record.getEvent())){
						int tempfoul=player.getFouls();
						player.setFouls(tempfoul-1);
					}
				}
			}
		}
		return player;
	}
    /*
     * Get the player data by race date 
     */
    public String getPlayerDataByDate(){
    	HttpServletRequest request;
		request=ServletActionContext.getRequest();
		PlayerBean player=checkPlayerDataWithDate(getPlayerName(),getRaceDate());
		System.out.println(getPlayerName()+getRaceDate());
		request.setAttribute("player", player);
    	return "success";
    }
    /*
     * Get score ranking board
     */
    public String getRankingBoard(){
    	ArrayList list=new ArrayList();
    	list=DataBaseBean.getPlayersOrderedByScore();
    	HttpServletRequest request;
		request=ServletActionContext.getRequest();
		request.setAttribute("RankingList",list);
    	return "success";
    }
    /*
     * Get the today score rank board limit 10 players
     */
    public String getRangkingBoardOfToday(){
    	
    	return "success";
    }
    /*
     * Update everyday game data to the players table
     */
    public String updateAllGameData(){
    	ArrayList<PlayerBean> allplayers=new ArrayList<PlayerBean>();
    	ArrayList<GameBean> gamelist=new ArrayList<GameBean>();
    	allplayers=DataBaseBean.getAllPlayersList();
    	int Num_Games;
    	int Score;
    	int Foul;
    	for (int i=0;i<allplayers.size();i++){
    		PlayerBean player=new PlayerBean();
    		player=allplayers.get(i);
    		gamelist=DataBaseBean.getGameTableByTeamID(player.getTeamID());
    		Num_Games=gamelist.size();
    		Score=0;
    		Foul=0;
    		for (int j=0;j<gamelist.size();j++){
    			PlayerBean playerdata=new PlayerBean();
    			playerdata=DataBaseBean.getPlayerDataByDate(
    					player.getPlayerID(),
    					DataBaseBean.dateFormatTransfer(gamelist.get(j).getDate(),1),
    					gamelist.get(j).getHomeTeamID(),
    					gamelist.get(j).getAwayTeamID());
    			Score+=playerdata.getScore();
    			Foul+=playerdata.getFouls();
    		}
    		String sql=String.format("update players set Score='%d',Fouls='%d',NumberOfMatches='%d' where PlayerID='%d'",
    				Score,Foul,Num_Games,player.getPlayerID());
    		DataBaseBean.update(sql);
    	}
    	return "success";
    }
    
}
