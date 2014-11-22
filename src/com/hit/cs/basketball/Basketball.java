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
	 * ����:��ɽ��������¼Record.jsp��������ݿ⹤�������Ҷ�ȡ��Ա����
	 */
	public String enterRecording(){
		//����request�������ݿ��ѯ������Ա��Ϣ���͵�ǰ��
		HttpServletRequest request;
		request=ServletActionContext.getRequest();
		ArrayList<PlayerBean> listTeam1=new ArrayList<PlayerBean>();
		ArrayList<PlayerBean> listTeam2=new ArrayList<PlayerBean>();
		listTeam1=DataBaseBean.queryPlayerByTeamID(TeamID1);
		listTeam2=DataBaseBean.queryPlayerByTeamID(TeamID2);
		request.setAttribute("listTeam1", listTeam1);
		request.setAttribute("listTeam2", listTeam2);
		//����������
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd",Locale.SIMPLIFIED_CHINESE);
		String timeStr=sdf.format(new Date());
		//�Ȳ�ѯ�������¼���Ƿ�����������
		if (DataBaseBean.isMatchRecordTableExist(timeStr, TeamID1, TeamID2)==false){
			DataBaseBean.createMatchRecordTable(timeStr, TeamID1, TeamID2);			
		}
		//��ѯ��������Ա����ͳ�Ʊ��Ƿ�����������
		if (DataBaseBean.isPlayersRecordTableExist(timeStr,TeamID1,TeamID2)==false){
			DataBaseBean.createPlayersRecordTable(timeStr,TeamID1,TeamID2);
		}
		System.out.println(DataBaseBean.isMatchRecordTableExist(timeStr, TeamID1, TeamID2));
		return "success";
	}
	/*
	 * ����:��������ʵʱֱ��
	 */
	public String enterLive(){
		//����request�������ݿ��ѯ����Ա��Ϣ���͵�ǰ��
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
	 * ��Ա���֡����ڲ�ѯ��Ա���������ı��֣����ܻ�������������
	 * ���ù�request�෵��
	 * date ����ʽ��yyyyMMdd
	 * ��һ�ε�����ʱ��֧��������Ա
	 * �ظ�ʹ��PlayerBean�е����ݣ������ص�ʱ�����и���������ͳ�ƺ�Ľ��
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
			//������ͳ������
			player.setFouls(0);
			player.setScore(0);
			//ͳ��
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
	 * ͨ����ԱID���������ڲ�ѯ��Ա�������
	 */
	public static PlayerBean checkPlayerDataByIDAndDate(int playerID,String date){
		PlayerBean player=DataBaseBean.queryPlayerByID(playerID);
		if (player!=null){
			ArrayList list=new ArrayList();
			list=DataBaseBean.queryGameTableNameByDateAndTeamID(date, player.getTeamID());
			GameBean team=(GameBean)list.get(0);
			list=DataBaseBean.queryGameRecord(date, team.getHomeTeamID(), team.getAwayTeamID());
			//������ͳ������
			player.setFouls(0);
			player.setScore(0);
			//ͳ��
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
