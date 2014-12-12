package com.hit.cs.basketball;

public class TeamBean {
      private int TeamID;
      private String TeamName;
      private String TeamLab;
      private int TeamPlayerNum;
      TeamBean(int teamID,String teamName,String teamLab,int teamPlayerNum){
    	  setTeamID(teamID);
    	  setTeamName(teamName);
    	  setTeamLab(teamLab);
    	  setTeamPlayerNum(teamPlayerNum);
      }
      public void setTeamID(int teamID){
    	  this.TeamID=teamID;
      }
      public int getTeamID(){
    	  return TeamID;
      }
      public void setTeamName(String teamName){
    	  this.TeamName=teamName;
      }
      public String getTeamName(){
    	  return TeamName;
      }
      public void setTeamLab(String teamLab){
    	  this.TeamLab=teamLab;
      }
      public String getTeamLab(){
    	  return TeamLab;
      }
      public void setTeamPlayerNum(int teamPlayerNum){
    	  this.TeamPlayerNum=teamPlayerNum;
      }
      public int getTeamPlayerNum(){
    	  return TeamPlayerNum;
      }
}
