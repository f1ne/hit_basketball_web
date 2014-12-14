package com.hit.cs.basketball;

import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

public class DataBaseBean {
	public static Connection conn;
	public static Statement stmt;
	public static ResultSet rs;
	//建立数据连接
	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			//<-----------------------本地数据库--------------------------->
			//con=(Connection) DriverManager.getConnection(
			//		"jdbc:mysql://localhost:3306/db","root","csm0212");
			//<-----------------------SAE端数据库-------------------------->
			String accesskey="k00152n2my";
    		String secretkey="mk3wwz5w1552xxlhh1kl043j1yz513l3ii0ikh22";
    		con=DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_guangxibei",accesskey,secretkey);
		    //<--------------------------------------------------------->
		}catch(Exception e){
			System.out.println("Connecting to database failed!:"+e);
		}
		System.out.println("Connected!");
		return con;
	}
	
	public static ResultSet query(String sql){
		conn = null;
		stmt=null;
		rs=null;
		try{
			conn=getConnection();
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
		}catch(SQLException e){
			System.out.println("Querying failed:"+sql+e);
		}
		System.out.println("Querying succcess");
		return rs;
	}
	
	public static void update(String sql){
		conn=null;
		stmt=null;
		try{
			conn=getConnection();
			stmt=conn.createStatement();
			stmt.executeUpdate(sql);
		}catch(SQLException e){
			System.out.println("Updating failed:"+sql+e);
		}
		closeDBConnection();
		System.out.println("Updating success"+sql);
	}
	public static void closeDBConnection(){
		//关闭连接对象
		if (rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println(e);
			}
		}
		if (stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				System.out.println(e);
			}
		}
		if (conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println(e);
			}
		}
	}
    //检查比赛记录表是否建立
	public static boolean isMatchRecordTableExist(String date,int homeTeamID,int awayTeamID){
		Connection conn=null;
		ResultSet rs=null;
		String tableName=String.format("gametable%s_%d_%d",date,homeTeamID,awayTeamID);
		try{
			conn=getConnection();
			DatabaseMetaData md=conn.getMetaData();
			rs=md.getTables(null, null,tableName, null);
			closeDBConnection();
			if (rs.next()){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			System.out.println("There is something wrong with Checking Game Table"+e);
		}
		closeDBConnection();
		return false;
		
	}
	//检查球员记录表是否建立
	public static boolean isPlayersRecordTableExist(String date,int homeTeamID,int awayTeamID){
		Connection conn=null;
		ResultSet rs=null;
		String tableName=String.format("playerstable%s_%d_%d",date,homeTeamID,awayTeamID);
		try{
			conn=getConnection();
			DatabaseMetaData md=conn.getMetaData();
			rs=md.getTables(null, null,tableName, null);
			closeDBConnection();
			if (rs.next()){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			System.out.println("There is something wrong with Checking Player Table"+e);
		}
		return false;
		
	}
	//建立比赛记录表并在比赛表中添加
	public static void createMatchRecordTable(String datestr,int homeTeamID,int awayTeamID){
		String sql=String.format("create table gametable%s_%d_%d"
				+"(PlayerID INTEGER,"
				+"Event VARCHAR(45),"
				+"Time DATETIME)",datestr,homeTeamID,awayTeamID);
		update(sql);
		closeDBConnection();
		//将日期格式从yyyyMMdd转换为yyyy-MM-dd，记录到数据库中与SQL的date类型匹配
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd",Locale.SIMPLIFIED_CHINESE);
		try {
			Date date = sdf.parse(datestr);
			sdf=new SimpleDateFormat("yyyy-MM-dd",Locale.SIMPLIFIED_CHINESE); 
			String datestr2=sdf.format(date);
			sql=String.format("INSERT INTO allgametable (HomeTeamID, AwayTeamID, Date) VALUES ('%d', '%d', '%s')",
					homeTeamID,awayTeamID,datestr2);
			DataBaseBean.update(sql);
			closeDBConnection();
		} catch (ParseException e) {
			System.out.println("Transfering date failed");
		}
		
	}
	//建立球员记录表
	public static void createPlayersRecordTable(String datestr,int homeTeamID,int awayTeamID){
		String sql=String.format("create table playerstable%s_%d_%d select * from players "
				+ "where TeamID='%d' or TeamID='%d'"
				,datestr,homeTeamID,awayTeamID,homeTeamID,awayTeamID);
		update(sql);
		closeDBConnection();
		//添加一个列记录球员当前的状态
		sql=String.format("ALTER TABLE playerstable%s_%d_%d ADD COLUMN State VARCHAR(45) NULL "
				+ "DEFAULT 'bench' AFTER IsSHB",datestr,homeTeamID,awayTeamID);
		update(sql);
		closeDBConnection();
		//重置得分、犯规、状态
		sql=String.format("update playerstable%s_%d_%d "
				+ "set Score=0,Fouls=0,State='bench'",datestr,homeTeamID,awayTeamID);
		update(sql);
		closeDBConnection();
	}
    //通过球员名字查询球员信息
	public static ArrayList<PlayerBean> queryPlayerByName(String name){
		ArrayList<PlayerBean> list=new ArrayList<PlayerBean>();
		ResultSet rs=null;
		String sql=String.format("select * from players where Name='%s'",name);
		rs=query(sql);
		try {
			while (rs.next()){
				int PlayerID=rs.getInt("PlayerID");
				int TeamID=rs.getInt("TeamID");
				String Name=rs.getString("Name");
				String StudentID=rs.getString("StudentID");
				int Score=rs.getInt("Score");
				int NumberOfMatches=rs.getInt("NumberOfMatches");
				int Fouls=rs.getInt("Fouls");
				int Number=rs.getInt("Number");
				list.add(new PlayerBean(PlayerID,TeamID,Name,StudentID,Score,NumberOfMatches,Fouls,Number));
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("查询出错"+e);
		}
		closeDBConnection();
		return list;
	}
	/*
	 * 通过date和TeamID来获得比赛信息
	 * 返回的信息是一个ArrayList，其中的元素的数据类型是GameBean
	 */
	public static ArrayList<GameBean> queryGameTableNameByDateAndTeamID(String datestr,int TeamID){
		ArrayList<GameBean> list=new ArrayList<GameBean>();
		ResultSet rs=null;
		String sql=String.format("select * from allgametable where Date='%s' and (HomeTeamID='%d' or AwayTeamID='%d')",
				                 datestr,TeamID,TeamID);
		rs=query(sql);
		try {
			while (rs.next()){
				int GameID=rs.getInt("GameID");
				int HomeTeamID=rs.getInt("HomeTeamID");
				int AwayTeamID=rs.getInt("AwayTeamID");
				String Date=(rs.getDate("Date")).toString();
				list.add(new GameBean(GameID,HomeTeamID,AwayTeamID,Date));
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("Querying game information failed!"+e);
		}
		closeDBConnection();
		return list;
	}
    /*
     * To get all games list of a team by teamid
     */
	public static ArrayList<GameBean> getGameTableByTeamID(int TeamID){
		ArrayList<GameBean> list=new ArrayList<GameBean>();
		ResultSet rs=null;
		String sql=String.format("select * from allgametable where (HomeTeamID='%d' or AwayTeamID='%d')",
				                 TeamID,TeamID);
		rs=query(sql);
		try {
			while (rs.next()){
				int GameID=rs.getInt("GameID");
				int HomeTeamID=rs.getInt("HomeTeamID");
				int AwayTeamID=rs.getInt("AwayTeamID");
				String Date=(rs.getDate("Date")).toString();
				list.add(new GameBean(GameID,HomeTeamID,AwayTeamID,Date));
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("Querying game information failed!"+e);
		}
		closeDBConnection();
		return list;
	}
	/*
     * To get a game information by homeTeamID,awayTeamID and date
     */
	public static GameBean getGameTable(int homeTeamID,int awayTeamID,String date){
		GameBean game = null;
		ResultSet rs=null;
		String sql=String.format("select * from allgametable where (HomeTeamID='%d' and AwayTeamID='%d' and Date='%s')",
				                 homeTeamID,awayTeamID,date);
		rs=query(sql);
		try {
			if (rs.next()){
				int GameID=rs.getInt("GameID");
				int HomeTeamID=rs.getInt("HomeTeamID");
				int AwayTeamID=rs.getInt("AwayTeamID");
				String Date=(rs.getDate("Date")).toString();
				int HomeScore=rs.getInt("HomeScore");
				int AwayScore=rs.getInt("AwayScore");
				int State=rs.getInt("State");
				game=new GameBean(GameID,HomeTeamID,AwayTeamID,Date,HomeScore,AwayScore,State);
				return game;
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("Querying game information failed!"+e);
		}
		closeDBConnection();
		return game;
	}
	//通过一个日期和主队客队id来查找比赛表返回比赛记录
	public static ArrayList<RecordBean> queryGameRecord(String date,int homeTeamID,int awayTeamID){
		ArrayList<RecordBean> list=new ArrayList<RecordBean>();
		ResultSet rs=null;
		String sql=String.format("select * from gametable%s_%d_%d",date,homeTeamID,awayTeamID);
		rs=query(sql);
		try {
			while (rs.next()){
				int PlayerID=rs.getInt("PlayerID");
				String Event=rs.getString("Event");
				Timestamp Time=rs.getTimestamp("Time");
				list.add(new RecordBean(PlayerID,Event,Time));
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("Querying game information failed"+e);
		}
		closeDBConnection();
		return list;
	}
	/*
	 * 通过球员ID获得球员信息
	 */
	public static PlayerBean queryPlayerByID(int playerID){
		PlayerBean player=null;
		ResultSet rs=null;
		String sql=String.format("select * from players where PlayerID='%d'",playerID);
		rs=query(sql);
		try {
			while(rs.next()){
				int PlayerID=rs.getInt("PlayerID");
				int TeamID=rs.getInt("TeamID");
				String Name=rs.getString("Name");
				String StudentID=rs.getString("StudentID");
				int Score=rs.getInt("Score");
				int NumberOfMatches=rs.getInt("NumberOfMatches");
				int Fouls=rs.getInt("Fouls");
				int Number=rs.getInt("Number");
				player=new PlayerBean(PlayerID,TeamID,Name,StudentID,Score,NumberOfMatches,Fouls,Number);
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("Querying player by ID failed"+e);
		}
		closeDBConnection();	
		return player;
	}
	/*
	 * Get information of players of a team by querying TeamID
	 */
	public static ArrayList<PlayerBean> queryPlayerByTeamID(int TeamID){
		ArrayList<PlayerBean> list=new ArrayList<PlayerBean>();
		String sql="select * from players where TeamID='"+TeamID+"'";
		ResultSet rs=DataBaseBean.query(sql);
		try {
			while (rs.next()){
				list.add(new PlayerBean((Integer)rs.getInt("PlayerID"),
						                     (Integer)rs.getInt("TeamID"),
						                     (String)rs.getString("Name"),
						                     (String)rs.getString("StudentID"),
						                     (Integer)rs.getInt("Score"),
						                     (Integer)rs.getInt("NumberOfMatches"),
						                     (Integer)rs.getInt("Fouls"),
						                     (Integer)rs.getInt("Number"),
						                     (String)rs.getString("Sex"),
						                     (Integer)rs.getInt("Age"),
						                     (String)rs.getString("IsSHB"),
						                     (String)rs.getString("Position")));
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		closeDBConnection();
		return list;
	}
	/*
	 * take the score top 10 players
	 */
	public static ArrayList<PlayerBean> getPlayersOrderedByScore(){
		ArrayList<PlayerBean> list=new ArrayList<PlayerBean>();
		String sql="select * from players order by Score DESC limit 10";
		ResultSet rs=DataBaseBean.query(sql);
		try {
			while (rs.next()){
				list.add(new PlayerBean((Integer)rs.getInt("PlayerID"),
						                     (Integer)rs.getInt("TeamID"),
						                     (String)rs.getString("Name"),
						                     (String)rs.getString("StudentID"),
						                     (Integer)rs.getInt("Score"),
						                     (Integer)rs.getInt("NumberOfMatches"),
						                     (Integer)rs.getInt("Fouls"),
						                     (Integer)rs.getInt("Number")));
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		closeDBConnection();
		return list;
	}
	/*
	 * Get the all players list
	 */
	public static ArrayList<PlayerBean> getAllPlayersList(){
		ArrayList<PlayerBean> list=new ArrayList<PlayerBean>();
		String sql="select * from players";
		ResultSet rs=DataBaseBean.query(sql);
		try {
			while (rs.next()){
				list.add(new PlayerBean((Integer)rs.getInt("PlayerID"),
						                     (Integer)rs.getInt("TeamID"),
						                     (String)rs.getString("Name"),
						                     (String)rs.getString("StudentID"),
						                     (Integer)rs.getInt("Score"),
						                     (Integer)rs.getInt("NumberOfMatches"),
						                     (Integer)rs.getInt("Fouls"),
						                     (Integer)rs.getInt("Number")));
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		closeDBConnection();
		return list;
	} 
	/*
     * Get a player data by date directly from playerstable
     */
    public static PlayerBean getPlayerDataByDate(int PlayerID,String date,int homeTeamID,int awayTeamID){
    	PlayerBean player=null;
    	String sql=String.format("select * from playerstable%s_%d_%d where PlayerID='%d'",
    			date,homeTeamID,awayTeamID,PlayerID);
    	ResultSet rs=DataBaseBean.query(sql);
    	try {
    		if (rs.next()){
    			player=new PlayerBean((Integer)rs.getInt("PlayerID"),
    					(Integer)rs.getInt("TeamID"),
    					(String)rs.getString("Name"),
    					(String)rs.getString("StudentID"),
    					(Integer)rs.getInt("Score"),
    					(Integer)rs.getInt("NumberOfMatches"),
    					(Integer)rs.getInt("Fouls"),
    					(Integer)rs.getInt("Number"),
    					(String)rs.getString("State"));
    		}
    		rs.close();
    	} catch (SQLException e) {
    		System.out.println(e);
    	}
    	closeDBConnection();
    	return player;
    }
    /*
     * Date format transfer function
     * model=1 则从yyyy-MM-dd 转为 yyyyMMdd
     * model=2 则从yyyyMMdd转为yyyy-MM-dd
     */
    public static String dateFormatTransfer(String date,int model){
    	String targetStr="";
    	if (model==1){
    		String[] splitStr=date.split("-");
    		targetStr=splitStr[0]+splitStr[1]+splitStr[2];
    	}
    	if (model==2){
    	   targetStr="";
    	   String yyyy=date.substring(0, 4);
    	   String mm=date.substring(4,6);
    	   String dd=date.substring(6,8);
    	   targetStr=yyyy+"-"+mm+"-"+dd;
    	}
    	if (model==3){
    	   targetStr="";
     	   String yyyy=date.substring(0, 4);
     	   String mm=date.substring(4,6);
     	   String dd=date.substring(6,8);
     	   targetStr=yyyy+"年"+mm+"月"+dd+"日";
    	}
    	return targetStr;
    }
    public static void changePlayerState(int playerID,int homeTeamID,int awayTeamID,String date,String state){
    	//Update data in table playerstable
    	String sql=String.format("update playerstable%s_%d_%d set State='%s' where PlayerID='%d'",
    			date,homeTeamID,awayTeamID,state,playerID);
    	DataBaseBean.update(sql);
    	closeDBConnection();
    }
    public static void changeGameState(int homeTeamID,int awayTeamID,int homeScore,int awayScore,String date,int state){
    	String sql="";
    	if (state!=100){
    		sql=String.format("update allgametable set State='%d',HomeScore='%d',AwayScore='%d' "
        			+ "where (HomeTeamID='%d' and AwayTeamID='%d' and Date='%s')", 
        			state,homeScore,awayScore,homeTeamID,awayTeamID,date);
    	}else{
    		sql=String.format("update allgametable set HomeScore='%d',AwayScore='%d' "
        			+ "where (HomeTeamID='%d' and AwayTeamID='%d' and Date='%s')", 
        			homeScore,awayScore,homeTeamID,awayTeamID,date);
    	}   	
    	update(sql);
    	closeDBConnection();
    }
    /*
     * 获得进行中的比赛
     */
    public static ArrayList<GameBean> getRunningGames(){
    	ArrayList<GameBean> list=new ArrayList<GameBean>();
    	String sql="select * from allgametable where (State>'0' and State<'7')";
    	rs=query(sql);
    	try {
			while(rs.next()){
				list.add(new GameBean((Integer)rs.getInt("GameID"),
						(Integer)rs.getInt("HomeTeamID"),
						(Integer)rs.getInt("AwayTeamID"),
						(String)rs.getString("Date"),
						(Integer)rs.getInt("HomeScore"),
						(Integer)rs.getInt("AwayScore"),
						(Integer)rs.getInt("State")));
				
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
    	closeDBConnection();
    	return list;
    }
    public static ArrayList<GameBean> getNotEndGames(){
    	ArrayList<GameBean> list=new ArrayList<GameBean>();
    	String sql="select * from allgametable where State<'7'";
    	rs=query(sql);
    	try {
			while(rs.next()){
				list.add(new GameBean((Integer)rs.getInt("GameID"),
						(Integer)rs.getInt("HomeTeamID"),
						(Integer)rs.getInt("AwayTeamID"),
						(String)rs.getString("Date"),
						(Integer)rs.getInt("HomeScore"),
						(Integer)rs.getInt("AwayScore"),
						(Integer)rs.getInt("State")));
				
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
    	closeDBConnection();
    	return list;
    }
    public static ArrayList<GameBean> getEndGames(){
    	ArrayList<GameBean> list=new ArrayList<GameBean>();
    	String sql="select * from allgametable where State='7'";
    	rs=query(sql);
    	try {
			while(rs.next()){
				list.add(new GameBean((Integer)rs.getInt("GameID"),
						(Integer)rs.getInt("HomeTeamID"),
						(Integer)rs.getInt("AwayTeamID"),
						(String)rs.getString("Date"),
						(Integer)rs.getInt("HomeScore"),
						(Integer)rs.getInt("AwayScore"),
						(Integer)rs.getInt("State")));
				
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
    	closeDBConnection();
    	return list;
    }
    /*
     * 获得全队某天的数据统计
     * Date:yyyyMMdd
     */
    public static ArrayList<PlayerBean> getPlayerDataByTeamIDAndDate(int teamID,String date){
    	ArrayList<PlayerBean> list=new ArrayList<PlayerBean>();
    	//先找到该比赛表信息
    	ArrayList<GameBean> gameslist=queryGameTableNameByDateAndTeamID(date,teamID);
    	int HomeTeamID;
    	int AwayTeamID;
        if (gameslist.size()>0){
        	GameBean game=(GameBean)gameslist.get(0);
        	HomeTeamID=game.getHomeTeamID();
        	AwayTeamID=game.getAwayTeamID();
        	String sql=String.format("select * from playerstable%s_%d_%d where TeamID='%d'",
        	       date,HomeTeamID,AwayTeamID,teamID);
        	rs=query(sql);
        	try {
				while(rs.next()){
					list.add(new PlayerBean((Integer)rs.getInt("PlayerID"),
		                     (Integer)rs.getInt("TeamID"),
		                     (String)rs.getString("Name"),
		                     (String)rs.getString("StudentID"),
		                     (Integer)rs.getInt("Score"),
		                     (Integer)rs.getInt("NumberOfMatches"),
		                     (Integer)rs.getInt("Fouls"),
		                     (Integer)rs.getInt("Number"),
		                     (String)rs.getString("Sex"),
		                     (Integer)rs.getInt("Age"),
		                     (String)rs.getString("IsSHB"),
		                     (String)rs.getString("Position")));
				}
			} catch (SQLException e) {
				System.out.println(e);
			}
        	closeDBConnection();
        }
        
    	return list;
    }
}
