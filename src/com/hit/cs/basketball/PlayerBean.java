package com.hit.cs.basketball;

public class PlayerBean {
	private int PlayerID;
	private int TeamID;
	private String Name;
	private String StudentID;
	private int Score;
	private int NumberOfMatches;
	private int Fouls;
	private int Number;
	PlayerBean(){
		this.PlayerID=-1;
		this.TeamID=-1;
		this.Name="null";
		this.StudentID="null";
		this.Score=-1;
		this.NumberOfMatches=-1;
		this.Fouls=-1;
		this.Number=-1;
	}
	PlayerBean(int playerID,int teamID,String name,String studentID,int score,
		int numberOfMatches,int fouls,int number){
		this.PlayerID=playerID;
		this.TeamID=teamID;
		this.Name=name;
		this.StudentID=studentID;
		this.Score=score;
		this.NumberOfMatches=numberOfMatches;
		this.Fouls=fouls;
		this.Number=number;
	}
	public int getPlayerID(){
		return PlayerID;
	}
	public void setPlayerID(int playerID){
		this.PlayerID=playerID;
	}
	public int getTeamID(){
		return TeamID;
	}
	public void setTeadID(int teamID){
		this.TeamID=teamID;
	}
	public String getName(){
		return Name;
	}
	public void setName(String name){
		this.Name=name;
	}
	public String getStudentID(){
		return StudentID;
	}
	public void setStudentID(String studentID){
		this.StudentID=studentID;
	}
	public int getScore(){
		return Score;
	}
	public void setScore(int score){
		this.Score=score;
	}
	public int getNumberOfMatches(){
		return NumberOfMatches;
	}
	public void setNumberOfMatches(int numberOfMatches){
		this.NumberOfMatches=numberOfMatches;
	}
	public int getFouls(){
		return Fouls;
	}
	public void setFouls(int fouls){
		this.Fouls=fouls;
	}
	public int getNumber(){
		return Number;
	}
	public void setNumber(int number){
		this.Number=number;
	}
}
