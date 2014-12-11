package com.hit.cs.basketball;

public class GameBean {
      private int GameID;
      private int HomeTeamID;
      private int AwayTeamID;
      private String Date;
      private int HomeScore;
      private int AwayScore;
      private int State;
      //为了兼容较早阶段的代码而保留的构造函数
      GameBean(int gameID,int homeTeamID,int awayTeamID,String date){
    	  setGameID(gameID);
    	  setHomeTeamID(homeTeamID);
    	  setAwayTeamID(awayTeamID);
    	  setDate(date);
    	  setHomeScore(0);
    	  setAwayScore(0);
    	  setState(0);
      }
      GameBean(int gameID,int homeTeamID,int awayTeamID,String date,int homeScore,int awayScore,int state){
    	  setGameID(gameID);
    	  setHomeTeamID(homeTeamID);
    	  setAwayTeamID(awayTeamID);
    	  setDate(date);
    	  setHomeScore(homeScore);
    	  setAwayScore(awayScore);
    	  setState(state);
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
      public int getHomeScore(){
    	  return HomeScore;
      }
      public void setHomeScore(int homeScore){
    	  this.HomeScore=homeScore;
      }
      public int getAwayScore(){
    	  return AwayScore;
      }
      public void setAwayScore(int awayScore){
    	  this.AwayScore=awayScore;
      }
      public int getState(){
    	  return State;
      }
      public void setState(int state){
    	  this.State=state;
      }
}
