package com.hit.cs.basketball;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;



public class LiveRefresh extends HttpServlet{

	public void doGet(HttpServletRequest request,HttpServletResponse response)
				throws ServletException,IOException{
		doPost(request,response);		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
				throws ServletException,IOException{
		int homeTeamID=Integer.parseInt(request.getParameter("homeTeamID"));
		int awayTeamID=Integer.parseInt(request.getParameter("awayTeamID"));
		ArrayList<PlayerBean> HomeTeamList=DataBaseBean.queryPlayerByTeamID(homeTeamID);
		ArrayList<PlayerBean> AwayTeamList=DataBaseBean.queryPlayerByTeamID(awayTeamID);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd",Locale.SIMPLIFIED_CHINESE);
		String datestr=sdf.format(new Date());
		//设置response
		response.setContentType("text/xml;charset=UTF-8");
		response.setHeader("Cache-Control","no-cache");
		PrintWriter out=response.getWriter();
		//读取球员信息并放入response中
		String output="";
		output+="<response>";
		for (int i=0;i<HomeTeamList.size();i++){
			///APlayer有效的数据仅仅是得分，犯规等技术统计
			PlayerBean APlayer=new PlayerBean();
			APlayer=Basketball.checkPlayerDataByIDAndDate(HomeTeamList.get(i).getPlayerID(), datestr);
			
			output+="<PlayerData>";
			output+="<PlayerID>"+HomeTeamList.get(i).getPlayerID()+"</PlayerID>";
			output+="<Score>"+APlayer.getScore()+"</Score>";
			output+="<Foul>"+APlayer.getFouls()+"</Foul>";
			output+="<TeamID>"+APlayer.getTeamID()+"</TeamID>";
			output+="</PlayerData>";
		}
		for (int i=0;i<AwayTeamList.size();i++){
			///APlayer有效的数据仅仅是得分，犯规等技术统计
			PlayerBean APlayer=new PlayerBean();
			APlayer=Basketball.checkPlayerDataByIDAndDate(AwayTeamList.get(i).getPlayerID(), datestr);
			
			output+="<PlayerData>";
			output+="<PlayerID>"+AwayTeamList.get(i).getPlayerID()+"</PlayerID>";
			output+="<Score>"+APlayer.getScore()+"</Score>";
			output+="<Foul>"+APlayer.getFouls()+"</Foul>";
			output+="<TeamID>"+APlayer.getTeamID()+"</TeamID>";
			output+="</PlayerData>";
		}
		output+="</response>";
		out.println(output);
		out.close();
	}
}
