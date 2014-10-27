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
	//建立数据连接
	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection) DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/db","root","1234");
			
		}catch(Exception e){
			System.out.println("数据库连接失败:"+e);
		}
		System.out.println("数据库连接成功");
		return con;
	}
	
	public static ResultSet query(String sql){
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try{
			conn=getConnection();
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
		}catch(SQLException e){
			System.out.println("查询失败:"+sql+e);
		}
		System.out.println("查询成功");
		return rs;
	}
	
	public static void update(String sql){
		Connection conn=null;
		Statement stmt=null;
		try{
			conn=getConnection();
			stmt=conn.createStatement();
			stmt.executeUpdate(sql);
		}catch(SQLException e){
			System.out.println("更新失败:"+sql+e);
		}
		System.out.println("更新成功"+sql);
	}
    //检查比赛表是否建立
	public static boolean isMatchRecordTableExist(String date,int homeTeamID,int awayTeamID){
		Connection conn=null;
		ResultSet rs=null;
		String tableName=String.format("gametable%s_%d_%d",date,homeTeamID,awayTeamID);
		try{
			conn=getConnection();
			DatabaseMetaData md=conn.getMetaData();
			rs=md.getTables(null, null,tableName, null);
			if (rs.next()){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			System.out.println("检查表存在出错"+e);
		}
		return false;
		
	}
	//建立比赛表并在比赛表中添加
	public static void createMatchRecordTable(String datestr,int homeTeamID,int awayTeamID){
		String sql=String.format("create table gametable%s_%d_%d"
				+"(PlayerID INTEGER,"
				+"Event VARCHAR(45),"
				+"Time DATETIME)",datestr,homeTeamID,awayTeamID);
		update(sql);
		//将日期格式从yyyyMMdd转换为yyyy-MM-dd，记录到数据库中与SQL的date类型匹配
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd",Locale.SIMPLIFIED_CHINESE);
		try {
			Date date = sdf.parse(datestr);
			sdf=new SimpleDateFormat("yyyy-MM-dd",Locale.SIMPLIFIED_CHINESE); 
			String datestr2=sdf.format(date);
			sql=String.format("INSERT INTO allgametable (HomeTeamID, AwayTeamID, Date) VALUES ('%d', '%d', '%s')",
					homeTeamID,awayTeamID,datestr2);
			DataBaseBean.update(sql);
		} catch (ParseException e) {
			System.out.println("日期转换出错");
		}
		
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
		return list;
	}
	//通过date和TeamID来获得比赛信息
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
			System.out.println("查询出错"+e);
		}
		return list;
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
			System.out.println("查询出错"+e);
		}
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
		} catch (SQLException e) {
			System.out.println("通过ID查询球员失败"+e);
		}
			
		return player;
	}
	/*
	 * 通过球队ID获得球员信息
	 * 返回全队球员信息
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
						                     (Integer)rs.getInt("Number")));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return list;
	}
}
