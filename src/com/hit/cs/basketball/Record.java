package com.hit.cs.basketball;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Date;
import java.util.Locale;



public class Record extends HttpServlet{

	public void doGet(HttpServletRequest request,HttpServletResponse response)
				throws ServletException,IOException{
		doPost(request,response);		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
				throws ServletException,IOException{
		int playerID=Integer.parseInt(request.getParameter("playerID"));
		int homeTeamID=Integer.parseInt(request.getParameter("homeTeamID"));
		int awayTeamID=Integer.parseInt(request.getParameter("awayTeamID"));
		String event=request.getParameter("event");
		System.out.println(playerID+event);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd",Locale.SIMPLIFIED_CHINESE);
		String timeStr=sdf.format(new Date());
		Date date=new Date();
		Timestamp datetime=new Timestamp(date.getTime());
		//在当天的比赛表中记录
		String sql=String.format("insert into gametable%s_%d_%d(PlayerID,Event,Time)values('%d','%s','%s')",
				                 timeStr,homeTeamID,awayTeamID,playerID,event,datetime);
		DataBaseBean.update(sql);
		System.out.println(sql);
				                 
	}
}























