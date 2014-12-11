package com.hit.cs.basketball;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangePlayerState extends HttpServlet{

	public void doGet(HttpServletRequest request,HttpServletResponse response)
				throws ServletException,IOException{
		doPost(request,response);		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
				throws ServletException,IOException{
		int playerID=Integer.parseInt(request.getParameter("playerID"));
		int homeTeamID=Integer.parseInt(request.getParameter("homeTeamID"));
		int awayTeamID=Integer.parseInt(request.getParameter("awayTeamID"));
		String state=(String)request.getParameter("state");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd",Locale.SIMPLIFIED_CHINESE);
		String datestr=sdf.format(new Date());
		DataBaseBean.changePlayerState(playerID, homeTeamID, awayTeamID, datestr,state);
	}
}