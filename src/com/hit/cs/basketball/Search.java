package com.hit.cs.basketball;

public class Search {
	Basketball Basketball;
	TeamBean Team;
	PlayerBean Player;
	public String searchplayer(){
		 String str=Player.getName();
		 String date=Team.getDate();
		 System.out.println("queryPlayer"+str);
		Player=Basketball.checkPlayerDataWithDate(str, date);
		int Score=Player.getScore();
		request.setAttribute("Score",Score);
		return "Search";
	}

}

