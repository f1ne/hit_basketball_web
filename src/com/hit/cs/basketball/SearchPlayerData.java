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



public class SearchPlayerData extends HttpServlet{

	public void doGet(HttpServletRequest request,HttpServletResponse response)
				throws ServletException,IOException{
		doPost(request,response);		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
				throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		String playerName=request.getParameter("playerName").toString();
		System.out.println(playerName);
		//<------本地数据库代码------->用于sae上的话该代码需要删去
		playerName=java.net.URLEncoder.encode(playerName, "ISO-8859-1");
		playerName=java.net.URLDecoder.decode(playerName,"UTF-8");
		//<---------------------------->
		String raceDate=request.getParameter("raceDate").toString();
		ArrayList<PlayerBean> list=new ArrayList<PlayerBean>();
		list=Basketball.getPlayersDataByPlayerNameAndDate(playerName, raceDate);
		response.setContentType("text/xml;charset=UTF-8");
		response.setHeader("Cache-Control","no-cache");
		PrintWriter out=response.getWriter();
		//读取球员信息并放入response中
		String output="";
		output+="<response>";
		for (int i=0;i<list.size();i++){
			///APlayer有效的数据仅仅是得分，犯规等技术统计
			PlayerBean APlayer=new PlayerBean();
			APlayer=list.get(i);		
			output+="<PlayerData>";
			output+="<PlayerID>"+APlayer.getPlayerID()+"</PlayerID>";			
			output+="<Score>"+APlayer.getScore()+"</Score>";
			output+="<Foul>"+APlayer.getFouls()+"</Foul>";
			output+="<TeamID>"+APlayer.getTeamID()+"</TeamID>";
			
			output+="<State>"+APlayer.getState()+"</State>";
			output+="<PlayerName>"+APlayer.getName()+"</PlayerName>";
			//获得球队的信息
			TeamBean team=Basketball.getTeamByTeamID(APlayer.getTeamID());
			output+="<TeamName>"+team.getTeamName()+"</TeamName>";
			output+="<TeamLab>"+team.getTeamLab()+"</TeamLab>";
			output+="</PlayerData>";
		}
		output+="</response>";
		out.println(output);
		out.close();
	}
}
