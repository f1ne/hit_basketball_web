package com.hit.cs.basketball;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Record extends HttpServlet{
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request,HttpServletResponse response)
				throws ServletException,IOException{
		doPost(request,response);
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
				throws ServletException,IOException{
		int playerID=Integer.parseInt(request.getParameter("playerID"));
		String event=request.getParameter("event");
		System.out.println(playerID+event);
	}
}
