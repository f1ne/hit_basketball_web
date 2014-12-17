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
	private int TeamID1;//HomeTeamID
	private int TeamID2;//AwayTeamID
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
		if (TeamID1==0||TeamID2==0) return "fail";
		HttpServletRequest request;
		request=ServletActionContext.getRequest();
		ArrayList<PlayerBean> listTeam1=new ArrayList<PlayerBean>();
		ArrayList<PlayerBean> listTeam2=new ArrayList<PlayerBean>();
		listTeam1=DataBaseBean.queryPlayerByTeamID(TeamID1);
		listTeam2=DataBaseBean.queryPlayerByTeamID(TeamID2);
		request.setAttribute("listTeam1", listTeam1);
		request.setAttribute("listTeam2", listTeam2);
		//获得日期并检查是否是当天的比赛
		String timeStr=RaceDate;
		if (RaceDate.equals("0")){
			//建立比赛表
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd",Locale.SIMPLIFIED_CHINESE);
	        timeStr=sdf.format(new Date());
		}else
		{
			timeStr=DataBaseBean.dateFormatTransfer(timeStr, 1);
		}
		
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
     * 查询结束比赛的数据统计
     */
    public String GameStatistic(){
    	HttpServletRequest request;
		request=ServletActionContext.getRequest();
		RaceDate=DataBaseBean.dateFormatTransfer(RaceDate, 1);
		ArrayList<PlayerBean> listTeam1=new ArrayList<PlayerBean>();
		ArrayList<PlayerBean> listTeam2=new ArrayList<PlayerBean>();
		listTeam1=DataBaseBean.getPlayerDataByTeamIDAndDate(TeamID1, RaceDate);
		listTeam2=DataBaseBean.getPlayerDataByTeamIDAndDate(TeamID2,RaceDate);
		//获得球队信息
		TeamBean Team1=getTeamByTeamID(TeamID1);
		TeamBean Team2=getTeamByTeamID(TeamID2);
		//获得比赛信息
		GameBean game=(GameBean)DataBaseBean.queryGameTableNameByDateAndTeamID(RaceDate, TeamID1).get(0);
		request.setAttribute("listTeam1", listTeam1);
		request.setAttribute("listTeam2", listTeam2);
		request.setAttribute("Team1",Team1);
		request.setAttribute("Team2",Team2);
		request.setAttribute("game", game);
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
					String cancelfoulstr="CancelFouls";
					String cancelscorestr="CancelScore";
					if (scorestr.equals(record.getEvent())){
						int tempscore=player.getScore();
						player.setScore(tempscore+1);
					}
					if (foulstr.equals(record.getEvent())){
						int tempfoul=player.getFouls();
						player.setFouls(tempfoul+1);
					}
					if (cancelscorestr.equals(record.getEvent())){
						int tempscore=player.getScore();
						player.setScore(tempscore-1);
					}
					if (cancelfoulstr.equals(record.getEvent())){
						int tempfoul=player.getFouls();
						player.setFouls(tempfoul-1);
					}
				}
			}
		}
		return player;
	}
	/*这是通过比赛日志表整理统计出的记录
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
	 * 查询某场比赛中的球员表现
	 * 需要提供的输入有球员的id以及比赛日期
	 * 这是通过查询每场比赛的球员状态总表获得比赛信息
	 */
	public static PlayerBean getPlayerInfByIDAndDate(int playerID,String date){
		PlayerBean player=DataBaseBean.queryPlayerByID(playerID);
		date=DataBaseBean.dateFormatTransfer(date, 2);
		ArrayList<GameBean> list=DataBaseBean.queryGameTableNameByDateAndTeamID(date,player.getTeamID());
		GameBean game=(GameBean)list.get(0);
		date=DataBaseBean.dateFormatTransfer(date, 1);
		player=DataBaseBean.getPlayerDataByDate(player.getPlayerID(), date, game.getHomeTeamID(), game.getAwayTeamID());
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
    public static ArrayList<PlayerBean> getPlayersDataByPlayerNameAndDate(String playerName,String date){
    	ArrayList<PlayerBean> list=new ArrayList<PlayerBean>();
    	//用于保存查到的同一个名字的所有球员
    	ArrayList<PlayerBean> list2=new ArrayList<PlayerBean>();
    	list2=DataBaseBean.queryPlayerByName(playerName);
    	for (int i=0;i<list2.size();i++){
    		PlayerBean playerdata=new PlayerBean();
    		playerdata=(PlayerBean)list2.get(i);
    		int playerID=playerdata.getPlayerID();
    		playerdata=getPlayerInfByIDAndDate(playerID,date);
    		list.add(playerdata);
    	}
    	return list;
    }
    public static TeamBean getTeamByTeamID(int teamID){
    	TeamBean team=null;
    	String sql=String.format("select * from team where ID='%d'",teamID);
    	ResultSet rs=DataBaseBean.query(sql);
    	try {
			if (rs.next()){
				int ID=rs.getInt("ID");
				String teamName=rs.getString("Name");
				String teamLab=rs.getString("Lab");
				int playerNum=rs.getInt("PlayerNum");
				team=new TeamBean(ID,teamName,teamLab,playerNum);
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
    	return team;
    }
    /*
     * 将int类的状态转为文字
     */
    public static String resolveState(int state){
    	String stateStr="";
    	if (state==0){
    		stateStr="未进行";
    	}
    	if (state==1){
    		stateStr="第一节";
    	}
    	if (state==2){
    		stateStr="第二节";
    	}
    	if (state==3){
    		stateStr="中场女生投篮比赛";
    	}
    	if (state==4){
    		stateStr="第三节";
    	}
    	if (state==5){
    		stateStr="第四节";
    	}
    	if (state==6){
    		stateStr="加时赛";
    	}
    	if (state==7){
    		stateStr="结束比赛";
    	}
    	return stateStr;
    }
    
}
