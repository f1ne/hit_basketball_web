package com.hit.cs.basketball;

import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataBaseBean {
	//������������
	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection) DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/basketball","root","1234");
			
		}catch(Exception e){
			System.out.println("���ݿ�����ʧ��:"+e);
		}
		System.out.println("���ݿ����ӳɹ�");
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
			System.out.println("��ѯʧ��:"+sql+e);
		}
		System.out.println("��ѯ�ɹ�");
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
			System.out.println("����ʧ��:"+sql+e);
		}
		System.out.println("���³ɹ�"+sql);
	}
    //���������Ƿ���
	public static boolean isMatchRecordTableExist(String date,int homeTeamID,int awayTeamID){
		Connection conn=null;
		ResultSet rs=null;
		String tableName=String.format("GAMETABLE%s_%d_%d",date,homeTeamID,awayTeamID);
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
			System.out.println("������ڳ���"+e);
		}
		return false;
		
	}
	//����������
	public static void createMatchRecordTable(String date,int homeTeamID,int awayTeamID){
		String sql=String.format("create table GAMETABLE%s_%d_%d"
				+"(PlayerID INTEGER,"
				+"Event VARCHAR(45),"
				+"Time DATETIME)",date,homeTeamID,awayTeamID);
		update(sql);
	}
}
