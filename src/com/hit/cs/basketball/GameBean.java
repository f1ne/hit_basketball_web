package com.hit.cs.basketball;

public class GameBean {
      private int GameID;
      private int HomeTeamID;
      private int AwayTeamID;
      private String Date;
      GameBean(int gameID,int homeTeamID,int awayTeamID,String date){
    	  setGameID(gameID);
    	  setHomeTeamID(homeTeamID);
    	  setAwayTeamID(awayTeamID);
    	  setDate(date);
      }
      public void setGameID(int gameID){
    	  this.GameID=gameID;
      }
      public int getGameID(){
    	  return GameID;
      }
      public void setHomeTeamID(int homeTeamID){
    	  this.HomeTeamID=homeTeamID;
      }
      public int getHomeTeamID(){
    	  return HomeTeamID;
      }
      public void setAwayTeamID(int awayTeamID){
    	  this.AwayTeamID=awayTeamID;
      }
      public int getAwayTeamID(){
    	  return AwayTeamID;
      }
      public void setDate(String date){
    	  this.Date=date;
      }
      public String getDate(){
    	  return Date;
      }
}
